require 'spec_helper'

describe "ping_pongs/show.html.haml" do
  before(:each) do
    @ping_pong = assign(:ping_pong, stub_model(PingPong,
      :precedent_id => 1,
      :ping => "Ping",
      :pong => "Pong",
      :play_mode => "Play Mode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ping/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pong/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Play Mode/)
  end
end
