class CommentsController < ApplicationController
  def index
    @blog = Blog.find_by(id: params[:blog_id])
    @comment = @blog.comments.new
    # @comments = @blog.comments
    @comments_all = Comment.all
    @comments = @comments_all.order(created_at: :desc).page(params[:page].to_i).per(20)
    @comments_blog = @blog.comments.all
  end

  def show
    @blog = Blog.find_by(id: params[:blog_id])
    # @comment = @blog.comments.find(params[:id])
    @comments = @blog.comments
    # @comments = comments #.order(created_at: :desc).page(params[:page].to_i).per(20)
    @comments_all = Comment.all
    @comments = @comments_all.order(created_at: :desc).page(params[:page].to_i).per(20)
    @comments_blog = @blog.comments.all
  end

  def create
    @blog = Blog.find_by(id: params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    if @comment.save
      flash[:notice] = 'You have successfully created the comment'
      redirect_to venblog_blog_path(@blog.id)
    else
      flash.now[:notice] = 'There is an error in your form'
      # redirect_to blog_path(@blog.id)
    end
  end

 # private

  # Use callbacks to share common setup or constraints between actions.

  def comment_params
    params.require(:comment).permit(:Name, :comment)
  end
end

