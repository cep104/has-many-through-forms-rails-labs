class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    #@categories = Category.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end

# The form should include check boxes for us to select categories 
# as well as a text field to create a new category. 
# You should do this with a nested form so that our controller stays thin. 
#   Also, typing in a Category name that already 
#   exists should not create a new category.
#    Instead, if we type in a category that already exists, 
#    we should select it from the database and associate the post 
#    we've created with the existing category.