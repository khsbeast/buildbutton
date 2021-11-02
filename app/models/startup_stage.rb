class StartupStage < ApplicationRecord
  has_many :startup_stage_articles, :dependent => :destroy
  has_many :core_articles, through: :startup_stage_articles
end
