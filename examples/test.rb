require "gosu"
require_relative "../lib/gosu/animator"

class Game < Gosu::Window
  def initialize
    super(1800, 900)
    self.caption = "Gosu animator showcase"

    base_animation_path = "./examples/assets/png"
    run_animation_images = %w[Run__000.png Run__001.png Run__002.png Run__003.png Run__004.png Run__005.png Run__006.png Run__007.png Run__008.png Run__009.png]
    jump_animation_images = %w[Jump__000.png Jump__001.png Jump__002.png Jump__003.png Jump__004.png Jump__005.png Jump__006.png Jump__007.png Jump__008.png Jump__009.png]
    run_animation_images.map! { |name| File.join(base_animation_path, name) }
    jump_animation_images.map! { |name| File.join(base_animation_path, name) }
    @animator = Gosu::Animator.new
    @animator << Gosu::Animation.new(:run, run_animation_images)
    @animator << Gosu::Animation.new(:jump, jump_animation_images)
    @animator.play(:jump)
  end

  def update
    self.close if button_down? Gosu::Button::KbEscape
    @animator.pause(:run) if self.button_down? Gosu::Button::KbB
    @animator.stop(:run) if self.button_down? Gosu::Button::KbS
    @animator.play(:run) if self.button_down? Gosu::Button::KbP
    @animator.update
  end

  def draw
    @animator.draw(:run, 10, 10, scale_x: 0.5, scale_y: 0.5)
    @animator.draw(:jump, 500, 400)
  end
end

Game.new.show
