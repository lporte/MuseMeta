require_relative '/spec_helper'

describe "Artwork Controller" do

  describe 'GET /' do
    it "responds with an OK status" do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST /artworks' do
    it "is redirecting to correct artwork/:id" do
      post "/artworks", {title: "Les Demoiselles d'Avignon", source: "Lourve", date: "1907", image: "http://www.arthistoryarchive.com/arthistory/cubism/images/PabloPicasso-Les-Demoiselles-dAvignon-1907.jpg" }
      expect(last_response.redirect?).to be true
      follow_redirect!
      last_request.path == "/artworks/#{Artwork.last.id}"
    end

    it "creates a new url" do
      count_before = Artwork.count
      post "/artworks", {title: "Les Demoiselles d'Avignon", source: "Lourve", date: "1907", image: "http://www.arthistoryarchive.com/arthistory/cubism/images/PabloPicasso-Les-Demoiselles-dAvignon-1907.jpg" }
      count_after = Artwork.count
      expect(count_after).to be(count_before +1)
    end
  end

  describe ''

end