require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :funding_goal => 1.5,
      :funded => 1.5,
      :state => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_funding_goal[name=?]", "project[funding_goal]"
      assert_select "input#project_funded[name=?]", "project[funded]"
      assert_select "input#project_state[name=?]", "project[state]"
    end
  end
end
