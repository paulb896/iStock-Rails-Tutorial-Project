Feature: Manage Users
  In order view user stats
  As a guest of the site
  I want to view a users information


  Scenario: Users can view a user profile page
    Given there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password7890"
    When viewing the user view page for "Paul"
    Then I can see "Paul"
