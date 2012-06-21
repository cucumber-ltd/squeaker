Given /^I'm not logged in$/ do
  visit '/reset'
end

When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see "(.*)"$/ do |expected_text|
  page.should have_content(expected_text)
end
