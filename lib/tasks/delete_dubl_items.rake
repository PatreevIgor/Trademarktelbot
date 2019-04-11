namespace :delete_dubl_items do
  task run: :environment do
    m = %w[Infused Cursed Corrupted Autographed Genuine Auspicious Inscribed Heroic]

    m.each do |prefix|
      items = Item.all.where(['title LIKE ?', prefix + ' %'])
      items.each do |item|
        item.title = item.title.gsub(prefix + ' ', '').capitalize
        item.save
      end
    end

    delete_dubl_items
  end
end

def delete_dubl_items
  unik_item_titles = []
  n = 0

  Item.all.each do |item|
    if unik_item_titles.include?(item.title.titleize)
      item.delete
      n += 1
    else
      unik_item_titles << item.title.titleize
    end
  end

  puts "Deleted #{n} Items"
end
