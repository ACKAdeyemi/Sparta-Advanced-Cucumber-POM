Given("I access the BBC login page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.tab_control.wait(1)
end

Given("I input incorrect username details") do
  @bbc_site.bbc_login.fill_email('abc@123')
end

Given("I input incorrect password details") do
  @bbc_site.bbc_login.fill_password('abcd')
end

When("I try to login") do
  @bbc_site.bbc_login.submit_log_in
  @bbc_site.tab_control.wait(1)
end

Then("I receive an incorrect username or email and incorrect password error") do
  expect(@bbc_site.login_fail_methods.invalid_email_error_div).to eq true
  expect(@bbc_site.login_fail_methods.invalid_email_error_message).to eq 'Sorry, that email doesn’t look right. Please check it\'s a proper email.'
end

Given("I input correct password details") do
  @bbc_site.bbc_login.fill_password('aj3bh210e7')
end

Given("I input correct username details") do
  @bbc_site.bbc_login.fill_email('spartatest123@gmail.com')
end

Then("I receive an incorrect username or email error") do
  expect(@bbc_site.login_fail_methods.invalid_email_error_div).to eq true
  expect(@bbc_site.login_fail_methods.invalid_email_error_message).to eq 'Sorry, that email doesn’t look right. Please check it\'s a proper email.'
end

Then("I receive an incorrect password error") do
  expect(@bbc_site.login_fail_methods.short_password_error_div).to eq true
  expect(@bbc_site.login_fail_methods.short_password_error_message).to eq 'Sorry, that password is too short. It needs to be eight characters or more.'
end
