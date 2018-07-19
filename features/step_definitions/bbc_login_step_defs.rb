Given("I access the BBC login page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.tab_control.wait(1)
end

Given(/^I input incorrect username or email details (.*)$/) do |email|
  @bbc_site.bbc_login.fill_email(email)
end

Given(/^I input incorrect password details (.*)$/) do |password|
  @bbc_site.bbc_login.fill_password(password)
end

When("I try to login") do
  @bbc_site.bbc_login.submit_log_in
  @bbc_site.tab_control.wait(1)
end

Then(/^I receive an incorrect username or email and incorrect password error (.*)$/) do |error_one, error_two|
  expect(@bbc_site.login_fail_methods.username_email_error_div).to eq true
  expect(@bbc_site.login_fail_methods.username_email_error_message).to eq "#{error_one}"

  expect(@bbc_site.login_fail_methods.password_error_div).to eq true
  expect(@bbc_site.login_fail_methods.password_error_message).to eq "#{error_two}"
end

Given(/^I input correct password details (.*)$/) do |password|
  @bbc_site.bbc_login.fill_password(password)
end

Given(/^I input correct username or email details (.*)$/) do |email|
  @bbc_site.bbc_login.fill_email(email)
end

Then(/^I receive the following username or email error: (.*)$/) do |error|
  expect(@bbc_site.login_fail_methods.username_email_error_div).to eq true
  expect(@bbc_site.login_fail_methods.username_email_error_message).to eq "#{error}"
end

Then(/^I receive the following password error: (.*)$/) do |error|
  expect(@bbc_site.login_fail_methods.password_error_div).to eq true
  expect(@bbc_site.login_fail_methods.password_error_message).to eq "#{error}"
end
