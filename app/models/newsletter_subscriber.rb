class NewsletterSubscriber < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
