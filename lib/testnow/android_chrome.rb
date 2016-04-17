module TestNow

  def launch_driver_android_chrome
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120
    caps = {'chromeOptions'=> {'androidPackage' => 'com.android.chrome'}}
    @driver = Selenium::WebDriver.for(:remote, :http_client => client, :url => "http://localhost:9515", :desired_capabilities => caps)
    @driver.manage.timeouts.implicit_wait = 60
    @driver
  end

end