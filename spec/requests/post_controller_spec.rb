require_relative '../rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/4/posts') }
    it 'http status code should be 200' do
      expect(response).to have_http_status(200)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'check if user param works properly' do
      expect(response)
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/4/posts/7') }
    it 'http status code should be 200' do
      expect(response).to have_http_status(200)
    end
    it 'particular users route must exist' do
      expect(response).to render_template('show')
    end
  end
end