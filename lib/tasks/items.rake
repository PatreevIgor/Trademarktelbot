# frozen_string_literal: true

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
end
