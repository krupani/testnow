require File.join(File.dirname(__FILE__),'/../spec_helper')

describe "As a github user, my public profile" do
	
	before(:each) do
		@browser.goto(ENV['TEST_URL'])
	end

	it "should display my name" do
		git = TestnowPage.new(@browser)
		git.search_github("Kaushal Rupani")
		git.click_tab("Users")
		git.verify_text_presence("Kaushal")
		git.visit_profile
		git.verify_text_presence("Kaushal Rupani")
	end

end