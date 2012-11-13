Feature: Manage Users
	In order to track user accounts
	As a user
	I want to be able to create and edit an account

	Scenario: User successfully creates an account
		Given There is no user with the name "Anis"
		When I am on the user join page
		And I fill out the "username" field with "Anis"
		And I fill out the "email" field with "azarei@gettyimages.com"
		And I fill out the "password" field with "password1234"
		And I fill out the "password_confirmation" field with "password1234"
		And I submit the form
		Then I should see a confirmation that says "User was created"
		And then a user should exist with the username "Anis"

	# Scenario: User can view information on account page
	# 	Given I am a user with the name "Anis", an email "azarei@gettyimages.com" and a password "password1234"
	# 	When I am on the user edit page for "Anis" 
	# 	Then I see username is "Anis"
	# 	And I see email is "azarei@gettyimages.com"
	# 	And I see password is "password1234" 

	# Scenario: User can edit information on account page
	# 	Given I am a user with the name "Anis"
	# 	And I am on the user edit page for "Anis"
	# 	And I fill out "username" field to "Paul"
	# 	And I fill out "email" field to "pbeauchamp@gettyimages.com"
	# 	And I fill out "password" field to "password7890"
	# 	And I fill out "password_confirmation" field with "password7890"
	# 	When I submit the form
	# 	Then I should see a confirmation that says "Changes were saved"
	# 	And then a user should exist with the username "Paul", the email "pbeauchamp@gettyimages.com" and the password "password7890"

	# Scenario: Users can view a user profile page
	# 	Given I am a user with the name "Anis"
	# 	When I am on the user profile page for "Anis" 
	# 	Then I can see "Anis"