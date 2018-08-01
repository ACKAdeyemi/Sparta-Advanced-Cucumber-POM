require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  # constants
  THIRTEEN_OR_OVER_LINK = '13 or over'
  BIRTHDAY_DAY = 'dateOfBirthDay'
  BIRTHDAY_MONTH = 'dateOfBirthMonth'
  BIRTHDAY_YEAR = 'dateOfBirthYear'
  CONFIRM_BIRTHDAY_LINK = '#submit-button'
  EMAIL = 'email'
  PASSWORD = 'password'
  POSTCODE = 'postcode'
  GENDER_DROPDOWN = 'gender'
  NO_THANKS_LINK = '.button__text-wrapper'
  SUBMIT_REGISTRATION = '#submit-button'

  def click_13_or_over
    click_link(THIRTEEN_OR_OVER_LINK)
    sleep 2
  end

  def enter_date_of_birth(dd,mm,yyyy)
    fill_in BIRTHDAY_DAY, with: "#{dd}"
    fill_in BIRTHDAY_MONTH, with: "#{mm}"
    fill_in BIRTHDAY_YEAR, with: "#{yyyy}"
    sleep 1
  end

  def confirm_birthday
    find(CONFIRM_BIRTHDAY_LINK).click
    sleep 2
  end

  def fill_registration(email,password,postcode,gender)
    fill_in EMAIL, with: "#{email}"
    sleep 1
    fill_in PASSWORD, with: "#{password}"
    sleep 1
    fill_in POSTCODE, with: "#{postcode}"
    sleep 1
    select "#{gender}", from: GENDER_DROPDOWN
    sleep 1

    all(NO_THANKS_LINK).each do |x|
      if x.text == 'No, thanks'
        x.click
      end
    end
    sleep 1
  end

  def submit_registration
    find(SUBMIT_REGISTRATION).click
    sleep 3
  end

end
