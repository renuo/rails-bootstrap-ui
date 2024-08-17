# frozen_string_literal: true

class CountriesController < ApplicationController
  def index
    @countries = Country.all
                        .filter { |country| country.name.downcase.include?(params[:q].to_s.downcase) }
                        .map { |country| { label: country.name, value: country.code } }
    render json: @countries
  end
end
