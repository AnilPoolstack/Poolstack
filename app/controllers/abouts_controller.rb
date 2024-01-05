class AboutsController < ApplicationController
    def index
        @abouts = About.all
        if @abouts.present?
          render json: @abouts, each_serializer: AboutSerializer, status: :ok
        else
          render json: { message: 'No abouts found' }, status: :not_found
        end
    end
    def show
      @about = About.find_by(id: params[:id])
  
      if @about
        render json: @about,serializer: AboutSerializer, status: :ok
      else
        render json: { error: 'About not found' }, status: :not_found
      end
    end
    def create
      @about = About.new(about_params)
  
      if @about.save
        render json: about_json(@about), serializer: AboutSerializer,status: :created
      else
        render json: { error: @about.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    def about_params
      params.permit(:description, :image)
    end
end
