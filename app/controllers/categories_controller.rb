class CategoriesController < ApplicationController

  def home
    prepare_honepage
    @cta_card = true
  end

  def index
    @category = Category.find_by(slug:params[:category])
    @glossary_articles = Resource.where(category:@category)
    @core_articles = CoreArticle.where(category:@category)
  end

  def learning_path
    @url = request.url

    if @url.include? ("startup-stages")
      @path = "startup-stages"
      @filter = StartupStage.find_by(slug:params[:slug])
      @filters = StartupStage.pluck(:name, :slug, :logo)
      @icons = ["puzzle-piece","user", "users", "rocket", "space-shuttle"]
    elsif @url.include? ("startup-functions")
      @path = "startup-functions"
      @filter = StartupFunction.find_by(slug:params[:slug])
      @filters = StartupFunction.pluck(:name, :slug, :logo)
    else
      @path = "startup-topics"
      @filter = StartupTopic.find_by(slug:params[:slug])
      @filters = StartupTopic.pluck(:name, :slug, :logo)
    end

    articles = @filter.core_articles.where.not(content_type: "news")
    @order = @filter.order.split(",")
    @articles = []
    @order.each do |order|
      @articles << articles.find(order)
      articles = articles.drop(order)
    end
    articles = articles.sort_by(&:created_at).reverse
    articles.each do |article|
      @articles << article
    end

  end

  def glossary
    @category = Category.find_by(slug:params[:category])
    @resources = Resource.where.not(glossary_letter:[nil, ""]).where(category:@category).sort_by &:glossary_letter
    @current_char = ""
    @previous_char = ""
    @alphabet = ("A".."Z")
  end

  def show
    @curr_url = "category_show"
    @category = Category.find_by(slug:params[:category])
    @resource = Resource.find_by(slug:params[:slug])
    @core_article = CoreArticle.find_by(slug:params[:slug])
    @canonical_url = "https://buildd.co#{request.path}"
    @post = @resource ? @resource : @core_article
    if @post.category != @category
      redirect_to '/404'
    end

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

    if @core_article.present?
      @company = @core_article.company
      @author = @core_article.author
    end
    
    if params[:subscribe]
      @subscribe_popup = true
    end
  end

  def subscribe
    prepare_honepage
    @canonical_url = "https://buildd.co"
  end

  def create_newsletter_subscriber
    @subscriber = NewsletterSubscriber.new(newsletter_subscriber_params)

    if @subscriber.save
      if request.referer.include?("subscribe")
        if request.referer.include?("?")
          redirect_to request.referer.split("?").first, flash: { success: "You're now subscribed 😎" }
        else
          redirect_to "/", flash: { success: "You're now subscribed 😎" }
        end
      else
        redirect_to request.referer, flash: { success: "You're now subscribed 😎" }
      end
    else
      redirect_to request.referer, flash: { error: "#{@subscriber.errors.full_messages.join(', ')}" }
    end
  end

  private
  def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:name, :email)
  end

  def prepare_honepage
    @startup_stages = StartupStage.pluck(:name, :slug, :fa_icon)
    @startup_stages_icons = ["puzzle-piece","user", "users", "rocket", "space-shuttle"]
    @startup_functions = StartupFunction.pluck(:name, :slug, :fa_icon)
    if @startup_functions.length > 5
      @startup_functions[5 ..] = []
    end
    @startup_functions_icons = ["check","filter","users","laptop","street-view"]
    @startup_topics = StartupTopic.pluck(:name, :slug, :fa_icon)
    if @startup_topics.length > 5
      @startup_topics[5 ..] = []
    end
    @startup_topics_icons = ["users","user","search","cube","code"]

    @news = CoreArticle.where(content_type: "news").sort_by(&:created_at).reverse
    @news_other = CoreArticle.where.not(content_type: "news")
    @news_other = @news_other.where.not(coming_soon:"true").limit(3).sort_by(&:created_at).reverse
    @news = @news + @news_other

    filter = StartupStage.first
    articles = filter.core_articles
    @order = filter.order.split(",")
    @articles = []
    @order.each do |order|
      @articles << articles.find(order)
      articles = articles.drop(order)
    end
    articles = articles.sort_by(&:created_at).reverse
    articles.each do |article|
      @articles << article
    end
  end
end
