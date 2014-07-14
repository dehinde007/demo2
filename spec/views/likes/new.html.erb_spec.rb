require 'spec_helper'

describe "likes/new" do
  before(:each) do
    assign(:like, stub_model(Like,
      :micropost_id => 1,
      :user_id => 1,
      :heart => false
    ).as_new_record)
  end

  it "renders new like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", likes_path, "post" do
      assert_select "input#like_micropost_id[name=?]", "like[micropost_id]"
      assert_select "input#like_user_id[name=?]", "like[user_id]"
      assert_select "input#like_heart[name=?]", "like[heart]"
    end
  end
end
