require 'rails_helper'

RSpec.describe "Blogs", type: :request do

  describe "GET /index" do
        before(:each) do
          @blog = Blog.create(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
        end

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
      it 'creates a new blog' do
        blog = Blog.create( company_name: 'Poolstack Technologies', title: 'Web Development')

        post "/blogs", params: { blog: blog}
        expect(response).to have_http_status(:created)
        created_blog = JSON.parse(response.body)
        expect(created_blog['title']).to eq('Web Development')
      end
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

  context "Show the user" do  

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

    it 'should raise an error for invalid data' do
      blog = FactoryBot.create(:blog, title: "web development", company_name: "Poolstack")
      patch "/blogs/#{blog.id}", params: { blog: { company_name: "57678" } }
      expect(response).to have_http_status(422)
      res = JSON.parse(response.body)
      expect(res['errors']).to be_present
    end
    
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


# require 'rails_helper'
# RSpec.describe BlogsController, type: :request do
#   describe "GET /index" do
#     before(:each) do
#       @blog = Blog.create(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
#     end
#     context "Get all articles" do
#       it 'return all articles' do
#         get "/blogs"
#         expect(response).to have_http_status(200)
#         res = JSON response.body
#         expect(res.count).to eq(Blog.count)
#       end
#     end
#     context "Get an articles" do
#       it 'return a articles for show article api' do
#         get "/blogs/#{@blog.id}"
#         expect(response).to have_http_status(200)
#         res = JSON response.body
#         expect(res["id"]).to eq(@blog.id)
#       end
#       it 'raise error when passing wrong id' do
#         get "/blogs/0"
#         expect(response).to have_http_status(404)
#         res = JSON response.body
#         expect(res["message"]).to eq("not found")
#       end
#     end
#     context "Create article" do
#       it 'return a articles for show article api' do
#         pre_blog_count = Blog.count
#         post "/blogs", params: {blog: {company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom"}}
#         expect(response).to have_http_status(201)
#         res = JSON response.body
#         expect(Blog.count).to eq(pre_blog_count+1)
#       end
#       it 'raise error when pass wrong arguments' do
#         post "/blogs", params: {blog: {title: "", company_name: ""}}
#         expect(response).to have_http_status(422)
#       end
#     end
#     context "Update article" do
#       it 'update the fields of article' do
#         patch "/blogs/#{@blog.id}", params: {blog: {title: "1 title"}}
#         expect(response).to have_http_status(200)
#         res = JSON response.body
#         expect(Blog.find(@blog.id).title).to eq("1 title")
#       end
#       it 'raise error when pass wrong arguments' do
#         patch "/blogs/#{@blog.id}", params: {blog: {title: nil}}
#         expect(response).to have_http_status(422)
#       end
#     end
#     context "Delete the articles" do
#       it 'delete the given ids article' do
#         delete "/blogs/#{@blog.id}"
#         expect(response).to have_http_status(200)
#         expect(Blog.find_by_id(@blog.id)).to eq(nil)
#       end
#     end
#   end
# end
