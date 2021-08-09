require 'rails_helper'

RSpec.describe ImageService do
  describe 'get_image' do
    it 'retrieves a relevant image' do
      img = ImageService.get_image('denver, co')

      expect(img[:results]).is_a? Array
      expect(img[:results].length).to eq 1
      expect(img[:results][0][:tags]).is_a? Array
      expect(img[:results][0][:tags][0][:title]).to eq 'denver'
      expect(img[:results][0][:tags][1][:title]).to eq 'co'
      expect(img[:results][0][:urls][:regular]).is_a? String
      expect(img[:results][0][:user][:username]).is_a? String
    end
  end
end