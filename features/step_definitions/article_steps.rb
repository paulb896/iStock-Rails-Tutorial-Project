# Given step definitions
Given /^an article exists with the title "(.*?)" and body "(.*?)"$/ do |title, body|
  Article.new(:title => title, :body => body).save!
end


# When step definitions
When /^viewing the edit article page with article with title "(.*?)"$/ do |title|
  article_id = Article.find(:first, :conditions => [ "title = ?", title]).id
  visit "articles/#{article_id}/edit"
end

When /^I edit an article$/ do
  click_button "article_create"
end


# Then step definitions
Then /^an article with the title "(.*?)", has a body "(.*?)"$/ do |title, body|
  Article.find(:first, :conditions => [ "title = ?", title]).body.should == body
end
