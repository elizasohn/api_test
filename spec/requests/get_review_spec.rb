require 'rails_helper'

describe "get specific review route", :type => :request do
    before do
        rev = Review.create!(content: 'Fuckin\' blows man.', city: 'Atlantis', country: 'Wakanda')
        get "/reviews/#{rev.id}"
    end

    it 'returns a specific review' do
        expect(JSON.parse(response.body)['city']).to eq 'Atlantis'
    end

    it 'returns status code 200 if review exists' do
        expect(response).to have_http_status(200)
    end

    it 'returns status code 404 if review does not exist' do
        get "/reviews/0"
        expect(response).to have_http_status(404)
    end
end
