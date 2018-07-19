require 'capybara/dsl'

class RegistrationFailMethod
  include Capybara::DSL

  # constants
  BIRTHDAY_MESSAGE_DIV = '#form-message-dateOfBirth'
  POSTCODE_MESSAGE_DIV = '#form-message-postcode'

  # 1 - INVALID BIRTHDAY
  def invalid_birthday_error_div
    page.has_selector?(BIRTHDAY_MESSAGE_DIV)
  end

  def invalid_birthday_error_message
    find(BIRTHDAY_MESSAGE_DIV).text
  end

  # 2 - INVALID POSTCODE
  def invalid_postcode_error_div
    page.has_selector?(POSTCODE_MESSAGE_DIV)
  end

  def invalid_postcode_error_message
    find(POSTCODE_MESSAGE_DIV).text
  end

end
