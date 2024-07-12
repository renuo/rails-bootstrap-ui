# frozen_string_literal: true

class AvatarComponentPreview < Lookbook::Preview
  include LookbookHelper

  # @source ../../../app/views/components/avatars/_themes.html.erb
  def themes
    render 'components/avatars/themes'
  end
end
