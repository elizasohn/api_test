require 'rails_helper'

describe 'POST /reviews', :type => :request do
    context '(valid request)' do
        before do
            post '/reviews', params: {content: 'Super cool not lame at all', city: 'epicodusville', country: 'hell'}
        end

        it 'returns a detailed success message' do
            expect(JSON.parse(response.body)['id']).to be_an_instance_of(Integer)
        end
        it 'returns status code 201' do
            expect(response).to have_http_status 201
        end
    end

    context '(bad request)' do
        before { post '/reviews', params: {content: '', city: '', country: ''} }

        it 'returns a detailed error message' do
            expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Content can\'t be blank, City can\'t be blank, Country can\'t be blank'
        end
        it 'returns status code 422 if validations fail' do
            expect(response).to have_http_status 422
        end
    end
end
