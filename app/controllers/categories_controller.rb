class CategoriesController < ApplicationController

  def home
  end

  def index
  end

  def glossary
    @category = Category.find_by(slug:params[:category])
    @resources = Resource.where.not(glossary_letter:[nil, ""]).where(category:@category).sort_by &:glossary_letter
    @current_char = ""
    @previous_char = ""
    @alphabet = ("A".."Z")
  end

  def show
    @category = Category.find_by(slug:params[:category])
    @resource = Resource.find_by(slug:params[:slug])
    if @resource.category != @category
      redirect_to '/404'
    end

    @core_article = CoreArticle.find_by(slug:params[:slug])
    @post = @resource ? @resource : @core_article
    @title = @post.title
    @meta_description = @post.meta_description
    if @post.canonical_url.present?
      @canonical_url = @post.canonical_url
    end
    if @post.related_articles.present?
      @related_articles = @post.related_articles.split("<=>")
      @related_articles_urls = @post.related_articles_urls.split("<=>")
    end
    if @post.top_articles.present?
      @top_articles = @post.top_articles.split("<=>")
      @top_articles_urls = @post.top_articles_urls.split("<=>")
    end
    if @resource
      render 'resources/show'
    elsif @core_article
      render 'core_articles/show'
    end
  end

  def create_newsletter_subscriber
    @subscriber = NewsletterSubscriber.new(newsletter_subscriber_params)

    if @subscriber.save
      redirect_to request.referer, flash: { success: "You're now subscribed 😎" }
    else
      redirect_to request.referer, flash: { error: "#{@subscriber.errors.full_messages.join(', ')}" }
    end
  end

  private
  def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:name, :email)
  end
end
