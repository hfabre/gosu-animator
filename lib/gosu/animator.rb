require_relative "./animator/version"
require_relative "./animator/animation"
require_relative "./animator/animation_step"

module Gosu
  class Animator
    def initialize
      @animations = []
    end

    def <<(animation)
      @animations << animation
    end

    def play(name)
      find_animation(name).play
    end

    def replay(name)
      find_animation(name).replay
    end

    def pause(name)
      find_animation(name).pause
    end

    def stop(name)
      find_animation(name).stop
    end

    def update
      @animations.each(&:update)
    end

    def draw(name, x, y, zorder: 1, scale_x: 1, scale_y: 1)
      find_animation(name).draw(x, y, zorder: zorder, scale_x: scale_x, scale_y: scale_y)
    end

    private

    def find_animation(name)
      @animations.find { |animation| animation.name == name }
    end
  end
end
