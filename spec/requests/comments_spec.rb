require 'rails_helper'


RSpec.describe 'Comments API', type: :request do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:comment)
  end
  describe 'GET /comments' do
    it 'returns a successful response when comments exist' do
      comments = create_list(:comment, 3)
      get '/comments'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(3)
    end

    it 'returns a not_found response when no comments exist' do
      get '/comments'
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['message']).to eq('No comments found')
    end
  end

  describe 'GET /comments/:id' do
    context 'when the comment exists' do
      let!(:existing_comment) { create(:comment) }

      it 'returns a successful response' do
        get "/comments/#{existing_comment.id}"

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq(JSON.parse(existing_comment.to_json))
      end
    end

    context 'when the comment does not exist' do
      it 'returns a not_found response' do
        non_existent_id = nil

        get "/comments/#{non_existent_id}"
        
        expect(response).to have_http_status(404)
        # expect(JSON.parse(response.body)['message']).to eq('No comment found')
      end
     
    end
  end

  describe 'POST /comments' do
    let(:valid_attributes) { attributes_for(:comment) }

    it 'creates a new comment' do
      expect do
        post '/comments', params: { comment: valid_attributes }
      end.to change(Comment, :count).by(1)
      expect(response).to have_http_status(:created)
    end
    
    
    

    it 'returns unprocessable_entity status with invalid attributes' do
      post '/comments', params: { comment: { content: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /comments/:id' do
    let(:comment) { create(:comment) }

    it 'updates the comment' do
      new_content = 'Updated content'
      patch "/comments/#{comment.id}", params: { comment: { content: new_content } }
      expect(comment.reload.content).to eq(new_content)
      expect(response).to have_http_status(:ok)
    end

    it 'returns unprocessable_entity status with invalid attributes' do
      patch "/comments/#{comment.id}", params: { comment: { content: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /comments/:id' do
    let!(:comment) { create(:comment) }

    it 'destroys the comment' do
      expect do
        delete "/comments/#{comment.id}"
      end.to change(Comment, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'returns unprocessable_entity status when deletion fails' do
      allow_any_instance_of(Comment).to receive(:destroy).and_return(false)
      delete "/comments/#{comment.id}"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
