# frozen_string_literal: true

class LinkGenerator
  def generate_link(item_hash)
    format(Constant::ITEM_LINK_URL, class_id:           item_hash['classid'],
                                    instance_id:        item_hash['instanceid'],
                                    i_market_hash_name: item_hash['hash_name'].gsub(' ','+'))
  end
end
