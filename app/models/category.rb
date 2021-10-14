class Category < ApplicationRecord
  has_many :resources
  has_many :core_articles
end
