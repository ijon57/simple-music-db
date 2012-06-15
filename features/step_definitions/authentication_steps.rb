Given(/^#{capture_model} (?:has|have) registered$/) do |name|
  step "#{name} exists"
end

Given(/^#{capture_model} (?:has|have) registered with "(\S+)", "(.*)"$/) do |name, email, password|
  step "#{name} exists with email: \"#{email}\", password: \"#{password}\", password_confirmation: \"#{password}\""
end

Given /^I am logged in$/ do
  step "I have registered"
  step "I login"
end

Given /^I am not logged in$/ do
  logout_user
end

When /^I login(?: with "([^"]*)", "([^"]*)")?$/ do |email, password|
  visit new_user_session_path
  fill_in 'user_session_email', :with => email || me.email
  fill_in 'user_session_password', :with => password || me.password
  click_button 'Login'
end

When /^I logout$/ do
  logout_user
end

Then /^there should be a session$/ do
  user_session
  @session.should_not be nil
end

Then /^there should not be a session$/ do
  user_session
  @session.should be nil
end

Then /^the user should be "([^"]*)"$/ do |login| #"
  user_session
  @session.user.login.should be == login
end
