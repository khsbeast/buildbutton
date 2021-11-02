class StartupTopicArticle < ApplicationRecord
  belongs_to :startup_topic
  belongs_to :core_article
end
