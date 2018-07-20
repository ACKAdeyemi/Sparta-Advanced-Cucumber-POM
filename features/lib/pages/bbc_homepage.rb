require 'capybara/dsl'

class BBC_Homepage
  include Capybara::DSL

  # constants
  HOMEPAGE_URL = 'http://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-username' # for ID attribute
  REGISTER_LINK = '.link--primary' # for class attribute

  def visit_home_page
    window = page.driver.browser.window_handles

    if window.size < 2
      page.driver.open_new_window
      page.switch_to_window(page.windows[1])
    end

    visit(HOMEPAGE_URL)
    sleep 2
  end

  def confirm_home_tag
    page.find('title').text
  end

  def click_sign_in_link
    find(SIGN_IN_LINK_ID).click
    sleep 1
  end

  def click_register_link
    find(REGISTER_LINK).click
    sleep 1
  end

end
