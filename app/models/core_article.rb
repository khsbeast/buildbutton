class CoreArticle < ApplicationRecord
  belongs_to :category
  belongs_to :company
  belongs_to :author
  has_many :startup_stage_articles, :dependent => :destroy
  has_many :startup_stages, through: :startup_stage_articles
  has_many :startup_function_articles, :dependent => :destroy
  has_many :startup_functions, through: :startup_function_articles
  has_many :startup_topic_articles, :dependent => :destroy
  has_many :startup_topics, through: :startup_topic_articles

  has_one_attached :banner_image
end
