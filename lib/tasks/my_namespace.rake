# frozen_string_literal: true

namespace :items do
  desc 'Fill field image_link'
  task fill_image_link: :environment do
    Item.all.each do |item|
      item.image_link = "https://cdn.dota2.net//item/#{item.title.tr(' ', '+')}/300.png"
      item.save
    end
  end
end
