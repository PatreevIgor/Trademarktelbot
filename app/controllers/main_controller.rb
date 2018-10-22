# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @current_trades  = information_provider.get_current_trades
    @inventory_items = information_provider.get_inventory_items
    @items_on_sale   = information_provider.get_items_on_sale
  end

  private

  def information_provider
    @information_provider ||= InformationProvider.new
  end
end
