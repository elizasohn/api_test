require 'rails_helper'

describe 'update specific review route', :type => :request do
    before do
        @rev = Review.create!(content: 'a', city: 'b', country: 'c')
        put "/reviews/#{@rev.id}", params: { content: '1', city: '2', country: '3' }
    end
    it 'returns status code 200' do
        expect(response).to have_http_status 200
    end
    it 'returns status code 422 if validations fail' do
        put "/reviews/#{@rev.id}", params: { content: '', city: '2', country: '3' }
        expect(response).to have_http_status 422
    end
end
