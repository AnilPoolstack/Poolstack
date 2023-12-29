require 'rails_helper'

RSpec.describe HomePagesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response when home pages are found' do
      allow(HomePage).to receive(:all).and_return([HomePage.new])
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns a not_found response when no home pages are found' do
      allow(HomePage).to receive(:all).and_return([])
      get :index
      expect(response).to have_http_status(:not_found)
    end

    it 'returns the correct JSON message when no home pages are found' do
      allow(HomePage).to receive(:all).and_return([])
      get :index
      expect(JSON.parse(response.body)['message']).to eq('No home pages found')
    end

  end

  describe 'GET #show' do
    it 'returns a successful response when home page is found' do
      allow(HomePage).to receive(:find_by).and_return(HomePage.new(company_name: 'Example Company'))
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns a not_found response when home page is not found' do
      allow(HomePage).to receive(:find_by).and_return(nil)
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:not_found)
    end

    it 'returns the correct JSON message when home page is not found' do
      allow(HomePage).to receive(:find_by).and_return(nil)
      get :show, params: { id: 1 }
      expect(JSON.parse(response.body)['error']).to eq('Home page not found')
    end
  end

   describe '#set_home_page' do
    describe '#set_home_page' do
      it 'assigns @home_page with the requested home page' do
        home_page_instance = instance_double('HomePage')
        allow(HomePage).to receive(:find_by).and_return(home_page_instance)
        allow(controller).to receive(:params).and_return(id: 'some_id')
        controller.send(:set_home_page)
        expect(assigns(:home_page)).to eq(home_page_instance)
      end
    end
  end
  describe '#home_page_params' do
    it 'permits the expected parameters' do
      params = ActionController::Parameters.new(company_name: 'Example Company', logo_image: 'logo.png', background_image: 'background.png')
      controller.params = params
      expect(controller.send(:home_page_params)).to eq(params.permit(:company_name, :logo_image, :background_image))
    end
  end

end
