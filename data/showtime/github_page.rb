class GithubPage

  def initialize(page_driver)
    @driver = page_driver
  end

  def search_github(key)
    @driver.find_element(:name => "q").send_keys(key+"\n")
  end

  def click_tab(tab)
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    case tab
      when "Users"
        @driver.find_element(:css => ".menu>a[href*=Users]").click
        wait.until{@driver.find_element(:id => "user_search_results").displayed?}
      else
        puts "Wrong tab buddy!!"
    end
  end

  def visit_profile
    @driver.find_element(:link => "krupani").click
  end

  def verify_text_presence(word)
    expect(@driver.find_element(:tag_name => "body").text).to include(word)
  end

end