require 'rails_helper'

RSpec.describe "Users", type: :request do

    before do
        User.destroy_all
        User.create(name: "John One", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Two", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "Oliver One", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "Oliver Two", email: "doctor.who@tardis.com", phone: "0000000000")
    end

    scenario "Sends a get request to search users by first name" do
        get "http://localhost:3000/users/search", params: {name: "John"}

        expect(response).to have_http_status(:success)
        search = JSON.parse(response.body)["searched_name"]
        users = JSON.parse(response.body)["users"]
        expect(users.length).to eq(2)
        expect(search).to eq("John")
    end

    scenario "Sends a get request to search users by last name" do
        get "http://localhost:3000/users/search", params: {name: "One"}

        expect(response).to have_http_status(:success)
        search = JSON.parse(response.body)["searched_name"]
        users = JSON.parse(response.body)["users"]
        expect(users.length).to eq(2)
        expect(search).to eq("One")
    end

    scenario "Sends a get request to search users by a name that doesn't exist" do
        get "http://localhost:3000/users/search", params: {name: "Timmy"}

        expect(response).to have_http_status(:success)
        search = JSON.parse(response.body)["searched_name"]
        users = JSON.parse(response.body)["users"]
        expect(users.length).to eq(0)
        expect(search).to eq("Timmy")
    end
end