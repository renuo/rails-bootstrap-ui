# frozen_string_literal: true

class FlatpickrComponentPreview < Lookbook::Preview
  include LookbookHelper

  # Add the following to your `application.html.erb` head:
  #
  # `<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>`<br>
  # `<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">`
  #
  # @source ../../../app/views/components/flatpickr/_themes.html.erb

  def themes
    render 'components/flatpickr/themes'
  end
end
