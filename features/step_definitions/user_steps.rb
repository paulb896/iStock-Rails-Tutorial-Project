Given /^There is no user with the name "(.*?)"$/ do |username|
  User.destroy_all(:username => username)
end

Given /^there is a user with the name "(.*?)", an email "(.*?)", and a password "(.*?)"$/ do |username, email, password|
  user = User.new
  user.username = username
  user.email = email
  user.password = password
  user.save
end

Given /^I fill out the "(.*?)" field with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end


When /^viewing the user edit page for "(.*?)"$/ do |username|
  user_id = User.find(:first, :conditions => [ "username = ?", username]).id
  visit("/users/#{user_id}/edit")
end

When /^viewing the user view page for "(.*?)"$/ do |username|
  user_id = User.find(:first, :conditions => [ "username = ?", username]).id
  visit("/users/#{user_id}")
end

When /^I am on the user join page$/ do
  visit("/users/new")
end

When /^I submit the form$/ do
  click_button "user_create"
end

Then /^a user should exist with attribute "(.*?)" set to "(.*?)"$/ do |attribute, value|
  assert_equal(1, User.count(:id, :conditions => [ "#{attribute} = ?", value]))
end

Then /^I can see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I cannot see "(.*?)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I see "(.*?)" field is set to "(.*?)"$/ do |field_id, value|
  assert_equal(value, find_field(field_id).value)
end

When /^viewing the login page$/ do
  visit("/login")
end

When /^I click the reset password button$/ do
  click_button "reset_password"
end

Then /^I should receive an email with a new password$/ do
  pending # ya, you got me how we check this
end

Then /^I am redirected to user view page for "(.*?)"$/ do |username|
  user_id = User.find(:first, :conditions => [ "username = ?", username]).id
  visit("/users/#{user_id}")
end

When /^I click the login button$/ do
  click_button "login"
end