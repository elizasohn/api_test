require 'rails_helper'

describe 'delete specific review route', :type => :request do
    before do
        rev = Review.create!(content: 'Ya ya yee', city: 'EUUUH', country: 'Christopher Andrew Sanchezistan')
        delete "/reviews/#{rev.id}"
    end
    it 'returns status code 200' do
        expect(response).to have_http_status 200
    end
end
