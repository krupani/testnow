
Given(/^I am on the test page$/) do
  testnow = TestNowPage.new(@browser)
  testnow.visit_page
end

When(/^I submit the form$/) do
  testnow = TestNowPage.new(@browser)
  testnow.submit_form
end

Then(/^I verify n accept the validation alert$/) do
  testnow = TestNowPage.new(@browser)
  testnow.verify_n_accept_validation_alert
end

When(/^I fill following data:$/) do |table|
  @data = table.hashes.first
  testnow = TestNowPage.new(@browser)
  testnow.fill_form_data(@data)
end

Then(/^I verify n accept the confirmation box$/) do
  testnow = TestNowPage.new(@browser)
  testnow.verify_n_accept_confirmation(@data)
end

And(/^I verify the acknowledgement$/) do
  testnow = TestNowPage.new(@browser)
  testnow.verify_acknowledgement
end