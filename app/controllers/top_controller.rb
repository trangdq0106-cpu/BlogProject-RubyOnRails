class TopController < ApplicationController
  # GET /blogs or /blogs.json
  def index
    @blogs = if params[:keyword]
      Blog.where("title like ?", "%#{params[:keyword]}%")
    else
      Blog.all
    end
    # @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comment #.find(params[:id])
    @blogs = @blogs.published
    @lastest_blogs = Blog.published.order(created_at: :desc).limit(5)
    @blogs_all = @blogs.order(created_at: :desc).page(params[:page].to_i).per(20)
    # avoid n+1
    @comments = Comment.order(created_at: :desc).includes(:blog).limit(5)
  end

  def show
    @blog = Blog.find_by(id: params[:blog_id])
    @comment = @blog.comments.find(params[:comment].permit(:Name, :comment))
  end

  private

  def comment_params
    params.require(:comment).permit(:Name, :comment)
  end

  def blog_params
    params.require(:blog).permit(:title, :shortdescription, :description, :published, :image)
  end
end
