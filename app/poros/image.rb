class Image
  attr_reader :credit,
              :id,
              :image
  def initialize(data)
    @id = 'null'
    @image = { location: location_assembler(data),
               image_url:  '  '
             }
    @credit = { source: 'https://unsplash.com',
                author: '  ', 
                logo: 'https://unsplash.com/photos/QdqK4doOzcQ'
    }
  end

  def location_assembler(data)
    city = data[:results][0][:tags][0][:title]
    state = data[:results][0][:tags][1][:title]
     binding.pry
    city + state
    binding.pry
  end
end