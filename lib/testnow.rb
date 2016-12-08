require 'testnow/chrome'
require 'testnow/opera'
require 'testnow/firefox'
require 'testnow/android'
require 'testnow/android_chrome'
require 'testnow/ie'
require 'testnow/edge'

module TestNow

  def init
    ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
    case ENV['BROWSER'].downcase
      when "chrome"
        chrome = Chrome.new
        chrome.launch_driver_chrome
      when "android"
        puts "Coming Soon!!\n"
        puts "Apologies for inconvenience...\n\n"
      when "opera"
        opera = Opera.new
        opera.launch_driver_opera
      when "androidchrome"
        ac = AndroidChrome.new
        ac.launch_driver_android_chrome
      when "ie"
        ie = IE.new
        ie.launch_driver_ie
      when "edge"
        edge = MicrosoftEdge.new
        edge.launch_driver_edge
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
        else
          ff = Firefox.new
          ff.launch_watir_firefox
      end
    end
  end

  module Capybara
    def init
      ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
      case ENV['BROWSER'].downcase.gsub(" ","")
        when "chrome"
          chrome = Chrome.new
          chrome.launch_capybara_chrome
        # when "android"
        #   puts "Coming Soon!!\n"
        #   puts "Apologies for inconvenience...\n\n"
        # when "opera"
        #   opera = Opera.new
        #   opera.launch_watir_opera
        # when "androidchrome"
        #   ac = AndroidChrome.new
        #   ac.launch_watir_android_chrome
        # when "ie","internetexplorer"
        #   ie = IE.new
        #   ie.launch_watir_ie
        # when "edge","microsoftedge"
        #   edge = MicrosoftEdge.new
        #   edge.launch_watir_edge
        # when "firefoxnew","firefoxgecko"
        #   firefoxgecko = FirefoxGecko.new
        #   firefoxgecko.launch_capybara_firefox_gecko
        # else
        #   ff = Firefox.new
        #   ff.launch_watir_firefox
      end
    end
  end

end


