class Image
  attr_reader :credit,
              :id,
              :image
  def initialize(data)
    @id = 'null'
    @image = { location: location_assembler(data),
               image_url: data[:results][0][:urls][:regular]
             }
    @credit = { source: 'https://unsplash.com',
                author: data[:results][0][:user][:username], 
                logo: 'https://unsplash.com/photos/QdqK4doOzcQ'
    }
  end

  def location_assembler(data)
    city = data[:results][0][:tags][0][:title]
    state = data[:results][0][:tags][1][:title]
    city + ',' + state
  end
end