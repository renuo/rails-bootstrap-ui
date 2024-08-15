# frozen_string_literal: true

class ModalComponentPreview < Lookbook::Preview
  include LookbookHelper

  # @source ../../../app/views/components/modals/_default.html.erb
  def default
    render 'components/modals/default'
  end

  # @label Lazy load with Turbo
  # @source ../../../app/views/components/modals/_lazy_modal.html.erb
  def lazy_load
    render 'components/modals/lazy_load'
  end
end
