class AboutsController < ApplicationController
    # before_action :find_about, only: %i[show edit update destroy]

  def index
    @abouts = About.all
    render json: @abouts
  end

  def show
    render json: @about
  end

  def new
    @about = About.new
  end

  def edit
  end

  def create
    @about = About.new(about_params)

    if @about.save
      render json: @about
    else
      render json: @about.errors, status: :unprocessable_entity
    end
  end

  def update
    if @about.update(about_params)
      render json: @about
    else
      render json: @about.errors, status: :unprocessable_entity
    end
  end

  private

  def find_about
    @about = About.find(params[:id])
  end

  def about_params
    params.require(:about).permit(:description, :image)
  end
end
