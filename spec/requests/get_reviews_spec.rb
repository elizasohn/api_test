require 'rails_helper'

describe "get all reviews route", :type => :request do
    before { get '/reviews'}

    it 'returns all reviews' do
        expect(JSON.parse(response.body).size).to eq(20)
    end

    it 'returns status code 200' do
        expect(response).to have_http_status(:success)
    end
end
