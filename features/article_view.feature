Feature: Article Listing
  In order to view site content
  As a user
  I want to be able view previously created articles


  Scenario: User can view article list
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the article listing page
    Then I can see "Big news"

  Scenario: User can view a specific article
    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
    And user with name "Anis_2" and password "password1234" is logged in
    And an article exists with the title "Big news" and body "There was big news"
    When viewing the article with title "Big news"
    Then I can see "There was big news"
