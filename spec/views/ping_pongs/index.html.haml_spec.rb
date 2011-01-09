require 'spec_helper'

describe "ping_pongs/index.html.haml" do
  before(:each) do
    assign(:ping_pongs, [
      stub_model(PingPong,
        :precedent_id => 1,
        :ping => "Ping",
        :pong => "Pong",
        :play_mode => "Play Mode"
      ),
      stub_model(PingPong,
        :precedent_id => 1,
        :ping => "Ping",
        :pong => "Pong",
        :play_mode => "Play Mode"
      )
    ])
  end

  it "renders a list of ping_pongs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ping".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pong".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Play Mode".to_s, :count => 2
  end
end
