require 'testnow/chrome'
require 'testnow/opera'
require 'testnow/firefox'
require 'testnow/android'
require 'testnow/android_chrome'
require 'testnow/ie'
require 'testnow/edge'
require 'testnow/firefox_gecko'

module TestNow

  def init
    ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
    case ENV['BROWSER'].downcase.gsub(" ","").gsub("_","")
      when "chrome"
        chrome = Chrome.new
        chrome.launch_driver_chrome
      when "android"
        puts "Coming Soon!!\n"
        puts "Apologies for inconvenience...\n\n"
      when "opera"
        opera = Opera.new
        opera.launch_driver_opera
      when "androidchrome","chromeandroid"
        ac = AndroidChrome.new
        ac.launch_driver_android_chrome
      when "ie"
        ie = IE.new
        ie.launch_driver_ie
      when "edge"
        edge = MicrosoftEdge.new
        edge.launch_driver_edge
      when "firefoxgecko","geckofirefox","firefoxnew","newfirefox"
        firefox_gecko = FirefoxGecko.new
        firefox_gecko.launch_driver_firefox_gecko
      when "phantomjs"
        puts "Coming Soon!!\n"
        puts "Apologies for inconvenience...\n\n"
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
          puts "Coming Soon!!\n"
          puts "Apologies for inconvenience...\n\n"
        when "opera"
          opera = Opera.new
          opera.launch_watir_opera
        when "androidchrome"
          ac = AndroidChrome.new
          ac.launch_watir_android_chrome
        when "ie"
          ie = IE.new
          ie.launch_watir_ie
        when "edge"
          edge = MicrosoftEdge.new
          edge.launch_watir_edge
        when "firefoxgecko","geckofirefox","firefoxnew","newfirefox"
          firefox_gecko = FirefoxGecko.new
          firefox_gecko.launch_watir_firefox_gecko
        else
          ff = Firefox.new
          ff.launch_watir_firefox
      end
    end
  end

end


