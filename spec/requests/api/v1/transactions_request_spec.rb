require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    transactions = create_list(:transaction, 3)

    get '/api/v1/transactions'
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions["data"].count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id
    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["attributes"]["id"]).to eq(id)
  end
end
