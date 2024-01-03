class ServicesController < ApplicationController
  def index
    @services = Service.all
    if @services.present?
      render json: @services, each_serializer: ServiceSerializer, status: :ok
    else
      render json: { message: "not found" }, status: :not_found
    end
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render json: @service, serializer: ServiceSerializer, status: :created
    else
      render json: { error: 'Service not found' }, status: :unprocessable_entity
    end
  end

  def show
    @service=Service.find_by(id: params[:id])
    if @service.present?
      render json: @service, serializer: ServiceSerializer, status: :ok
    else
      render json: {message: "not found"}, status: :not_found
    end
  end

  def update
    @service=Service.find_by(id: params[:id])
    if @service.update(service_params)
      render json: @service, serializer: ServiceSerializer, status: :created
    else
      render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def service_params
    params.permit(:service_name, :service_description, :service_image, :category_id)
  end
  
end