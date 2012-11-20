Given /^There is no user with the name "(.*?)"$/ do |username|
  User.destroy_all(:username => username)
end

Given /^there is a user with the name "(.*?)", an email "(.*?)", and a password "(.*?)"$/ do |username, email, password|
  user = User.new
  user.username = username
  user.email = email
  user.password = password
  user.save!
end

Given /^I fill out the "(.*?)" field with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

Given /^user with "(.*?)" "(.*?)" has a "(.*?)" of "(.*?)"$/ do |attribute_lookup, attribute_lookup_value, attribute_to_set, value_to_set|
  user = User.find(:first, :conditions => ["#{attribute_lookup} = ?", attribute_lookup_value])
  user["#{attribute_to_set}"] = value_to_set
  user.password = user.password
  user.save!
end

Given /^user with name "(.*?)" and password "(.*)" is logged in$/ do |username, password|
  user = User.find(:first, :conditions => [ "username = ?", username])
  visit("/login")
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  click_button "login"
end

Given /^user with name "(.*?)" is an admin$/ do |username|
  user = User.find(:first, :conditions => [ "username = ?", username])
  user.make_admin
end

When /^viewing the user listing page$/ do
  visit("/users")
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

When /^I submit the password change form$/ do
  click_button "password_change"
end

When /^viewing the request password reset page$/ do
  visit password_reset_path
end

When /^viewing the password reset page with token "(.*?)"$/ do |token|
  visit password_reset_edit_path(:auth_token => token)
end

When /^I click the login button$/ do
  click_button "login"
end

When /^I click the logout button$/ do
  click_button "logout"
end


When /^viewing the login page$/ do
  visit("/login")
end

When /^I click the reset password button$/ do
  click_button "password_reset"
end

When /^clicking the log out button$/ do
  click_link "user_logout"
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

Then /^the email is sent to "(.*?)"$/ do |email_address|
  email = ActionMailer::Base.deliveries.first
  email.to.first.should == email_address
end
