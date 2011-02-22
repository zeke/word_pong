require 'spec_helper'

describe "ping_pongs/edit.html.haml" do
  before(:each) do
    @ping_pong = assign(:ping_pong, stub_model(PingPong,
      :serve_id => 1,
      :ping => "MyString",
      :pong => "MyString",
      :play_mode => "MyString"
    ))
  end

  it "renders the edit ping_pong form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ping_pong_path(@ping_pong), :method => "post" do
      assert_select "input#ping_pong_serve_id", :name => "ping_pong[serve_id]"
      assert_select "input#ping_pong_ping", :name => "ping_pong[ping]"
      assert_select "input#ping_pong_pong", :name => "ping_pong[pong]"
      assert_select "input#ping_pong_play_mode", :name => "ping_pong[play_mode]"
    end
  end
end
