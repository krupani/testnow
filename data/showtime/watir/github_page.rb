class GithubPage

  def initialize(page_browser)
    @browser = page_browser
  end

  def search_github(key)
    if ENV['BROWSER'].downcase == "edge"
      @browser.goto(@browser.driver.current_url+"/search?q=#{key}")
    else
      @browser.text_field(:name => "q").set "#{key}\n"
    end
  end

  def click_tab(tab)
    case tab
      when "Users"
        @browser.element(:css => ".menu>a[href*=Users]").click
        @browser.element(:id => "user_search_results").wait_until_present(timeout=30)
      else
        puts "Wrong tab buddy!!"
    end
  end

  def visit_profile
    @browser.link(:text => "krupani").click
  end

  def verify_text_presence(word)
    expect(@browser.element(:text => word).present?).to be true
  end

end