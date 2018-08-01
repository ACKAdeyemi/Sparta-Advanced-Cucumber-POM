Given("I access the BBC Register page") do
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

When("I try to continue") do
  @bbc_site.bbc_registration.confirm_birthday
  @bbc_site.tab_control.wait(1)
end

Then(/^I receive the following invalid birthday error: (.*)$/) do |error|
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_birthday_error_message).to eq "#{error}"
end

Given(/^I input valid birthday values for all three fields and click continue (.*) (.*) (.*)$/) do |dd,mm,yyyy|
  @bbc_site.bbc_registration.enter_date_of_birth(dd,mm,yyyy)
  @bbc_site.tab_control.wait(1)
  @bbc_site.bbc_registration.confirm_birthday
  @bbc_site.tab_control.wait(1)
end

Given(/^I input valid values for every necessary field except the postcode field (.*) (.*) (.*)$/) do |password,postcode,gender|
  @bbc_site.tab_control.switch_to_tab_one
  email = @bbc_site.get_temp_email.get_email
  @bbc_site.tab_control.switch_to_tab_two
  @bbc_site.bbc_registration.fill_registration(email, password, postcode, gender)
end

When("I try to register") do
  @bbc_site.bbc_registration.submit_registration
end

Then(/^I receive the following invalid postcode error: (.*)$/) do |error|
  expect(@bbc_site.registration_fail_methods.invalid_postcode_error_div).to eq true
  expect(@bbc_site.registration_fail_methods.invalid_postcode_error_message).to eq "#{error}"
end
