class HomePagesController < ApplicationController
  def index
  @home_pages = HomePage.all

  if @home_pages.any?
    render json: @home_pages, status: :ok
  else
    render json: { message: 'No home pages found' }, status: :not_found
  end 
end

  def show
  @home_page = HomePage.find_by(id: params[:id])

  if @home_page
    render json: { message: 'Home page found', home_page: @home_page }, status: :ok
  else
    render json: { error: 'Home page not found' }, status: :not_found
  end
end


  private

  def set_home_page
    @home_page = HomePage.find_by(id: params[:id])
  end

  def home_page_params
    params.permit(:company_name, :logo_image, :background_image,:content)
  end
end
