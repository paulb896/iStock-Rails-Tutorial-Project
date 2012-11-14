Feature: Manage Users
  In order to track user accounts
  As a user
  I want to be able to create and edit an account

  Scenario: User successfully creates an account
    Given There is no user with the name "Anis"
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I submit the form
    Then I can see "User was created"
    And a user should exist with attribute "username" set to "Anis"

  Scenario: User unsuccessfully creates an account due to missing email
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I submit the form
    Then I can see "Please fill in an email"

  Scenario: User unsuccessfully creates an account due to missing username
    When I am on the user join page
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I submit the form
    Then I can see "Please fill in a username"

  Scenario: User unsuccessfully creates an account due to missing password
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I submit the form
    Then I can see "Please fill in a password"

  Scenario: User unsuccessfully creates an account due to mismatched passwords
    When I am on the user join page
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password"
    And I submit the form
    Then I can see "Password should match confirmation"

# <!--- Next Major Scenario --->

  Scenario: User can view information on user edit page
     Given there is a user with the name "Anis", an email "azarei@gettyimages.com", and a password "password1234"
     When viewing the user edit page for "Anis" 
     Then I see "user_username" field is set to "Anis"
     And I see "user_email" field is set to "azarei@gettyimages.com"

  Scenario: User can edit information on account page
    Given there is a user with the name "Anis", an email "azarei@gettyimages.com", and a password "password1234"
    When viewing the user edit page for "Anis" 
    And I fill out the "user_username" field with "Paul"
    And I fill out the "user_email" field with "pbeauchamp@gettyimages.com"
    And I fill out the "user_password" field with "password7890"
    And I fill out the "user_password_confirmation" field with "password7890"
    When I submit the form
    Then I can see "Changes were saved"
    And a user should exist with attribute "username" set to "Paul"
    And a user should exist with attribute "email" set to "pbeauchamp@gettyimages.com"

  Scenario: User unsuccessfully updates an account due to missing email
    Given there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    When viewing the user edit page for "Paul" 
    And I fill out the "user_email" field with ""
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I submit the form
    Then I can see "Please fill in an email"

  Scenario: User unsuccessfully updates an account due to missing username
    Given there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    When viewing the user edit page for "Paul" 
    And I fill out the "user_username" field with ""
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password1234"
    And I submit the form
    Then I can see "Please fill in a username"

  Scenario: User unsuccessfully updates an account due to missing password
    Given there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    When viewing the user edit page for "Paul" 
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I submit the form
    Then I can see "Please fill in a password"

  Scenario: User unsuccessfully updates an account due to mismatched passwords
    Given there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    When viewing the user edit page for "Paul" 
    And I fill out the "user_username" field with "Anis"
    And I fill out the "user_email" field with "azarei@gettyimages.com"
    And I fill out the "user_password" field with "password1234"
    And I fill out the "user_password_confirmation" field with "password"
    And I submit the form
    Then I can see "Password should match confirmation"

#<!--- Next Major Scenario --->

  Scenario: Users can view a user profile page
    Given I am a user with the name "Anis"
    When I am on the user profile page for "Anis" 
    Then I can see "Anis"
