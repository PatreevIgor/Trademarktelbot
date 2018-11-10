# frozen_string_literal: true

class TaskExecuter
  def find_new_cheap_items
    last_50_sales.each do |item|
      if inventary_has_item?(item)
        puts 'next'
      else 
        puts 'new items: ' + item['hash_name']
      end
    end
  end

  private

  def last_50_sales
    information_provider.last_50_sales
  end

  def information_provider
    @information_provider ||= InformationProvider.new
  end

  def my_all_items
    information_provider.inventory_items + information_provider.my_sell_offers
  end

  def inventary_has_item?(new_item)
    my_item_names.include?(new_item['hash_name']) ? true : false
  end

  def my_item_names
    information_provider.my_item_names
  end
end
