class NewsletterSubscriber < ApplicationRecord
  require 'csv'
  validates :name, presence: true
  validates :email, presence: true

  def self.to_csv
    posts = all
    CSV.generate do |csv|
      csv << column_names
      posts.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end
end
