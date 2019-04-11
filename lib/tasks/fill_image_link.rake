namespace :fill_image_link do
  task run: :environment do
    Item.all.each do |item|
      item.image_link = "https://cdn.dota2.net//item/#{item.title.tr(' ', '+')}/300.png"
      item.save
    end
  end
end
