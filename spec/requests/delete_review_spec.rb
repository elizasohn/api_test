require 'rails_helper'

describe 'DELETE /reviews/:id', :type => :request do
    context '(valid request)' do
        before do
            rev = Review.create!(content: 'Ya ya yee', city: 'EUUUH', country: 'Christopher Andrew Sanchezistan')
            delete "/reviews/#{rev.id}"
        end

        it 'returns a detailed success message' do
            expect(JSON.parse(response.body)['message']).to eq 'This review has been destroyed.'
        end
        it 'returns status code 200' do
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        before { delete '/reviews/0' }

        it 'returns a detailed error message' do
            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Review with \'id\'=0'
        end
        it 'returns status code 404' do
            expect(response).to have_http_status 404
        end
    end
end
