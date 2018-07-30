class PostsController < ApplicationController

  # вызывает приватный метод set_post перед указанными методами :show, :edit, :update, :destroy
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @post.update_attributes(post_params)
      redirect_to @post
    end
  end

  def destroy

    @post.destroy
    redirect_to posts_path
  end
  private

# приватный метод, в котором обязательный параметр :posts в котором разрешаем следующие поля :title, :summary, :body
  def post_params
    params.require(:post).permit(:title, :summary, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
