require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "Name",
        :funding_goal => 1.5,
        :funded => 1.5,
        :state => "State"
      ),
      stub_model(Project,
        :name => "Name",
        :funding_goal => 1.5,
        :funded => 1.5,
        :state => "State"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
