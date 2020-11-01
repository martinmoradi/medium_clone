class ArticlesController < ApplicationController
  before_action :authenticate_user, only: %i[new create show]

  def new
    @article = Article.new
  end

  def index
    @article = Article.all
  end

  def create
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def authenticate_user
    unless current_user
      redirect_to login_path
    end
  end

end
