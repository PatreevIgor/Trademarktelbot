require 'pry'

class ItemActualizer 
  attr_reader :api_market_key

  def initialize
    @api_market_key =       Rails.application.secrets.api_market_key
  end

  def update_main_status_fields
    n = 0
    loop do
      information_provider.last_50_sales.each do |item|
        if item_exists?(item)
        # binding.pry
          puts "Find exist item! #{item}"
          if item_is_main?(item)
            db_item = Item.where(title: data_cleaner.clean_name(item['hash_name'])).first
            db_item.main_status = true
            db_item.save

            puts "Item #{Item.name} updated! - true"
            puts "Item link #{LinkGenerator.new.generate_link(item)}"

          else
            db_item = Item.where(title: data_cleaner.clean_name(item['hash_name'])).first
            db_item.main_status = false
            db_item.save

            puts "Item #{Item.name} updated! - false"
            puts "Item link #{LinkGenerator.new.generate_link(item)}"
          end
        end

        puts 'Check other item!'
      end

      n += 1
      puts n
      break if n == 100
      sleep 1
    end
  end

  def item_is_main?(item)
    item_information_url = format(Constant::ITEM_INFORMATION_URL, class_id:       item['classid'],
                                                                  instance_id:    item['instanceid'],
                                                                  api_market_key: api_market_key)
    description = Connection.send_json_request(item_information_url)['description']

    binding.pry
    unless Connection.send_json_request(item_information_url)['success'] == false
      description.each do |hash|
        return false if hash['value'].include?('Gift')
        return false if hash['value'].include?('Dedication')
        return false if hash['value'].include?('Date Received')
        return false if hash['value'].include?('div style')
      end

      return true
    end
  end


  private

  def item_exists?(item)
    clean_name = data_cleaner.clean_name(item['hash_name'])

    Item.exists?(title: clean_name) ? true : false
  end

  def item_inscribed?(item)
    item_information_url = format(Constant::ITEM_INFORMATION_URL, class_id:       item['classid'],
                                                                  instance_id:    item['instanceid'],
                                                                  api_market_key: api_market_key)


    Connection.send_json_request(item_information_url)['quality'] == 'Inscribed'
  end


  def information_provider
    @information_provider ||= InformationProvider.new
  end

  def data_cleaner
    @data_cleaner ||= DataCleaner.new
  end
end
