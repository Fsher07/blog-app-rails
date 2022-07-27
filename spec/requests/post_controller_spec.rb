require_relative '../rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/5/posts') }
    it 'http status code should be 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'check if user param works properly' do
      expect(response)
    end
  end
end
