Given /^There is no user with the name "(.*?)"$/ do |username|
  User.destroy_all(:username => username)
end

Given /^I am a user with the name "(.*?)", an email "(.*?)" and a password "(.*?)"$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given /^I fill out the "(.*?)" field with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

Given /^I am a user with the name "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I am on the user edit page for "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I fill out "(.*?)" field to "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^I fill out "(.*?)" field with "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^I am on the user edit page for "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I am on the user join page$/ do
  visit("/users/new")
end

When /^I submit the form$/ do
  click_button "user_create"
end

When /^I am on the user profile page for "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a confirmation that says "(.*?)"$/ do |message|
  pending # express the regexp above with the code you wish you had
end

Then /^a user should exist with attribute "(.*?)" set to "(.*?)"$/ do |attribute, value|
  assert_equal(1, User.count(:id, :conditions => [ "#{attribute} = ?", value]))
end

Then /^I see username is "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I see email is "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I see password is "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^then a user should exist with the username "(.*?)", the email "(.*?)" and the password "(.*?)"$/ do |username, email, password|
  pending # express the regexp above with the code you wish you had
end

Then /^I can see "(.*?)"$/ do |text|
  page.should have_content(text)
end
