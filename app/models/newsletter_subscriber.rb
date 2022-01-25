require 'httparty'

class NewsletterSubscriber < ApplicationRecord
  require 'csv'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :add_to_mailchimp_list

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
    def add_to_mailchimp_list
      mailchimp_api_key = ENV["mailchimp_api_key"]
      mailchimp_list_id = ENV["mailchimp_list_id"]

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

      response = HTTParty.post("https://us20.api.mailchimp.com/3.0/lists/#{mailchimp_list_id}/members", body: options.to_json, headers: {"Authorization" => "Bearer #{mailchimp_api_key}"})

      if response.code != 200
        puts 'mailchimp error'
        puts response.body
        throw :abort
      end
      
    end
end
