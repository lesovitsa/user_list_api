require 'rails_helper'

RSpec.describe "Feeds", type: :request do

    before do
        @user = User.create(name: "David Tennant", email: "doctor.who@tardis.com", phone: "+44888749015")
    end

    scenario "Sends a delete request to delete a user" do
        delete "http://localhost:3000/users/delete", params: {id: @user["id"]}

        expect(response).to have_http_status(:success)
        result = JSON.parse(response.body)["user"]
        expect(result["id"]).to eq(@user["id"])
        expect { User.find(@user["id"]) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    scenario "Sends a delete request to delete a feed that does not exist" do

        delete "http://localhost:3000/users/delete", params: {id: -1}

        expect(response).to have_http_status(404);
    end
end