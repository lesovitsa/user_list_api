require 'rails_helper'

RSpec.describe "Users", type: :request do

    before do
        User.destroy_all
        User.create(name: "John One", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Two", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Three", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Four", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Five", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Six", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Seven", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Eight", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Nine", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Ten", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Eleven", email: "doctor.who@tardis.com", phone: "0000000000")
        User.create(name: "John Twelve", email: "doctor.who@tardis.com", phone: "0000000000")
    end

    scenario "Sends a get request to get users on first page" do
        get "http://localhost:3000/users/all", params: {page: 1}

        expect(response).to have_http_status(:success)
        page = JSON.parse(response.body)["page"]
        users = JSON.parse(response.body)["users"]
        expect(users.length).to eq(10)
        expect(page).to eq(1)
    end

    scenario "Sends a get request to get users on default page" do
        get "http://localhost:3000/users/all"

        expect(response).to have_http_status(:success)
        page = JSON.parse(response.body)["page"]
        expect(page).to eq(1)
    end

    scenario "Sends a get request to get users on second page" do
        get "http://localhost:3000/users/all", params: {page: 2}

        expect(response).to have_http_status(:success)
        page = JSON.parse(response.body)["page"]
        users = JSON.parse(response.body)["users"]
        expect(users.length).to eq(2)
        expect(page).to eq(2)
    end
end