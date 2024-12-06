# frozen_string_literal: true

class AnimatedBadgeComponentPreview < Lookbook::Preview
  include LookbookHelper

    # Interactive playground for experimenting with badge styles and animations.
    # @param title text "Badge Title"
    # @param colour select :theme_choices
    # @param border_color color "Border Color"
    # @param duration number "Animation Duration (seconds)"
    # @param pulse_scale text "Scale Value"
    # @source ../../../app/views/components/animated_badges/_playground.html.erb
    def playground(
      title: 'Animated badge',
      colour: 'primary',
      border_color: 'black',
      duration: 1,
      pulse_scale: 1.05
    )
      render 'components/animated_badges/playground',
             title: title,
             colour: colour,
             border_color: border_color,
             duration: duration,
             pulse_scale: pulse_scale
    end

  # @source ../../../app/views/components/animated_badges/_themes.html.erb
  def themes
    render 'components/animated_badges/themes'
  end
end
