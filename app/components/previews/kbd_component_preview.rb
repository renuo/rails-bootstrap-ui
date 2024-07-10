# frozen_string_literal: true

class KbdComponentPreview < Lookbook::Preview
  include LookbookHelper

  # @source ../../../app/views/components/kbds/_themes.html.erb
  def themes
    render 'components/kbds/themes'
  end
end
