module Gosu
  class AnimationStep
    def initialize(image_path)
      @image_path = image_path
      @image = Gosu::Image.new(@image_path)
    end

    def draw(x, y, zorder: 1, scale_x: 1, scale_y: 1)
      @image.draw(x, y, zorder, scale_x, scale_y)
    end
  end
end
