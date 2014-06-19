Given /^I'm not logged in$/ do
  # Of course you're not logged in
end

When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see "(.*)"$/ do |expected_text|
  page.should have_content(expected_text)
end

Given(/^"(.*?)" is not registered$/) do |username|
  visit('/reset')
end

When(/^"(.*?)" registers$/) do |username|
  register_and_log_in(username)
end

Then(/^"(.*?)" should be logged in$/) do |username|
  page.should have_content("Welcome #{username}")
end

Given(/^"(.*?)" has logged in$/) do |username|
  register_and_log_in(username)
end

def register_and_log_in(username)
  click_link 'create an account'
  fill_in 'user_username', with: username
  click_button 'Create My Account'
end

When(/^"(.*?)" squeaks "(.*?)"$/) do |username, squeak|
  fill_in 'Squeak something!', with: squeak
  click_button 'Squeak'
end

Then(/^I should see:$/) do |expected_squeaks|
  actual_squeaks = find_squeaks_on_page
  expected_squeaks.diff!(actual_squeaks)
end

def find_squeaks_on_page
  # lis is an array of Capybara Element (2)
  lis = page.all("ul#messages li")
  lis.map do |li|
    # turn element into [name, squeak]
    li.text.split(':')
  end
end
