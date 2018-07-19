Given("I access the BBC Register page") do
  @bbc_site = BBC_Site.new
  @bbc_site.get_temp_email.visit_minute_inbox
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_register_link
end

Given("I click thirteen or over") do
  @bbc_site.bbc_registration.click_13_or_over
end

Given(/^I input an invalid date of birth value (.*) (.*) (.*)$/) do |dd,mm,yyyy|
  @bbc_site.bbc_registration.enter_date_of_birth(dd,mm,yyyy)
end

Given(/^I don't input any birthday details (.*)$/) do |dd,mm,yyyy|
  @bbc_site.bbc_registration.choose_birthday_day(dd)
  @bbc_site.bbc_registration.choose_birthday_month(mm)
  @bbc_site.bbc_registration.choose_birthday_year(yyyy)
end

When("I try to continue") do
  @bbc_site.bbc_registration.confirm_birthday
  @bbc_site.tab_control.wait(1)
end

Then(/^I receive the following invalid birthday error: (.*)$/) do |error|
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq "#{error}"
end

Given("I only input a valid value in the day field") do
  @bbc_site.bbc_registration.choose_birthday_day('02')
  @bbc_site.bbc_registration.choose_birthday_month('')
  @bbc_site.bbc_registration.choose_birthday_year('')
end

Given("I only input a valid value in the month field") do
  @bbc_site.bbc_registration.choose_birthday_day('')
  @bbc_site.bbc_registration.choose_birthday_month('03')
  @bbc_site.bbc_registration.choose_birthday_year('')
end

Given("I only input a valid value in the year field") do
  @bbc_site.bbc_registration.choose_birthday_day('')
  @bbc_site.bbc_registration.choose_birthday_month('')
  @bbc_site.bbc_registration.choose_birthday_year('1990')
end

Given("I input letters in the all three fields") do
  @bbc_site.bbc_registration.choose_birthday_day('a')
  @bbc_site.bbc_registration.choose_birthday_month('b')
  @bbc_site.bbc_registration.choose_birthday_year('c')
end

Then("I receive an invalid month and year birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that month and year don\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end


Then("I receive an invalid day and year birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that day and year don\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end

Then("I receive an invalid day and month birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that day and month don\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end

Given("I only input a valid value in the day and month field") do
  @bbc_site.bbc_registration.choose_birthday_day('02')
  @bbc_site.bbc_registration.choose_birthday_month('03')
  @bbc_site.bbc_registration.choose_birthday_year('')
end

Then("I receive an invalid year birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that year doesn\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end

Given("I only input a valid value in the day and year field") do
  @bbc_site.bbc_registration.choose_birthday_day('02')
  @bbc_site.bbc_registration.choose_birthday_month('')
  @bbc_site.bbc_registration.choose_birthday_year('1990')
end

Then("I receive an invalid month birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that month doesn\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end

Given("I only input a valid value in the month and year field") do
  @bbc_site.bbc_registration.choose_birthday_day('')
  @bbc_site.bbc_registration.choose_birthday_month('03')
  @bbc_site.bbc_registration.choose_birthday_year('1990')
end

Then("I receive an invalid day birthday error") do
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq 'Oops, that day doesn\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
end

Given("I input valid birthday values for all three fields and click continue") do
  @bbc_site.bbc_registration.choose_birthday_day('02')
  @bbc_site.bbc_registration.choose_birthday_month('03')
  @bbc_site.bbc_registration.choose_birthday_year('1990')
  @bbc_site.tab_control.wait(1)
  @bbc_site.bbc_registration.confirm_birthday
  @bbc_site.tab_control.wait(1)
end

Given("I input valid values for every necessary field except the postcode field") do
  @bbc_site.tab_control.switch_to_tab_one
  email = @bbc_site.get_temp_email.get_email
  @bbc_site.tab_control.switch_to_tab_two
  @bbc_site.bbc_registration.fill_email(email)
  @bbc_site.bbc_registration.fill_password('a98yhn32')
  @bbc_site.bbc_registration.fill_postcode('TW10')
  @bbc_site.bbc_registration.select_gender
  @bbc_site.bbc_registration.click_no_thanks
end

When("I try to register") do
  @bbc_site.bbc_registration.submit_registration
end

Then("I receive an invalid postcode error") do
  expect(@bbc_site.registration_fail_methods.invalid_postcode_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_postcode_error_message).to eq 'Sorry, that postcode\'s too short. Please check it\'s a proper postcode.'
end
