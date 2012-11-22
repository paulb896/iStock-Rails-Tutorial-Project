Feature: Admin Deletion of Articles
  In order to control site content
  As a user with admin privileges
  I want to be able to edit previously created artlicles


  Scenario: Admin user can delete an article
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the article listing page
    And I click the destroy link for article with the title of "Big news"
    And viewing the article listing page
    Then I cannot see "Big news"
