namespace :fill_main_status do
  task run: :environment do
    Item.all.each do |item|
      # item.main = "https://cdn.dota2.net//item/#{item.title.tr(' ', '+')}/300.png"
      # item.save
    end
  end
end
