class TestNowPage < WebObject

  # Different locators such as xpaths, name, css are used in mixed fashion for demo purpose
  element :header, {:id => 'header'}
  element :form, {:name => 'testnow-form'}
  element :name_field, {:id => 'name'}
  element :automation_radio, {:css => '[value=Automation]'}
  element :manual_radio, {:css => '[value=Manual]'}
  element :language_dropdown, {:id => 'lang'}
  element :terms_checkbox, {:xpath => '//*[@id="terms"]'}
  element :submit_button, {id: 'button'}

  def visit_page
    ENV['TEST_URL'] = "http://krupani.github.io/testnow_form" if ENV['TEST_URL'].nil?
    @driver.get(ENV['TEST_URL'])
  end

  def verify_n_accept_validation_alert
    if ENV['BROWSER'].downcase!='phantomjs'
      alert = @driver.switch_to.alert
      expect(alert.text).to eq "Please accept terms to submit the data."
      alert.accept
    else
      msg=@driver.execute_script("return window.msg")
      expect(msg).to eq "Please accept terms to submit the data."
    end
  end

  def fill_form_data(data)
    data.each do |key,value|
      case key.downcase
        when "name"
          name_field.send_keys(value)
        when "role"
          if value.downcase=="automation"
            automation_radio.click
          else
            manual_radio.click
          end
        when "language"
          select = Selenium::WebDriver::Support::Select.new(language_dropdown)
          select.select_by(:text, value)
      end
    end
    terms_checkbox.click
  end

  def verify_n_accept_confirmation(expected)
    if ENV['BROWSER'].downcase!='phantomjs'
      confirm = @driver.switch_to.alert
      data = confirm.text
      expected.values.each do |val|
        expect(data).to include(val)
      end
      confirm.accept
    else
      msg=@driver.execute_script("return window.msg")
      expected.values.each do |val|
        expect(msg).to include(val)
      end
    end
  end

  def submit_form
    if ENV['BROWSER'].downcase=='phantomjs'
      @driver.execute_script("window.alert = function(msg){window.msg=msg;return true;};")
      @driver.execute_script("window.confirm = function(msg){window.msg=msg;return true;};")
    end
    submit_button.click
  end

  def verify_acknowledgement
    expect(header.text).to eq 'Thank you for using TestNow!!'
  end

end