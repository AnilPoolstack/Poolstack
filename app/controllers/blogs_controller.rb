class BlogsController < ApplicationController

    before_action :find_blog, only: %i[ show edit update destroy ]

    def index
      @blogs = Blog.all
      
      if @blogs.present?
        render json: @blogs, each_serializer: BlogSerializer
      else
        render json: { message: "not found" }, status: :not_found
      end
    end
  
    def show
        if @blog.present?
            render json: @blog, serializer: BlogSerializer
        else
            render json: {message: "not found"}, status: :not_found
        end
    end 
    
    def edit
    end
  
    def create
      @blog = Blog.new(blog_params)
  
        if @blog.save
           render json: @blog, serializer: BlogSerializer, status: :created
        else
            render json: {message: "Blog Not Created"}, status: :unprocessable_entity 
        end
    end
  
    def update
        if @blog.update(blog_params)
          render json: @blog, serializer: BlogSerializer, status: :created
        else
            # render json: {message: "Sorry! Blog Not Updated"}, status: :unprocessable_entity
            render json: { errors: @blog.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
  
    def destroy
      @blog.destroy
        render json: {message: 'Successfully Deleted'}, status: :ok
    end
  
    private
  
      def find_blog
        @blog = Blog.find_by(id: params[:id])
      end
  
      def blog_params
        params.permit(:company_name, :title, :description, :logo_image, :blog_image)
      end
end
