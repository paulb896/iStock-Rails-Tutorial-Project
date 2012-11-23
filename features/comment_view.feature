Feature: Comment View
	In order to give a forum for feedback
	As a user
	I want to be able to add comments to an article

	Scenario: User can add comment to an article
	    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
	    And user with name "Anis_2" and password "password1234" is logged in
	    And an article exists with the title "Big news" and body "There was big news"
	    When viewing the article with title "Big news"
	    And I create a comment with the body of "Wow, that was big news" to the article with the title "Big news"
	    Then I can see "Wow, that was big news"

  Scenario: Guests can view all comments related to an article
      Given an article exists with the title "Big news" and body "There was big news"
      And the article with the title "Big news" has a comment "This isn't big news at all"
      When viewing the article with title "Big news"
      Then I can see "This isn't big news at all"
