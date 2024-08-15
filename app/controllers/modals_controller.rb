# frozen_string_literal: true

class ModalsController < ApplicationController
  def lazy_modal_content
    sleep 3
  end
end
