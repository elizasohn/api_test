require 'rails_helper'

describe 'post specific review route', :type => :request do
    before do
        post '/reviews', params: { content: 'Super cool not lame at all', city: 'epicodusville', country: 'hell' }
    end
    it 'returns status code 201' do
        expect(response).to have_http_status 201
    end
    it 'returns status code 422 if validations fail' do
        post '/reviews', params: { content: 'Super cool not lame at all', city: '', country: 'hell' }
        expect(response).to have_http_status 422
    end
end
