class ApplicationController < ActionController::Base
    include ActionView::Layouts
    protect_from_forgery unless: -> { request.format.json? }
    before_action :configure_permitted_parameters, if: :devise_controller?
end
