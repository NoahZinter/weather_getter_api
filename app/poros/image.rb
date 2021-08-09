class Image
  attr_reader :credit,
              :id,
              :image
  def initialize(data)
    @id = 'null'
    @image = { location:  '  ',
               image_url:  '  '
             }
    @credit = { source: 'https://unsplash.com',
                author: '  ', 
                logo: 'https://unsplash.com/photos/QdqK4doOzcQ'

    }
  end
end