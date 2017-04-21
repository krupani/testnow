
Given(/^I am on the test page$/) do
  testnow = TestNowPage.new(@driver)
  testnow.visit_page
  expect(@driver.title).to eq 'Testnow Form'
  expect(testnow.header.text).to eq 'TestNow Form'
end

When(/^I fill following data:$/) do |table|
  @data = table.hashes
  testnow = TestNowPage.new(@driver)
  testnow.fill_form_data(@data)
end

And(/^I submit the form$/) do
  testnow = TestNowPage.new(@driver)
  testnow.submit_form
end

Then(/^I verify n accept the validation alert$/) do
  testnow = TestNowPage.new(@driver)
  testnow.verify_n_accept_validation_alert
end

Then(/^I verify n accept the confirmation box$/) do
  testnow = TestNowPage.new(@driver)
  testnow.verify_n_accept_confirmation(@data)
end

And(/^I verify the acknowledgement$/) do
  testnow = TestNowPage.new(@driver)
  testnow.verify_acknowledgement
end