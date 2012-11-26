# Given step definitions


# When step definitions
When /^I create a comment with the body of "(.*?)" to the article with the title "(.*?)"$/ do |body, title|
  article = Article.find(:first, :conditions => [ "title = ?", title])
  fill_in 'comment_body', :with => body
  click_button "create_comment"
end

When /^I delete the comment with the body "(.*?)"$/ do |body|
  comment_id = Comment.find(:first, :conditions => [ "body = ?", body]).id
  click_link "comment_delete_#{comment_id}"
end


# Then step definitions
