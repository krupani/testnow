require 'selenium-webdriver'
require 'testnow/chrome'
require 'testnow/opera'

module TestNow

	def init
		ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?
		case ENV['BROWSER'].downcase
    		when "chrome"
      			TestNow.launch_driver_chrome
    		when "android"
      			launch_driver_android
    		when "opera"
      			TestNow.launch_driver_opera
    		when "androidchrome"
      			launch_driver_android_chrome  
    		when "ie"
      			launch_driver_ie
    		else
      			launch_driver_firefox
  		end
	end

end