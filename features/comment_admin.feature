Feature: Comment Admin
	In order moderate comments
	As an admin
	I want to be able to delete comments from an article

	Scenario: Admin can delete an comments
	    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
      And user with name "Anis_2" is an admin
	    And user with name "Anis_2" and password "password1234" is logged in
	    And an article exists with the title "Big news" and body "There was big news"
      And the article with the title "Big news" has a comment "This isn't big news at all"
	    When viewing the article with title "Big news"
	    And I delete the comment with the body "This isn't big news at all"
	    Then I cannot see "This isn't big news at all"

	Scenario: Non Admin unsuccessfully deletes an comments
	    Given there is a user with the name "Anis_2", an email "azarei@gettyimages.com", and a password "password1234"
	    And user with name "Anis_2" and password "password1234" is logged in
	    And an article exists with the title "Big news" and body "There was big news"
      And the article with the title "Big news" has a comment "This isn't big news at all"
	    When viewing the article with title "Big news"
	    And I delete the comment with the body "This isn't big news at all"
      Then I can see "Only admins can delete comments"
	    And I can see "This isn't big news at all"
