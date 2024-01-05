class ContactsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @contact=Contact.new(contact_params)

        if @contact.save
            ContactMailer.welcome_user_email(@contact).deliver_later
            ContactMailer.welcome_admin_email(@contact).deliver_later
            render json: @contact, status: :created
        else
            render json: @contact.errors.full_messages, status: :unprocessable_entity
        end
    end

    def country_code
        begin
          response = HTTParty.get("http://country.io/phone.json")
          
          if response.success?
            @country_code = JSON.parse(response.body)
            render json: @country_code
          else
            render json: { error: "Failed to fetch data from the external API" }, status: :unprocessable_entity
          end
          
        rescue StandardError => e
          render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
        end
    end
      

    private
    def contact_params
        params.require(:contact).permit(:full_name,:email,:message,:contact_number,:country_code)
    end
end 