require 'rails_helper'

RSpec.describe Image do
  describe 'initialize' do
    it 'exists' do
      data = ImageService.get_image('denver,co')
      image = Image.new(data)

      expect(image).is_a? Image
      expect(image.id).to eq 'null'
      expect(image.image).is_a? Hash
      expect(image.image).to have_key(:location)
      expect(image.image[:location]).to eq 'denver,co'
      expect(image.image).to have_key(:image_url)
      expect(image.image[:image_url]).is_a? String
      expect(image.credit).is_a? Hash
      expect(image.credit).to have_key(:source)
      expect(image.credit[:source]).to eq 'https://unsplash.com'
      expect(image.credit).to have_key(:author)
      expect(image.credit[:author]).is_a? String
      expect(image.credit).to have_key(:logo)
      expect(image.credit[:logo]).to eq 'https://unsplash.com/photos/QdqK4doOzcQ'
    end
  end
end