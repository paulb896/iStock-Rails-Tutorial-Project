Feature: User Login
  In order to allow users to login
  As a guest to the site
  I want to be able to login to a previously created account

  Scenario: User can login into their own account
  	Given there is a user with the name "Anis", an email "azarei@gettyimages.com", and a password "password1234"
    When viewing the login page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password1234"
    And I submit the form
    Then I can see "Welcome Anis!"

  Scenario: User login failure with invalid user
    When viewing the login page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password1234"
    And I submit the form
    Then I can see "Sorry invalid login credentials, b*tch."

  Scenario: User login failure with invalid password
	Given there is a user with the name "Anis", an email "azarei@gettyimages.com", and a password "password1234"
    When viewing the login page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password7890"
    And I submit the form
    Then I can see "Sorry invalid login credentials, b*tch."
