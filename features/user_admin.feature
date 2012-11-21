Feature: Admin Account Moderation
  In order to 
  As a user with admin privileges
  I want to be able to view, edit, and delete user accounts


  Scenario: Admin user can view a list of all users
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the user listing page
    Then I can see "Listing users"

  Scenario: Admin user can remove a user
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password5678"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the user listing page
    And I click the destroy link for user with the name of "Paul"
    And viewing the user listing page
    Then I cannot see "Paul"

  Scenario: Admin user can edit another users information
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And there is a user with the name "Paul", an email "pbeauchamp@gettyimages.com", and a password "password5678"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the user edit page for "Paul"
    Then I can see "Editing user"
