require 'testnow/chrome'
require 'testnow/opera'
require 'testnow/firefox'
require 'testnow/android'
require 'testnow/android_chrome'
require 'testnow/ie'

module TestNow

	def init
		ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
		case ENV['BROWSER'].downcase
    when "chrome"
      chrome = Chrome.new
      chrome.launch_driver_chrome
    when "android"
      TestNow.launch_driver_android
    when "opera"
      opera = Opera.new
      opera.launch_driver_opera
    when "androidchrome"
      ac = AndroidChrome.new
      ac.launch_driver_android_chrome
    when "ie"
      ie = IE.new
      ie.launch_driver_ie
    else
      ff = Firefox.new
      ff.launch_driver_firefox
    end
  end

  module Watir
    def init
      ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
      case ENV['BROWSER'].downcase
      when "chrome"
        chrome = Chrome.new
        chrome.launch_watir_chrome
      when "android"
        TestNow.launch_watir_android
      when "opera"
        opera = Opera.new
        opera.launch_watir_opera
      when "androidchrome"
        ac = AndroidChrome.new
        ac.launch_watir_android_chrome
      when "ie"
        ie = IE.new
        ie.launch_watir_ie
      else
        ff = Firefox.new
        ff.launch_watir_firefox
      end
    end
  end

end


