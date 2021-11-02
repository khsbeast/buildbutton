class StartupTopic < ApplicationRecord
  has_many :startup_topic_articles, :dependent => :destroy
  has_many :core_articles, through: :startup_topic_articles
end
