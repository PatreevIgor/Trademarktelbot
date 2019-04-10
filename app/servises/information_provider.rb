# frozen_string_literal: true

class InformationProvider
  def inventory_items
    url = format(Constant::INVENTORY_ITEMS_URL, api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)['data']
  end

  def my_sell_offers
    url = format(Constant::MY_SELL_OFFERS_URL, api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)['offers']
  end

  def last_50_sales
    Connection.send_json_request(Constant::LAST_50_SALES_URL)
  end

  def last_50_sales_til_1_rub
    items = []
    last_50_sales.each do |item|
      items << item if item['price'] <= 1
    end

    items
  end

  def my_all_items
    inventory_items + my_sell_offers
  end

  def my_item_names
    massive_item_names = []

    inventory_items.each do |item|
      massive_item_names << item['i_name']
    end

    my_sell_offers.each do |item|
      massive_item_names << item['i_name']
    end

    massive_item_names.uniq
  end

  def item_inscribed?(item)
    url = format(Constant::ITEM_INFORMATION_URL, class_id:       item['class_id'],
                                                 instance_id:    item['instance_id'],
                                                 api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)['quality'] == 'Inscribed'
  end
end
