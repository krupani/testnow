
Given(/^I am on the test page$/) do
  testnow = TestNowPage.new(@browser)
  testnow.visit_page
  expect(@browser.title).to eq 'Testnow Form'
  expect(testnow.header.text).to eq 'TestNow Form'
end

When(/^I submit the form$/) do
  testnow = TestNowPage.new(@browser)
  testnow.submit_form
end

Then(/^I verify n accept the validation alert$/) do
  if ENV['BROWSER'].downcase!='phantomjs'
    # alert = @driver.switch_to.alert
    expect(@browser.alert.text).to eq "Please accept terms to submit the data."
    @browser.alert.ok
  else
    msg=@browser.execute_script("return window.msg")
    expect(msg).to eq "Please accept terms to submit the data."
  end
end

When(/^I fill following data:$/) do |table|
  @data = table.raw
  testnow = TestNowPage.new(@browser)
  testnow.fill_form_data(@data)
end

Then(/^I verify n accept the confirmation box$/) do
  if ENV['BROWSER'].downcase!='phantomjs'
    # confirm = @driver.switch_to.alert
    data = @browser.alert.text
    @data.each do |values|
      expect(data).to include(values.last)
    end
    @browser.alert.ok
  else
    msg=@browser.execute_script("return window.msg")
    @data.each do |values|
      expect(msg).to include(values.last)
    end
  end
end

And(/^I verify the acknowledgement$/) do
  testnow = TestNowPage.new(@browser)
  expect(testnow.header.text).to eq 'Thank you for using TestNow!!'
end