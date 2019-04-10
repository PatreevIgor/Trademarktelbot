# frozen_string_literal: true

class FileManager
  def self.file_folder_list(path)
    massive_file_name = []
    Dir[path + '*'].select { |f| File.file? f }.map { |f| massive_file_name << (File.basename f) }

    massive_file_name
  end

  def self.create_seeds_file(m_hash_result)
    File.open('db/seeds.rb', 'w') do |file|
      exklusive_item_titles = []
      m_hash_result.each do |i_hash|
        next if exklusive_item_titles.include? i_hash['title']

        exklusive_item_titles << i_hash['title']
        file.puts "Item.create(hero_name: \"#{i_hash['hero_name']}\", title: \"#{i_hash['title']}\","\
                  " link: \"#{i_hash['url']}\")"
      end
    end
  end
end
