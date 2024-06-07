# frozen_string_literal: true

class CardComponentPreview < Lookbook::Preview
  # @source ../../../app/views/components/cards/_themes.html.erb
  def themes
    render 'components/cards/themes'
  end
end
