class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
  
    # GET /comments
    def index
        @comments = Comment.all
      
        if @comments.any?
          render json: @comments, status: :ok
        else
          render json: { message: 'No comments found' }, status: :not_found
        end
    end
    # GET /comments/1
    def show
        if @comment
            render json: @comment, status: :ok
        else
            render json: { message: 'No comment found' }, status: :not_found
        end
    end
  
    # POST /comments
    
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
    end
  
    # PATCH/PUT /comments/1
    def update
      if @comment.update(comment_params)
        render json: @comment, status: :ok
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /comments/1
    def destroy
        if @comment.destroy
            render json: { message: 'Successfully Deleted' }, status: :ok
        else
            render json: { message: 'Deletion failed' }, status: :unprocessable_entity
          end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find_by(id: params[:id])
      # if @comment
        
      # else
      #   render json: { error: "Comment not found" }, status: :not_found
      # end
    end
    
  
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:email, :content, :blog_id)
    end
end
  