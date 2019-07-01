require 'rails_helper'

describe "Invoice_Items API" do
  it "sends a list of invoice_items" do
    invoice_items = create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items["data"].count).to eq(3)
  end

  it "can get one invoice_item by its id" do
    id = create(:invoice_item).id
    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["attributes"]["id"]).to eq(id)
    # circle back. If <["attributes"]> is removed, the return is a string which fails the test
  end
end
