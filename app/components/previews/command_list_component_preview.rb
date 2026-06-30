# frozen_string_literal: true

# frozen_literal_string: true

class CommandListComponentPreview < Lookbook::Preview
  include LookbookHelper

  # @source ../../../app/views/components/command_lists/_themes.html.erb
  def themes
    render 'components/command_lists/themes'
  end
end
