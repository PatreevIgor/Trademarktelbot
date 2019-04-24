namespace :fill_main_status do
  task run: :environment do
    ItemActualizer.new.update_main_status_fields
  end
end
