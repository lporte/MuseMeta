require_relative '/spec_helper'

describe "User Controller" do

  describe 'GET /' do
    it "responds with an OK status" do
      get '/users'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST /users' do
    it "is redirecting to correct users/:id" do
      post "/users", {username: "Steve", password: "ForURHealth" }
      expect(last_response.redirect?).to be true
      follow_redirect!
      last_request.path == "/users/#{User.last.id}"
    end

    it "creates a new user in the db" do
      count_before = User.count
      post "/users", {username: "Steve", password: "ForURHealth" }
      count_after = User.count
      expect(count_after).to be(count_before + 1)
    end
  end

end