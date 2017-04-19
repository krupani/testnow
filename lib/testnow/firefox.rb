# module TestNow
class Firefox

  #Firefox browser
  def launch_driver_firefox
    caps = Selenium::WebDriver::Remote::Capabilities.firefox(:marionette => false)
    ENV['IS_UPA'] = "false" if ENV['IS_UPA'].nil?
    if ENV['IS_UPA']=="true"
      ENV['HAR_DIR'] = get_tmp_dir if ENV['HAR_DIR'].nil?
      puts "=>=>=>  Your HAR (UPA) files will be created here : #{ENV['HAR_DIR']}"
      firebug = File.absolute_path(File.dirname(__FILE__)+"/../../data/firebug-2.0.13.xpi")
      net_export = File.absolute_path(File.dirname(__FILE__)+"/../../data/netExport-0.8.xpi")
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.add_extension(firebug)
      profile.add_extension(net_export)
      profile['extensions.firebug.currentVersion'] = "2.0.13"
      profile['extensions.firebug.allPagesActivation'] = "on"
      profile['extensions.firebug.defaultPanelName'] = "net"
      profile['extensions.firebug.net.enableSites'] = "true"
      profile['extensions.firebug.netexport.alwaysEnableAutoExport'] = "true"
      profile['extensions.firebug.netexport.showPreview'] = "false"
      profile['extensions.firebug.netexport.defaultLogDir'] = ENV['HAR_DIR'].to_s
      profile['extensions.firebug.netexport.defaultFileName'] = "upaReport.har"
      profile['extensions.firebug.netexport.jsonpCallback'] = "jsonCallback"
      driver = Selenium::WebDriver.for(:firefox, :profile => profile, :desired_cpabilities => caps)
    else
      driver = Selenium::WebDriver.for(:firefox, :desired_cpabilities => caps)
    end
    driver.manage.timeouts.implicit_wait = 30
    driver.manage.timeouts.page_load = 120
    driver.manage.window.maximize
    driver
  end

  def get_tmp_dir
    case RUBY_PLATFORM
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        return `echo %TEMP%`
      when /darwin|mac os/
        return "/tmp/"
      else
        return "/tmp/"
    end
  end

  def launch_watir_firefox
    caps = Selenium::WebDriver::Remote::Capabilities.firefox(:marionette => false)
    browser = Watir::Browser.new(:firefox, :desired_capabilities => caps)
    browser.driver.manage.timeouts.implicit_wait = 30
    browser.driver.manage.timeouts.page_load = 120
    browser.driver.manage.window.maximize
    return browser
  end

end