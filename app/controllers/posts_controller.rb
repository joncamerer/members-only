class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.update_attribute(:user_id, current_user.id)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
