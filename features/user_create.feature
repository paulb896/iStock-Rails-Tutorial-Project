Feature: User Creation
  In order to allow new users to be created
  As a guest to the site
  I want to be able to create an account


  Scenario: User successfully creates an account
    Given There is no user with the name "Anis"
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I create a user
    Then I can see "User was created"
    And a user should exist with attribute "username" set to "Anis"

  Scenario: User unsuccessfully creates an account due to missing email
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I create a user
    Then I can see "Please fill in an email"

  Scenario: User unsuccessfully creates an account due to missing username
    When I am on the user join page
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I create a user
    Then I can see "Please fill in a username"

  Scenario: User unsuccessfully creates an account due to missing password
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I create a user
    Then I can see "Please fill in a password"

  Scenario: User unsuccessfully creates an account due to mismatched passwords
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password"
    And I create a user
    Then I can see "Password should match confirmation"
