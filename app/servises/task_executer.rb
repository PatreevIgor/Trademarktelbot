# frozen_string_literal: true

class TaskExecuter
  def find_new_cheap_items
    last_50_sales_til_1_rub.each do |item|
      if inventary_has_similar_item?(item)
        puts 'inventary_has_similar_item = ' + item['hash_name'].to_s
      elsif !inventary_has_similar_item?(item) && information_provider.item_inscribed?(item)
        puts 'new inscribed items: ' + item['hash_name']
      end
    end
  end

  private

  def last_50_sales_til_1_rub
    information_provider.last_50_sales_til_1_rub
  end

  def information_provider
    @information_provider ||= InformationProvider.new
  end

  def my_all_items
    information_provider.inventory_items + information_provider.my_sell_offers
  end

  def inventary_has_similar_item?(new_item)
    result = false
    my_item_names.each do |my_item_name|
      result = true if my_item_name.include?(new_item['hash_name'])
      break if result == true
    end

    result
  end

  def my_item_names
    information_provider.my_item_names
  end
end
