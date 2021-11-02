class StartupFunction < ApplicationRecord
  has_many :startup_function_articles, :dependent => :destroy
  has_many :core_articles, through: :startup_function_articles
end
