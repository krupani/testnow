
Given(/^I am on the test page$/) do
  testnow = TestNowPage.new(@driver)
  testnow.visit_page
  expect(@driver.title).to eq 'Testnow Form'
  expect(testnow.header.text).to eq 'TestNow Form'
end

When(/^I fill following data:$/) do |table|
  @data = table.raw
  testnow = TestNowPage.new(@driver)
  testnow.fill_form_data(@data)
end

And(/^I submit the form$/) do
  testnow = TestNowPage.new(@driver)
  testnow.submit_form
end

Then(/^I verify n accept the validation alert$/) do
  if ENV['BROWSER'].downcase!='phantomjs'
    alert = @driver.switch_to.alert
    expect(alert.text).to eq "Please accept terms to submit the data."
    alert.accept
  else
    msg=@driver.execute_script("return window.msg")
    expect(msg).to eq "Please accept terms to submit the data."
  end
end

Then(/^I verify n accept the confirmation box$/) do
  if ENV['BROWSER'].downcase!='phantomjs'
    confirm = @driver.switch_to.alert
    data = confirm.text
    @data.each do |values|
      expect(data).to include(values.last)
    end
    confirm.accept
  else
    msg=@driver.execute_script("return window.msg")
    @data.each do |values|
      expect(msg).to include(values.last)
    end
  end
end

And(/^I verify the acknowledgement$/) do
  testnow = TestNowPage.new(@driver)
  expect(testnow.header.text).to eq 'Thank you for using TestNow!!'
end