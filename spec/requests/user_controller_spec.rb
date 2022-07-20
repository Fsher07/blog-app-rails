require_relative '../rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users') }
    it 'http status code should be 200' do
      expect(response).to have_http_status(200)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end