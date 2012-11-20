Feature: User Logout
  In order to allow users to log out of their account
  As a logged in user
  I want to be able to log out of the website

  Scenario: User logout after login
    Given there is a user with the name "paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    And user with name "paul" and password "password7890" is logged in
    When clicking the log out button
    Then I can see "Logged out!"
