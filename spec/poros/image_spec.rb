require 'rails_helper'

RSpec.describe Image do
  describe 'initialize' do
    it 'exists' do
      data = ImageService.get_image('denver,co')
      binding.pry
    end
  end
end