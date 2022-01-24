require 'httparty'

class NewsletterSubscriber < ApplicationRecord
  require 'csv'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :make_api_call

  def self.to_csv
    posts = all
    CSV.generate do |csv|
      csv << column_names
      posts.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end

  private
    def make_api_call
      chimp_mail_api_key = "0cf5ef71b8e61d200f126c1b73c47bba-us20"

      first_name = name.split[0]
      last_name = name.split[1]

      if first_name.length == 1
        first_name = "There"
      end

      first_name[0] = first_name[0].capitalize

      options = {
        "email_address" => email,
        "status"=> "subscribed",
        "email_type"=> "html",
        "tags"=> ["New Subscriber"],
        "merge_fields"=> {
          "FNAME"=> first_name,
          "LNAME"=> last_name ? last_name : " "
        }
      }

      response = HTTParty.post('https://us20.api.mailchimp.com/3.0/lists/f95aa8bcc2/members', body: options.to_json, headers: {"Authorization" => "Bearer #{chimp_mail_api_key}"})
      puts response.body
      
    end
end
