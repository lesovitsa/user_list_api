require 'rails_helper'

RSpec.describe "Users", type: :request do

    scenario "Sends a post request to add a user with valid data" do
        post "http://localhost:3000/users/add", params: {name: "David Tennant", email: "doctor.who@tardis.com", phone: "+44888749015"}

        expect(response).to have_http_status(:success)
        user = JSON.parse(response.body)["user"]
        expect(user["name"]).to eq("David Tennant")
        expect(user["email"]).to eq("doctor.who@tardis.com")
        expect(user["phone"]).to eq("+44888749015")
    end

    scenario "Sends a post request to add a user with missing data" do
        post "http://localhost:3000/users/add", params: {name: "David Tennant", email: "doctor.who@tardis.com"}

        expect(response).to have_http_status(500)
        user = JSON.parse(response.body)
        expect(user["error"]).to eq("Failed to add user")
    end
end