Feature: Admin Creation of Articles
  In order to inform site users
  As a user with admin privileges
  I want to be able to create articles


  Scenario: Admin user can create an article
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the create article page
    And I fill out the "article_title" field with "Big News!"
    And I fill out the "article_body" field with "Apparently there was some big news today!"
    And I create an article
    Then I can see "Article was successfully created."

  Scenario: Admin user unsuccessfully creates an article due to a missing title
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the create article page
    And I fill out the "article_body" field with "Apparently there was some big news today!"
    And I create an article
    Then I can see "Please fill in all fields"

  Scenario: Admin user unsuccessfully creates an article due to a missing body
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    When viewing the create article page
    And I fill out the "article_title" field with "Big News!"
    And I create an article
    Then I can see "Please fill in all fields"
