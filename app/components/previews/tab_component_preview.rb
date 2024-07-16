# frozen_string_literal: true

class TabComponentPreview < Lookbook::Preview
  # @!group nav_underline
  def standalone_tab_underline
    render template: 'components/tabs/_tab_underline_standalone'
  end

  def tab_underline_in_card
    render template: 'components/tabs/_tab_underline_card'
  end
  # @!endgroup
end
