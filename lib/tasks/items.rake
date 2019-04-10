# frozen_string_literal: true
require 'pry'
namespace :items do
  task fill_image_link: :environment do
    Item.all.each do |item|
      item.image_link = "https://cdn.dota2.net//item/#{item.title.tr(' ', '+')}/300.png"
      item.save
    end
  end

  task create_seed_file: :environment do
    m_hash_result  = []
    file_name_list = FileManager.file_folder_list('public/uploads/Heroes_Weapons/')

    file_name_list.each do |hero_name|
      hero_file_path = 'public/uploads/Heroes_Weapons/' + hero_name

      File.open(hero_file_path) do |f|
        massive_hashes = JSON.parse(f.read)

        massive_hashes.each do |hash|
          next unless hash['url'][/item/]

          m_hash_result << { 'hero_name' => DataCleaner.clean_hero_name(hero_name),
                             'title'     => DataCleaner.clean_titile(hash['title']),
                             'url'       => hash['url'] }
        end
      end
    end

    FileManager.create_seeds_file(m_hash_result)
  end

  task delete_dubl_inscr_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Inscribed %'])
    items.each do |item|
      item.title = item.title.gsub('Inscribed ', '').capitalize
      item.save
    end

    delete_dubl_items
  end


  task delete_dubl_ausp_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Auspicious %'])
    items.each do |item|
      item.title = item.title.gsub('Auspicious ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_dubl_genuine_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Genuine %'])
    items.each do |item|
      item.title = item.title.gsub('Genuine ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_dubl_autographed_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Autographed %'])
    items.each do |item|
      item.title = item.title.gsub('Autographed ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_dubl_corrupted_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Corrupted %'])
    items.each do |item|
      item.title = item.title.gsub('Corrupted ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_dubl_cursed_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Cursed %'])
    items.each do |item|
      item.title = item.title.gsub('Cursed ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_dubl_infused_items: :environment do
    items = Item.all.where(['title LIKE ?', 'Infused %'])
    items.each do |item|
      item.title = item.title.gsub('Infused ', '').capitalize
      item.save
    end

    delete_dubl_items
  end

  task delete_titleize_items: :environment do
    delete_dubl_title_items
  end

  task delete_dubl_items: :environment do
    delete_dubl_items
  end
end

def delete_dubl_items
  unik_item_titles = []
  n = 0

  Item.all.each do |item|
    if unik_item_titles.include?(item.title)
      item.delete
      n += 1
    else
      unik_item_titles << item.title
    end
  end

  puts "Deleted #{n} Items"
end

def delete_dubl_title_items
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


# Написать один метод вместо этих всех, который будет из Heroic Dagger of the Outcast выявлять первое слово, по которому не ходится и удалять дубликаты
