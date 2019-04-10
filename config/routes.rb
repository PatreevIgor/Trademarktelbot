# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'main#index'
  # get '/hero_items/:id', to: 'items#hero_items'
  resources :item
  resources :hero
end
