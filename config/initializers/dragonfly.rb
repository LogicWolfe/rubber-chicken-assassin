require 'dragonfly'

module Dragonfly
  module Processing
    class ImageMagickProcessor
      def sepia(temp_object)
        convert(temp_object, "-sepia-tone 80%")
      end
    end
  end
end

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :image_accessor)


