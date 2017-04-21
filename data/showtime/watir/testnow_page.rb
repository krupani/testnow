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
  end

  def fill_form_data(data)
    data.each do |value|
      case value.first.downcase
        when "name"
          name_field.send_keys(value.last)
        when "role"
          if value.last.downcase=="automation"
            automation_radio.click
          else
            manual_radio.click
          end
        when "language"
          @browser.select_list(:id,'lang').select(value.last)
      end
      terms_checkbox.click
    end
  end

  def submit_form
    if ENV['BROWSER'].downcase=='phantomjs'
      @browser.execute_script("window.alert = function(msg){window.msg=msg;return true;};")
      @browser.execute_script("window.confirm = function(msg){window.msg=msg;return true;};")
    end
    submit_button.click
  end

end