Given /^#{capture_model} have (\d+) albums?$/ do |user, count|
  count.to_i.times{ FactoryGirl.create(:album, :user => find_model!(user)) }
end

Given /^#{capture_model} have an album(?: with #{capture_fields})$/ do |user, fields|
  FactoryGirl.create(:album, :user => find_model!(user))
end

Then /^I should see (\d+) albums?$/ do |count|
  page.has_css?("ul.albums li", :count => count)
end
