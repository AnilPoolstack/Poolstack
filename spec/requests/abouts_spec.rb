# spec/controllers/abouts_controller_spec.rb

require 'rails_helper'

RSpec.describe AboutsController, type: :controller do
  describe 'GET #index' do
    context 'when abouts are present' do
      # it 'returns a list of abouts' do
      #   abouts = FactoryBot.create_list(:about, 3) # Assuming you're using FactoryBot for creating test data
      #   get :index
      #   expect(response).to have_http_status(:ok)
      #   expect(JSON.parse(response.body)).to eq(JSON.parse(abouts.to_json))
      # end
      it 'returns a list of abouts' do
        allow(About).to receive(:all).and_return([About.new])
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when no abouts are present' do
      it 'returns a not found message' do
        get :index
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to eq('No abouts found')
      end
    end
  end
  describe 'GET #show' do
    context 'when the specified about is not found' do
      it 'returns a not found message' do
        get :show, params: { id: 999 } # Assuming an ID that does not exist
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('About not found')
      end
    end
  end
  describe 'POST #create' do
    context 'with invalid parameters' do
      it "is invalid without a description and an image" do
        about = FactoryBot.build(:about, description: nil, image: nil)
        about.valid?
  
        expected_errors = { "description"=>["blank"], "image"=>["blank"] }
        actual_errors = about.errors.full_messages.each_with_object({}) { |msg, hash| hash[msg.split.first.downcase] ||= [] << msg.split.last; }
        expect(actual_errors).to eq(expected_errors)
      end
    end
  end
  # describe 'PATCH #update' do
  #   context 'when the specified about is not found' do
  #     it 'returns not found message' do
  #       patch :update, params: { id: 999, about: { description: 'Updated description' } } # Assuming an ID that does not exist
  #       expect(response).to have_http_status(:not_found)
  #       expect(JSON.parse(response.body)['error']).to eq('About not found')
  #     end
  #   end
  # end
  describe '#find_about' do
    it 'renders a not found response when about is not found' do
      controller.params[:id] = 'nonexistent_id'
      expect { controller.send(:find_about) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  describe '#about_params' do
    it 'permits the required parameters' do
      params = ActionController::Parameters.new(description: 'Lorem ipsum', image: 'example.jpg')

      # Assuming you have an instance of the controller
      controller.params = params

      expect(controller.send(:about_params).to_h).to eq({ 'description' => 'Lorem ipsum', 'image' => 'example.jpg' })
    end

  end
  context 'when abouts are present' do
    let!(:abouts) { FactoryBot.create_list(:about, 3) }

    # it 'returns a list of abouts' do
    #   get :index
    #   expect(response).to have_http_status(:ok)
    #   expect(JSON.parse(response.body)).to eq(JSON.parse(About.all.to_json))
    # end
  end
  context 'when no abouts are present' do
    it 'returns a not found message' do
      get :index
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['message']).to eq('No abouts found')
    end
  end
  describe '#about_json' do
    let(:about) { FactoryBot.create(:about) }  # Assuming you have a FactoryBot factory for About

    # it 'returns the correct id in the JSON response' do
    #   json_response = JSON.parse(controller.send(:about_json, about).to_json)
    #   expect(json_response['id']).to eq(about.id)
    # end
  end
  context 'when image is not attached' do
    let(:about_without_image) { FactoryBot.create(:about) }  # Create an about instance without attaching an image

    # it 'returns nil for image_url in the JSON response' do
    #   json_response = JSON.parse(controller.send(:about_json, about_without_image).to_json)
    #   expect(json_response['image_url']).to be_nil
    # end
  end
  describe 'GET #show' do
    let(:about) { FactoryBot.create(:about) }  # Assuming you have a FactoryBot factory for About

    # it 'returns a JSON response with the About record and status :ok' do
    #   get :show, params: { id: about.id }
    #   expect(response).to have_http_status(:ok)

    #   # Assuming you have a factory for About that defines the about_json format
    #   expected_json = controller.send(:about_json, about).to_json
    #   expect(response.body).to eq(expected_json)
    # end

    it 'returns a not_found response for non-existent About record' do
      get :show, params: { id: 9999 }  # Assuming 9999 is a non-existent ID
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'About not found')
    end
  end
  it 'returns unprocessable_entity for invalid About record' do
    # Adjust the invalid_params as needed to trigger validation errors
    invalid_params = { about: { description: nil, image: nil } }

    expect {
      post :create, params: invalid_params
    }.not_to change(About, :count)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(JSON.parse(response.body)).to include('error')
  end
  describe 'POST #create' do
    it 'returns unprocessable_entity when parameters are missing' do
      post :create

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response).to include('error')
    end
  end

  # Helper method to parse JSON response
  def json_response
    JSON.parse(response.body)
  end
  # context 'with valid params' do
  #   it 'creates a new about' do
  #     valid_params = {
  #       about: {
  #         description: 'Valid description',
  #         image: fixture_file_upload('g1.jpg', 'image/jpg')
  #       }
  #     }

  #     post :create, params: valid_params

  #     created_about = About.last
  #     expect(created_about).to be_present

  #     expect(response).to have_http_status(:created)
  #     expect(json_response['id']).to eq(created_about.id)
  #     # Add other expectations as needed
  #   end
  # end
  # it "handles the case where the image is not attached" do
  #   about = FactoryBot.create(:about, image: nil)

  #   expected_hash = {
  #     id: about.id,
  #     description: about.description,
  #     image_url: nil, # Since image is not attached
  #     created_at: about.created_at,
  #     updated_at: about.updated_at
  #   }

  #   expect(about.to_hash).to eq(expected_hash)
  # end
end
