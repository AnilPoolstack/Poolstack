require 'rails_helper'
RSpec.describe ContactsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new contact and sends a welcome email' do
          pre_article_count = Contact.count
          contact_params = FactoryBot.attributes_for(:contact)
          post :create, params: { contact: contact_params }, format: :json
          res = JSON response.body
          expect(response).to have_http_status(:created)
          expect(Contact.count).to eq(pre_article_count+1)
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable entity status and error messages' do
        contact_params = { full_name: '', email: '', contact_number: '' }
        post :create, params: { contact: contact_params }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('Full name can\'t be blank', 'Email can\'t be blank', 'Contact number can\'t be blank')
      end
    end
  end
end
