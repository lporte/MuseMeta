require 'spec_helper'

describe "Tweet Controller" do

  describe "GET /" do
    it "responds with an OK status" do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end


end
