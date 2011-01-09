require 'spec_helper'

describe "PingPongs" do
  describe "GET /ping_pongs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ping_pongs_path
      response.status.should be(200)
    end
  end
end
