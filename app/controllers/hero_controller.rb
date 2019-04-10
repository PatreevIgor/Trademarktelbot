# frozen_string_literal: true

class HeroController < ApplicationController
  def show
    @hero_items = Item.all.where(hero_name: params['id'])
  end
end
