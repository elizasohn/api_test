require 'rails_helper'

describe 'GET /reviews', :type => :request do
    before { get '/reviews' }

    it 'returns all reviews' do
        expect(JSON.parse(response.body).size).to eq 20
    end
    it 'returns status code 200' do
        expect(response).to have_http_status 200
    end
end
