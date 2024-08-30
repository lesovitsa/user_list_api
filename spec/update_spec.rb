require 'rails_helper'

RSpec.describe "Users", type: :request do

    before do
        @user = User.create(name: "David Tennant", email: "doctor.who@tardis.com", phone: "+44888749015")
    end

    scenario "Sends a patch request to change a user" do
        patch "http://localhost:3000/users/update", params: {id: @user["id"], name: "Michael Sheen"}

        expect(response).to have_http_status(:success)
        result = JSON.parse(response.body)["user"]
        expect(result["id"]).to eq(@user["id"])
        expect(result["name"]).to eq("Michael Sheen")
    end

    scenario "Sends a post request to update a user with an invalid name" do
        patch "http://localhost:3000/users/update", params: {id: @user["id"], name: "1234"}

        expect(response).to have_http_status(500)
    end

    scenario "Sends a post request to update a suer that doesn't exist" do
        patch "http://localhost:3000/users/update", params: {id: -1, name: "1234"}

        expect(response).to have_http_status(404)
    end

    after do
        @user.destroy
    end
end