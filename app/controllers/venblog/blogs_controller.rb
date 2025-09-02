module Venblog
  class BlogsController < ApplicationController
    before_action :set_blog, only: %i[show edit update destroy]
    # GET /blogs or /blogs.json

    def index
      @blogs = if params[:keyword]
                Blog.where('title like ?', "%#{params[:keyword]}%")
              else
                Blog.all
              end
      @lastest_blogs = Blog.order(created_at: :desc).limit(5)
      @blogs_all = @blogs.order(created_at: :desc).page(params[:page].to_i).per(20)
      @comments = Comment.order(created_at: :desc).limit(5)
    end

    # GET /blogs/1
    def show
      @blog = Blog.find(params[:id])
      if @blog.published
      else
        flash[:notice] = 'This page is unpublished'
        redirect_to blog_comments_path(@blog)
      end
      # @blog_published = @blog.where(published: true)
      # @blog_unpublished = @blog.where(published: false)
      @comment = Blog.new
      @comments = @blog.comments.order(created_at: :desc).page(params[:page].to_i).per(20)
      @comments_blog = @blog.comments.all
    end

    # GET /blogs/new
    def new
      @blog = Blog.new
    end

    # GET /blogs/1/edit
    def edit
      @blog = Blog.find(params[:id])
      render :new
    end

    # POST /blogs
    def create
      blog_params = params.require(:blog).permit(:title, :shortdescription, :description, :published, :image)
      @blog = Blog.new(blog_params)
      if @blog.save
        flash[:notice] = 'You have successfully created the blog'
        redirect_to venblog_blogs_path
      else
        flash.now[:notice] = 'There is an error in your form'
        render :new
      end
    end

    # PATCH/PUT /blogs/1
    def update
      blog_params = params.require(:blog).permit(:title, :shortdescription, :description, :published, :image)
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        flash[:notice] = 'Update Success'
        redirect_to venblog_blogs_url
      else
        flash.now[:notice] = 'Update Have an error'
        render :new
      end
    end

    # DELETE /blogs/1
    def destroy
      flash[:notice] = if Blog.destroy(params[:id])
                        'Delete successfully'
                      else
                        'Error'
                      end
      redirect_to venblog_blogs_url
    end

    # private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :shortdescription, :description, :published, :image)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.permit(:Name, :comment)
    end
  end

end 