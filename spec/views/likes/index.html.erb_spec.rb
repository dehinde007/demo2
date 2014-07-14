require 'spec_helper'

describe "likes/index" do
  before(:each) do
    assign(:likes, [
      stub_model(Like,
        :micropost_id => 1,
        :user_id => 2,
        :heart => false
      ),
      stub_model(Like,
        :micropost_id => 1,
        :user_id => 2,
        :heart => false
      )
    ])
  end

  it "renders a list of likes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
