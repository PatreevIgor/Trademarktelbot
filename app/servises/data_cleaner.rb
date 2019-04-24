# frozen_string_literal: true

class DataCleaner
  attr_reader :prefixes

  def initialize
    @prefixes = %w[Infused Cursed Corrupted Autographed Genuine Auspicious Inscribed Heroic Elder Unusual Exalted Frozen
                   Compendium]
  end

  def self.clean_titile(title)
    title[/^(.*?)[|]/].chomp(' |')
  end

  def self.clean_hero_name(hero_name)
    hero_name.chomp('.json')
  end

  def clean_name(hash_name)
    prefixes.each do |prefix|
      hash_name.gsub(prefix,'').lstrip! if hash_name.include?(prefix)
    end

    hash_name
  end
end

