require 'rails_helper'

RSpec.describe "Blogs", type: :request do

  describe "GET /index" do
        # before(:each) do
        #   blog = FactoryBot.build(:blog, company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
        #   blog.save
        # end

    context "Get all the Blogs" do

      it "returns all the Blogs" do
        
        blog = FactoryBot.build(:blog, company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
        blog.save
        get "/blogs"
        expect(response).to have_http_status(200)
        res = JSON.parse(response.body)
        expect(res.count).to eq(Blog.count)
      end
      
      it "should return blogs not found" do
        Blog.destroy_all
        get "/blogs"
        expect(response).to have_http_status(404)
        res = JSON.parse(response.body)
        expect(res["message"]).to eq("not found")
      end
    end
  end

  describe 'Create the Blog' do

    context 'with valid data' do
      # it 'creates a new blog' do
      #   blog = Blog.create( company_name: 'Poolstack Technologies', title: 'Web Development')

      #   post "/blogs", params: { blog: blog}
      #   expect(response).to have_http_status(:created)
      #   created_blog = JSON.parse(response.body)
      #   expect(created_blog['title']).to eq('Web Development')
      # end
    end

    context 'with invalid data' do
      it 'does not create a new blog and returns unprocessable_entity status' do
        blog = FactoryBot.create(:blog, company_name: 'Poolstack Technologies', title: 'Web Development')

        post "/blogs", params: { blog: blog}
        expect(response).to have_http_status(:unprocessable_entity)
        errors = JSON.parse(response.body)
      end
    end

  end

  describe "Show the user" do  

    it "should return a Blog" do
      blog = FactoryBot.create(:blog, title: "web development", company_name: "Poolstack")
      get "/blogs/#{blog.id}"
      expect(response).to have_http_status(200)
      res = JSON.parse(response.body)
      expect(res.count).to eq(6)
    end

    it "should not return a Blog" do
      get "/blogs/show"
      expect(response).to have_http_status(404)
    end

  end

  describe 'Update the Blog' do

    it "returns all the Blogs" do
      blog = FactoryBot.create(:blog, company_name: "Poolstack Technologies", title: 'Web Development')
      patch "/blogs/#{blog.id}", params: { blog: { title: "New Title" } }
      expect(response).to have_http_status(201)
      res = JSON.parse(response.body)
      expect(res.count).to eq(6)
      # expect(res.first['title']).to eq("New Title")
    end

    # it 'should raise an error for invalid data' do
    #   blog = FactoryBot.create(:blog, title: "web development", company_name: "Poolstack")
    #   patch "/blogs/#{blog.id}", params: { blog: { company_name: nil } }
    #   expect(response).to have_http_status(:unprocessable_entity)
    #   res = JSON.parse(response.body)
    #   expect(res['errors']).to be_present
    # end
    
  end

  describe 'Delete the Data' do

    it 'should return true when successfully deleted' do
      blog = FactoryBot.build(:blog, title: "web development", company_name: "Poolstack")
      blog.save
      delete "/blogs/#{blog.id}"
      expect(response).to have_http_status(200)
      res = JSON.parse(response.body)
      expect(res["message"]).to eq('Successfully Deleted')
    end

  end

end
