Given(/^#{capture_model} (?:has|have) registered$/) do |name|
  Given "#{name} exists"
end

Given(/^#{capture_model} (?:has|have) registered with "(\S+)", "(.*)"$/) do |name, email, password|
  Given "#{name} exists with email: \"#{email}\", password: \"#{password}\", password_confirmation: \"#{password}\""
end

Given(/^#{capture_model} (?:is|am) activated( with "\S+", ".*")?$/) do |name, credentials|
  Given "#{name} has registered#{credentials}"
  created_model(name).activate!
end

Given(/^#{capture_model} profile is confirmed$/) do |name|
  model!(name).profile.confirm!
end

Given /^I am logged in$/ do
  Given "I am activated"
  Given "my profile is confirmed"
  When "I login"
end

Given /^I am not logged in$/ do
  logout_user
end

When /^I login(?: with "([^"]*)", "([^"]*)")?$/ do |email, password|
  visit '/login'
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
