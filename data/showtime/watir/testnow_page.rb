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

  def initialize(browser)
    @browser = browser
    super(browser.driver)
  end

  def visit_page
    path = File.absolute_path('testnow_form.html','lib')
    ENV['TEST_URL'] = "file://#{path}" if ENV['TEST_URL'].nil?
    @browser.goto(ENV['TEST_URL'])
    expect(@browser.title).to eq 'Testnow Form'
    expect(header.text).to eq 'TestNow Form'
  end

  def verify_n_accept_validation_alert
    if ENV['BROWSER'].downcase!='phantomjs'
      expect(@browser.alert.text).to eq "Please accept terms to submit the data."
      @browser.alert.ok
    else
      msg=@browser.execute_script("return window.msg")
      expect(msg).to eq "Please accept terms to submit the data."
    end
  end

  def fill_form_data(data)
    data.each do |hash|
      case hash.keys.first.downcase
        when "name"
          name_field.send_keys(hash.values.last)
        when "role"
          if hash.values.last.downcase=="automation"
            automation_radio.click
          else
            manual_radio.click
          end
        when "language"
          @browser.select_list(:id,'lang').select(hash.values.last)
      end
      terms_checkbox.click
    end
  end

  def verify_n_accept_confirmation(expected)
    if ENV['BROWSER'].downcase!='phantomjs'
      data = @browser.alert.text
      expected.each do |hash|
        expect(data).to include(hash.values.last)
      end
      @browser.alert.ok
    else
      msg=@browser.execute_script("return window.msg")
      expected.each do |hash|
        expect(msg).to include(hash.values.last)
      end
    end
  end

  def submit_form
    if ENV['BROWSER'].downcase=='phantomjs'
      @browser.execute_script("window.alert = function(msg){window.msg=msg;return true;};")
      @browser.execute_script("window.confirm = function(msg){window.msg=msg;return true;};")
    end
    submit_button.click
  end

  def verify_acknowledgement
    expect(header.text).to eq 'Thank you for using TestNow!!'
  end

end