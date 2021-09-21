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
  end
end
