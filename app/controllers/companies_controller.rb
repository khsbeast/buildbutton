class CompaniesController < ApplicationController
  def community
    @company = Company.where(slug:params[:company]).first
    @articles = @company.core_articles
  end
end
