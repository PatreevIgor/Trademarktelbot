class ItemActualizer
  def update_main_status_field
    # information_provider.last_50_sales.each do |item|
    #   # Проверить входит ли айтем в список моих товаров
    #     # если входит - то проверить является ли эта вещь чистой, т.е.
    #       # "description": [
    #       #     {
    #       #         "type": "html",
    #       #         "value": "Used By: Monkey King"
    #       #     },
    #       #     {
    #       #         "value": "Gift From: wickson",
    #       #         "color": "99ccff"
    #       #     },
    #       #     {
    #       #         "type": "html",
    #       #         "value": "Date Received: Aug 21, 2018 (10:10:17)"
    #       #     },
    #       #     {
    #       #         "value": "Dedication: ijam kacak",
    #       #         "color": "99ccff"
    #       #     },
    #       #     {
    #       #         "type": "html",
    #       #         "value": "Though well suited to serve the Monkey King's martial needs, Wukong's staff originally found service in the more mundane pursuit of measuring the depths of newly-formed seas.\r\n\t<br><br>\r\n\tImmortal items cannot be traded or marketed through The International 2018, but can still be gifted once."
    #       #     }
    #       # ],
    #       #
    #       # Если не является - то ничего не делать, если является, установить значение поля main_status как true и обновить ссылку на новую (поле link)
    #     # Если не входит то ничего не делать.
    # end
  end

  private

  def information_provider
    @information_provider ||= InformationProvider.new
  end
end
