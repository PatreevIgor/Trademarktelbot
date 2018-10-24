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
end
