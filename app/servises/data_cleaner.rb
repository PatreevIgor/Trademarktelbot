# frozen_string_literal: true

class DataCleaner
  def self.clean_titile(title)
    title[/^(.*?)[|]/].chomp(' |')
  end

  def self.clean_hero_name(hero_name)
    hero_name.chomp('.json')
  end
end
