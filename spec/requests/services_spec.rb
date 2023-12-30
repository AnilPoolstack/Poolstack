require 'rails_helper'

RSpec.describe "ServicesController", type: :request do

  describe "Fetch all the services" do
    context "Get all the services" do
      it "returns all the service" do
        service = FactoryBot.build(:service, service_name: "ROR",  service_description: "this is the server side language")
        service.save
        get "/services"
        expect(response).to have_http_status(200)
        res = JSON.parse(response.body)
        expect(res.count).to eq(Service.count)
      end
      
      it "return services not found" do
        Service.destroy_all
        get "/services"
        expect(response).to have_http_status(404)
        res = JSON.parse(response.body)
        expect(res["message"]).to eq("not found")
      end
    end
  end
  
  describe 'Create the service#Create' do
    context 'with valid data' do
      it 'creates a new service' do
        service = Service.create( service_name: 'ROR', service_description: 'this is backend language')
        post "/services", params: {service:service}
        expect(response).to have_http_status(201)
        created_service = JSON.parse(response.body)
        expect(created_service['service_description']).to eq('this is server side technology')
      end
    end

    context 'with invalid data' do
      it 'does not create a news service and returns unprocessable_entity status' do
       service = FactoryBot.create(:service, service_name: 'Ruby on rails', service_description: 'this is backend language')
        post "/services", params: {service:service}
        expect(response).to have_http_status(:unprocessable_entity)
        errors = JSON.parse(response.body)
      end
    end
  end

  describe "GET/show" do
    context "Show the service" do  
      it "return a service" do
        service = FactoryBot.create(:service, service_name: 'Ruby on rails', service_description: 'this is backend language')
        get "/services/#{service.id}"
        expect(response).to have_http_status(200)
        res = JSON.parse(response.body)
        expect(res.count).to eq(5)
      end
  
      it "should not return a service" do
        get "/services/show"
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "PATCH/update" do
    context " Update a service" do
      it "returns all the services" do
        service = FactoryBot.create(:service, service_name: 'Ruby on rails', service_description: 'this is backend language')
        patch "/services/#{service.id}", params: {service: { service_name: 'JAVA' } }
        expect(response).to have_http_status(201)
        res = JSON.parse(response.body)
        expect(res.count).to eq(5)
      end

      it 'should raise an error for invalid data' do
        service = FactoryBot.create(:service, service_name: 'Ruby on rails', service_description: 'this is backend language')
        patch "/services/#{service.id}", params: { service: { service_name: nil } }
        expect(response).to have_http_status(422)
        res = JSON.parse(response.body)
        expect(res['errors']).to be_present
      end
    end
  end

end