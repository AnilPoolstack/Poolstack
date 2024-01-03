require 'rails_helper'
RSpec.describe AboutsController, type: :controller do
  describe 'GET #index' do
    context 'when abouts are present' do
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
        get :show, params: { id: 999 } 
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
  describe '#find_about' do
    it 'renders a not found response when about is not found' do
      controller.params[:id] = 'nonexistent_id'
      expect { controller.send(:find_about) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  describe '#about_params' do
    it 'permits the required parameters' do
      params = ActionController::Parameters.new(description: 'Lorem ipsum', image: 'example.jpg')
      controller.params = params
      expect(controller.send(:about_params).to_h).to eq({ 'description' => 'Lorem ipsum', 'image' => 'example.jpg' })
    end
  end
  context 'when abouts are present' do
    let!(:abouts) { FactoryBot.create_list(:about, 3) }
  end
  context 'when no abouts are present' do
    it 'returns a not found message' do
      get :index
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['message']).to eq('No abouts found')
    end
  end
  describe '#about_json' do
    let(:about) { FactoryBot.create(:about) }  
  end
  context 'when image is not attached' do
    let(:about_without_image) { FactoryBot.create(:about) }  
  end
  describe 'GET #show' do
    let(:about) { FactoryBot.create(:about) }  
    it 'returns a not_found response for non-existent About record' do
      get :show, params: { id: 9999 }  
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'About not found')
    end
  end
  it 'returns unprocessable_entity for invalid About record' do
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
  def json_response
    JSON.parse(response.body)
  end
  describe "#about_json" do
    it "returns a hash with the expected attributes" do
      about = FactoryBot.create(:about) 
      expected_json = {
        id: about.id,
        description: about.description,
        image_url: about.image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(about.image, only_path: true) : nil,
        created_at: about.created_at,
        updated_at: about.updated_at
      }
      expect(helper.about_json(about)).to eq(expected_json)
    end
  end
end
