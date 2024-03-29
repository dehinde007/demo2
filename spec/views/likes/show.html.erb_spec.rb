require 'spec_helper'

describe "likes/show" do
  before(:each) do
    @like = assign(:like, stub_model(Like,
      :micropost_id => 1,
      :user_id => 2,
      :heart => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
