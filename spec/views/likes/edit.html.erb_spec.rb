require 'spec_helper'

describe "likes/edit" do
  before(:each) do
    @like = assign(:like, stub_model(Like,
      :micropost_id => 1,
      :user_id => 1,
      :heart => false
    ))
  end

  it "renders the edit like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", like_path(@like), "post" do
      assert_select "input#like_micropost_id[name=?]", "like[micropost_id]"
      assert_select "input#like_user_id[name=?]", "like[user_id]"
      assert_select "input#like_heart[name=?]", "like[heart]"
    end
  end
end
