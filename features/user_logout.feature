Feature: User Logout
  In order to allow users to logout
  As a user on the site
  I want to be able to logout and not affect my account anymore

  Scenario: User can logout of their account
    Given there is a user with the name "Anis", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis" and password "password1234" is logged in
    When viewing the user edit page for "Anis"
    And I click the logout button
    Then I can see "User successfully logged out."