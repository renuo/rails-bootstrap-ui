# frozen_string_literal: true

# frozen_literal_string: true

class AutocompleteComponentPreview < Lookbook::Preview
  include LookbookHelper

  # @source ../../../app/views/components/autocompletes/_themes.html.erb
  def themes
    render 'components/autocompletes/themes'
  end
end
