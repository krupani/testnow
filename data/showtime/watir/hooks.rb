Before do
  @browser = TestNow.init
end

After do |scenario|
  if scenario.failed?
    begin
      capture_n_embed
    rescue
      p "*** Could not take failed scenario screenshot ***"
    end
  end
  quit_driver
end

AfterStep do
  begin
    capture_n_embed
  rescue
    # Do nothing, screenshot fails in cases of alerts
  end
end

def capture_n_embed
  encoded_img = driver.screenshot_as(:base64)
  embed("#{encoded_img}", "image/png;base64")
end

def driver
  @browser.driver
end

def quit_driver
  @browser.quit
end