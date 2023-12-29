class ServicesController < ApplicationController
  def index
    category_key = params[:category_key]
    if category_key.present?
      if Service.categories.key?(category_key)
        services = Service.where(category: Service.categories[category_key])
        render json: services, each_serializer: ServiceSerializer
      else
        render json: { error: "Invalid category" }, status: :unprocessable_entity
      end
    else
      services = Service.all
      render json: services, each_serializer: ServiceSerializer
    end
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render json: @service, serializer: ServiceSerializer
    else
      render json: @service.errors, status: :unprocessable_entity 
    end
  end
  
  def show
    @service=Service.find_by(id: params[:id])
    render json: @service, serializer: ServiceSerializer
  end

  def update
    @service=Service.find_by(id: params[id])
    if @service.present?
      @service.update(service_params)
      render json: @service, serializer: ServiceSerializer
    else
      render json: @service.errors, status: :unprocessable_entity 
    end
  end

  private
  def service_params
    params.require(:service).permit(:service_name, :service_description, :category, :service_image)
  end
end
