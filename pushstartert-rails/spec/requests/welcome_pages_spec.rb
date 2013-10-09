require 'spec_helper'

describe "WelcomePages" do
  subject { page }
  before { visit root_path }

  describe "get welcome (index) page" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      should have_content("Welcome ~ index")
    end
  end

  describe "check a project" do
    let(:project) { FactoryGirl.create(:project) }
    before { visit project_path(project) }
    it { should have_content(project.name) }
  end
end
