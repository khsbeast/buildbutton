class Category < ApplicationRecord
  has_one :resource
  has_one :core_article
end
