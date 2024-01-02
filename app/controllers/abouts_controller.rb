class AboutsController < ApplicationController
  
    def index
        @abouts = About.all
      
        if @abouts.any?
          render json: @abouts, status: :ok
        else
          render json: { message: 'No abouts found' }, status: :not_found
        end
    end

    def show
      @about = About.find_by(id: params[:id])
  
      if @about
        render json: about_json(@about), status: :ok
      else
        render json: { error: 'About not found' }, status: :not_found
      end
    end

    def create
      @about = About.new(about_params)
  
      if @about.save
        render json: about_json(@about), status: :created
      else
        render json: { error: @about.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    def about_json(about)
      {
        id: about.id,
        description: about.description,
        image_url: about.image.attached? ? url_for(about.image).to_s : nil,
        created_at: about.created_at,
        updated_at: about.updated_at
      }
    end

    def find_about
        @about = About.find(params[:id])
    end

    def about_params
      params.permit(:description, :image)
    end
    
end
