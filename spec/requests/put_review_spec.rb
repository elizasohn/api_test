require 'rails_helper'

describe 'PUT /reviews/:id', :type => :request do
    context '(valid request)' do
        before do
            rev = Review.create!(content: 'a', city: 'b', country: 'c')
            put "/reviews/#{rev.id}", params: {content: '1', city: '2', country: '3'}
        end

        it 'returns a detailed success message' do
            expect(JSON.parse(response.body)['message']).to eq 'This review has been updated successfully.'
        end
        it 'returns status code 200' do
            expect(response).to have_http_status 200
        end
    end
    context '(bad requests)' do

        context '(non-existent review)' do
            before { put '/reviews/0', params: {content: '1', city: '2', country: '3'} }

            it 'returns a detailed error message' do
                expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Review with \'id\'=0'
            end
            it 'returns status code 404' do
                expect(response).to have_http_status 404
            end
        end

        context '(invalid parameters)' do
            before do
                rev = Review.create!(content: 'a', city: 'b', country: 'c')
                put "/reviews/#{rev.id}", params: {content: '', city: '', country: ''}
            end

            it 'returns a detailed error message' do
                expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Content can\'t be blank, City can\'t be blank, Country can\'t be blank'
            end

            it 'returns status code 422 if validations fail' do
                expect(response).to have_http_status 422
            end
        end

    end
end
