require 'capybara/dsl'

class LoginFailMethod
  include Capybara::DSL

  # constants
  PASSWORD_MESSAGE_DIV = '#form-message-password'
  EMAIL_MESSAGE_DIV = '#form-message-username'

  # 1 - EMPTY PASSWORD FIELD ONLY
  def empty_password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def empty_password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

  # 2 - EMPTY EMAIL FIELD ONLY
  def empty_email_error_div
    page.has_selector?(EMAIL_MESSAGE_DIV)
  end

  def empty_email_error_message
    find(EMAIL_MESSAGE_DIV).text
  end

  # # 3 - EMAIL WITH PASSWORD THAT HAS < 8 CHARACTERS
  # def short_password_error_div
  #   page.has_selector?(PASSWORD_MESSAGE_DIV)
  # end
  #
  # def short_password_error_message
  #   find(PASSWORD_MESSAGE_DIV).text
  # end

  # 4 - EMAIL WITH PASSWORD THAT ONLY USES LETTERS
  def only_letters_password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def only_letters_password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

  # 5 - EMAIL WITH PASSWORD THAT ONLY USES NUMBERS
  def only_numbers_password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def only_numbers_password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

  # 6 - EMAIL WITH INCORRECT PASSWORD FOR ACCOUNT
  def incorrect_account_password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def incorrect_account_password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

  # 7 - INVALID EMAIL ENTERED
  def invalid_email_error_div
    page.has_selector?(EMAIL_MESSAGE_DIV)
  end

  def invalid_email_error_message
    find(EMAIL_MESSAGE_DIV).text
  end

  # 8 - DYNAMIC USERNAME/EMAIL ERROR
  def username_email_error_div
    page.has_selector?(EMAIL_MESSAGE_DIV)
  end

  def username_email_error_message
    find(EMAIL_MESSAGE_DIV).text
  end

  # 9 - DYNAMIC PASSWORRD ERROR
  def password_error_div
    page.has_selector?(PASSWORD_MESSAGE_DIV)
  end

  def password_error_message
    find(PASSWORD_MESSAGE_DIV).text
  end

  # 1 - EMPTY PASSWORD - DONE
  # 3 - < 8 CHARACTERS - DONE
  # 4 - ONLY LETTERS - DONE
  # 5 - ONLY NUMBERS - DONE
  # 6 - INCORRECT FOR ACCOUNT - DONE

end
