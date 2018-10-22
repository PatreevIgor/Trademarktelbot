# frozen_string_literal: true

class InformationProvider
  def get_current_trades # вещи которые на продаже
    url = format(Constant::CURRENT_TRADES_URL, api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)
  end

  def get_inventory_items
    url = format(Constant::INVENTORY_ITEMS_URL, api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)
  end

  def get_items_on_sale
    url = format(Constant::SALE_ITEMS_URL, api_market_key: Rails.application.secrets.api_market_key)

    Connection.send_json_request(url)
  end
end
