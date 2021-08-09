class ImageFacade
  def self.get_image(query)
    data = ImageService.get_image(query)
    Image.new(data)
  end
end