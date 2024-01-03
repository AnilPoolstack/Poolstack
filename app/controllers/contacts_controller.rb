class ContactsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @contact=Contact.new(contact_params)

        if @contact.save
            ContactMailer.welcome_user_email(@contact).deliver_now
            ContactMailer.welcome_admin_email(@contact).deliver_now
            render json: @contact, status: :created
        else
            render json: @contact.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def contact_params
        params.require(:contact).permit(:full_name,:email,:message,:contact_number,:country_code)
    end
end
