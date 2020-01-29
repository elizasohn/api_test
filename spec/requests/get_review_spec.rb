require 'rails_helper'

describe 'GET /reviews/:id', :type => :request do
    context '(valid request)' do
        before do
            rev = Review.create!(content: 'Fuckin\' blows man.', city: 'Atlantis', country: 'Wakanda')
            get "/reviews/#{rev.id}"
        end

        it 'returns a specific review' do
            expect(JSON.parse(response.body)['city']).to eq 'Atlantis'
        end
        it 'returns status code 200 if review exists' do
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        before { get '/reviews/0' }

        it 'returns a detailed error message' do
            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Review with \'id\'=0'
        end
        it 'returns status code 404' do
            expect(response).to have_http_status 404
        end
    end
end
