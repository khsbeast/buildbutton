class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find_by(slug:params[:slug])
    @title = @resource.title
    @meta_description = @resource.meta_description
    if @resource.canonical_url.present?
      @canonical_url = @resource.canonical_url
    end
    if @resource.related_articles.present?
      @related_articles = @resource.related_articles.split("<=>")
      @related_articles_urls = @resource.related_articles_urls.split("<=>")
    end
    if @resource.top_articles.present?
      @top_articles = @resource.top_articles.split("<=>")
      @top_articles_urls = @resource.top_articles_urls.split("<=>")
    end
  end
end
