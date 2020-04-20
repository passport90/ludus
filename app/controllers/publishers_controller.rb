class PublishersController < ApplicationController
  def index
    @publishers = Publisher.select(:name).order(:name).all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)

    @publisher.save
    redirect_to publishers_url
  end

private
  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
