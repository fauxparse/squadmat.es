When(/^I click the "([^"]*)" button$/) do |text|
  click_button text
end

When(/^I click the "([^"]*)" link$/) do |text|
  click_link text
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content(content)
end
