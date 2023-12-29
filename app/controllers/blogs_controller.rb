class BlogsController < ApplicationController

    before_action :find_blog, only: %i[ show edit update destroy ]

    def index
      @blogs = Blog.all
      render json: @blogs, each_serializer: BlogSerializer
    end
  
    def show
      render json: @blog, serializer: BlogSerializer
    end
  
    def new
      @blog = Blog.new(blog_params)
    end
  
    def edit
    end
  
    def create
      @blog = Blog.new(blog_params)
  
        if @blog.save
           render json: @blog, serializer: BlogSerializer
        else
           render json: @blog.errors, status: :unprocessable_entity 
        end
    end
  
    def update
        if @blog.update(blog_params)
          render json: @blog, serializer: BlogSerializer, status: :created
        else
          render json: @blog.errors, status: :unprocessable_entity 
        end
    end
  
    def destroy
      @blog.destroy!
        render json: {message: 'Successfully Deleted'}, status: :ok
    end
  
    private
  
      def find_blog
        @blog = Blog.find(params[:id])
      end
  
      def blog_params
        params.permit(:company_name, :title, :description, :logo_image, :blog_image)
      end
end
