# frozen_string_literal: true

class FlatpickrComponentPreview < Lookbook::Preview
  include LookbookHelper

  # Add the following to your `application.html.erb` head:
  #
  # `<script
  #   src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/dist/flatpickr.min.js"
  #   integrity="sha384-5JqMv4L/Xa0hfvtF06qboNdhvuYXUku9ZrhZh3bSk8VXF0A/RuSLHpLsSV9Zqhl6"
  #   crossorigin="anomynous"></script>`
  #
  # `<link
  #   rel="stylesheet"
  #   href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/dist/flatpickr.min.css"
  #   integrity="sha384-RkASv+6KfBMW9eknReJIJ6b3UnjKOKC5bOUaNgIY778NFbQ8MtWq9Lr/khUgqtTt%"
  #   crossorigin="anonymous">`
  #
  # @source ../../../app/views/components/flatpickr/_themes.html.erb

  def themes
    render 'components/flatpickr/themes'
  end
end
