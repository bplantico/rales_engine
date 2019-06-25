# lib/tasks/import_csv.rake
require 'csv'

namespace :import_csv do
  desc 'Import csv files to db'
    task merchants: :environment do
      CSV.foreach('./data/merchants.csv', headers: true) do |row|
        Merchant.create! row.to_hash
      end

      puts "Created #{Merchant.all.count} merchant(s)."
    end

    task customers: :environment do
      CSV.foreach('./data/customers.csv', headers: true) do |row|
        Customer.create! row.to_hash
      end

      puts "Created #{Customer.all.count} customer(s)."
    end

    task items: :environment do
      CSV.foreach('./data/items.csv', headers: true) do |row|
        Item.create! row.to_hash
      end

      puts "Created #{Item.all.count} item(s)."
    end

    task invoices: :environment do
      CSV.foreach('./data/invoices.csv', headers: true) do |row|
        Invoice.create! row.to_hash
      end

      puts "Created #{Invoice.all.count} invoice(s)."
    end

    task invoice_items: :environment do
      CSV.foreach('./data/invoice_items.csv', headers: true) do |row|
        InvoiceItem.create! row.to_hash
      end

      puts "Created #{InvoiceItem.all.count} invoice item(s)."
    end

    task transactions: :environment do
      CSV.foreach('./data/transactions.csv', headers: true) do |row|
        Transaction.create! row.to_hash
      end

      puts "Created #{Transaction.all.count} transaction(s)."
    end
end
