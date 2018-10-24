# frozen_string_literal: true

class MainController < ApplicationController
  def index
    # some code
  end

  private

  def information_provider
    @information_provider ||= InformationProvider.new
  end
end
