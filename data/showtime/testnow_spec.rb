require File.join(File.dirname(__FILE__),'/../spec_helper')

describe "As a TestNow user, I want to submit my professional data" do
	
	before(:each) do
		testnow = TestNowPage.new(@driver)
		testnow.visit_page
	end

	it "should display acknowledgement message" do
		testnow = TestNowPage.new(@driver)
		testnow.submit_form
		testnow.verify_n_accept_validation_alert
    data=([{'Name'=>'Kaushal Rupani'},{'Role'=>'Automation'},{'Language'=>'Ruby'}])
    testnow.fill_form_data(data)
		testnow.submit_form
		testnow.verify_n_accept_confirmation(data)
    testnow.verify_acknowledgement
	end

end