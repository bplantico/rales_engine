# README

Welcome to RalesEngine, a solo project by Brian Plantico. I did this project as a student of Back-End Web Development at Turing School of Software and Design in Module 3.

* RUBY VERSION
   ruby 2.4.1p111

* SETUP

After the repository has been forked/cloned to your local machine, run `bundle install` and `bundle update` from a terminal within the project directory.
Then also run `rake db:{create,migrate}` in order to create the database and current schema.
Finally, run `rake import_csv:{merchants,customers,items,invoices,invoice_items,transactions}` in order to automatically import the corresponding records to your development database. There are six .csv files that are imported from, however, it's also possible to import the csv's individually by running `rake import_csv:<csv_name>` where <csv_name> is replaced by either merchants, customers, items, invoices, invoice_items, or transactions.

