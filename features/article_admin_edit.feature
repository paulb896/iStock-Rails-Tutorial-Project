Feature: Admin Modification of Articles
  In order to inform site users
  As a user with admin privileges
  I want to be able to edit previously created artlicles


  Scenario: Admin user can edit an article
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the edit article page with article with title "Big news"
    And I fill out the "article_title" field with "Big News Again"
    And I fill out the "article_body" field with "Apparently there was no big news today!"
    And I edit an article
    Then I can see "Article was successfully updated."
    And an article with the title "Big News Again", has a body "Apparently there was no big news today!"

  Scenario: Admin user unsuccessfully edits an article due to missing title
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the edit article page with article with title "Big news"
    And I fill out the "article_title" field with ""
    And I fill out the "article_body" field with "Apparently there was no big news today!"
    And I edit an article
    Then I can see "Please fill in all fields"

  Scenario: Admin user unsuccessfully edits an article due to missing body
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" is an admin
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the edit article page with article with title "Big news"
    And I fill out the "article_title" field with "Big News Again"
    And I fill out the "article_body" field with ""
    And I edit an article
    Then I can see "Please fill in all fields"
