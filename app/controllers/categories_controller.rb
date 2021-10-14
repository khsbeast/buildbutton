class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(slug:params[:category])
    @resource = Resource.find_by(slug:params[:slug])
    @core_article = CoreArticle.find_by(slug:params[:slug])
    @post = @resource ? @resource : @core_article
    @title = @post.title
    @meta_description = @post.meta_description
    if @post.canonical_url.present?
      @canonical_url = @post.canonical_url
    end
    if @resource
      render 'resources/show'
    elsif @core_article
      render 'core_articles/show'
    end
  end
end
