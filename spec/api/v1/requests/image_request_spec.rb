require 'rails_helper'

RSpec.describe 'Image Requests' do
  describe 'index' do
    it 'returns serialized image result' do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response.status).to eq 200
      image = JSON.parse(response.body, symbolize_names: true)

      expect(image).to have_key(:data)
      expect(image[:data]).to have_key(:id)
      expect(image[:data][:id]).to eq 'null'
      expect(image[:data]).to have_key(:type)
      expect(image[:data][:type]).to eq 'image'
      expect(image[:data]).to have_key(:attributes)
      expect(image[:data][:attributes]).is_a? Hash
      expect(image[:data][:attributes]).to have_key(:image)
      expect(image[:data][:attributes][:image]).is_a? Hash
      expect(image[:data][:attributes][:image]).to have_key(:location)
      expect(image[:data][:attributes][:image][:location]).to eq 'denver,co'
      expect(image[:data][:attributes][:image]).to have_key(:image_url)
      expect(image[:data][:attributes][:image][:image_url]).is_a? String
      expect(image[:data][:attributes]).to have_key(:credit)
      expect(image[:data][:attributes][:credit]).is_a? Hash
      expect(image[:data][:attributes][:credit]).to have_key(:source)
      expect(image[:data][:attributes][:credit][:source]).to eq 'https://unsplash.com'
      expect(image[:data][:attributes][:credit]).to have_key(:author)
      expect(image[:data][:attributes][:credit][:author]).is_a? String
      expect(image[:data][:attributes][:credit]).to have_key(:logo)
      expect(image[:data][:attributes][:credit][:logo]).to eq 'https://unsplash.com/photos/QdqK4doOzcQ'
    end
  end
end