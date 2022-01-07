class AddUniqueContraintToEmailSubscribers < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    # delete existing duplicates. Reference: https://wiki.postgresql.org/wiki/Deleting_duplicates
    results = execute <<~SQL
          DELETE FROM newsletter_subscribers
      WHERE id IN (
          SELECT
              id
          FROM (
              SELECT
                  id,
                  row_number() OVER w as rnum
              FROM newsletter_subscribers
              WINDOW w AS (
                  PARTITION BY lower(trim(email))
                  ORDER BY id
              )
          ) t
      WHERE t.rnum > 1);
    SQL
    results.each do |id_array|
      NewsletterSubscriber.where(id: id_array).delete_all
    end

    # add case insensitive unique index
    add_index :newsletter_subscribers, 'lower(trim(email))', name: 'index_subscribers_on_lower_email',
                                                             unique: true
  end

  def down
    remove_index :newsletter_subscribers, name: 'index_subscribers_on_lower_email'
  end
end
