require 'capybara/dsl'

class LoginFailMethod
  include Capybara::DSL

  # constants
  PASSWORD_MESSAGE_DIV = '#form-message-password'
  EMAIL_MESSAGE_DIV = '#form-message-username'

  # 1 - DYNAMIC USERNAME/EMAIL ERROR
  def username_email_error_div
    page.has_selector?(EMAIL_MESSAGE_DIV)
  end

  def username_email_error_message
    find(EMAIL_MESSAGE_DIV).text
  end

  # 2 - DYNAMIC PASSWORRD ERROR
  def password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

end
