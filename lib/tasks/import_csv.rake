# lib/tasks/import_csv.rake
require 'csv'

namespace :import_csv do
  desc 'Import csv files to db'
    task merchants: :environment do
      CSV.foreach('./data/merchants.csv', headers: true) { |row| Merchant.create! row.to_hash }
      puts "Created #{Merchant.all.count} merchant(s)."
    end

    task customers: :environment do
      CSV.foreach('./data/customers.csv', headers: true) { |row| Customer.create! row.to_hash }
      puts "Created #{Customer.all.count} customer(s)."
    end

    task items: :environment do
      CSV.foreach('./data/items.csv', headers: true) { |row| Item.create! row.to_hash }
      puts "Created #{Item.all.count} item(s)."
    end

    task invoices: :environment do
      CSV.foreach('./data/invoices.csv', headers: true) { |row| Invoice.create! row.to_hash }
      puts "Created #{Invoice.all.count} invoice(s)."
    end

    task invoice_items: :environment do
      CSV.foreach('./data/invoice_items.csv', headers: true) { |row| InvoiceItem.create! row.to_hash }
      puts "Created #{InvoiceItem.all.count} invoice item(s)."
    end

    task transactions: :environment do
      CSV.foreach('./data/transactions.csv', headers: true) { |row| Transaction.create! row.to_hash }
      puts "Created #{Transaction.all.count} transaction(s)."
    end
end
