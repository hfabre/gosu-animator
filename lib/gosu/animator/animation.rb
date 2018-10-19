module Gosu
  class Animation
    attr_reader :name

    def initialize(name, images_path, time_between_frame: 60, replay: true)
      @name = name
      @images_path = images_path
      @time_between_frame = time_between_frame
      @replay = replay
      @animation_steps = images_path.map { |image_path| AnimationStep.new(image_path) }
      @current_step = 0
      @is_running = false
    end

    def play
      @is_running = true
    end

    def update
      if @is_running
        if frame_expired?
          @current_step += 1
          if done?
            @current_step = 0
            @is_running = false unless @replay
          end
        end
      end
    end

    def draw(x, y, zorder: 1, scale_x: 1, scale_y: 1)
      @animation_steps[@current_step].draw(x, y, zorder: zorder, scale_x: scale_x, scale_y: scale_y)
    end

    def pause
      @is_running = false
    end

    def stop
      @is_running = false
      @current_step = 0
    end

    private

    def frame_expired?
      now = Gosu.milliseconds
      @last_frame ||= now
      if (now - @last_frame) > @time_between_frame
        @last_frame = now
      else
        false
      end
    end

    def done?
      @current_step >= @animation_steps.count
    end
  end
end
