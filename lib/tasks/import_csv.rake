# lib/tasks/import_csv.rake
require 'csv'

namespace :import_csv do
  desc 'Import csv files to db'
  task merchants: :environment do

    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create! row.to_hash
    end

    puts "Created #{Merchant.all.count} merchants."
  end
end
