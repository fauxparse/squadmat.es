Given(/^there is an existing member of the "([^"]*)" squad named "([^"]*)" with the email address "([^"]*)"$/) do |squad, name, email|
  @squad = FactoryGirl.create(:squad, name: squad)
  @member = FactoryGirl.create(:member, name: name, email: email, squad: @squad)
end

When(/^I register with the email address "([^"]*)"$/) do |email|
  visit new_user_registration_path
  fill_in 'Email', with: email
  fill_in 'Password', with: 'p4$$w0rd'
  fill_in 'Password confirmation', with: 'p4$$w0rd'
  click_button 'Sign up'
end

When(/^I visit the squads page$/) do
  visit squads_path
end

When(/^I confirm my email address$/) do
  open_email User.last.email
  click_first_link_in_email
end

When(/^I log in as "([^"]*)"$/) do |email|
  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: 'p4$$w0rd'
  click_button 'Log in'
end

Then(/^I should be a member of the "([^"]*)" squad$/) do |squad|
  expect(User.last.squads.collect(&:name)).to include squad
end
