require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :micropost_id => 1,
      :user_id => 1,
      :body => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_micropost_id[name=?]", "comment[micropost_id]"
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
