Given(/^I am a squad manager$/) do
  manager
end

When(/^I visit the squad page$/) do
  visit squad_path(squad)
end

When(/^I enter the details of a new squad member$/) do
  fill_in "Name", with: new_member_details[:name]
  fill_in "Email", with: new_member_details[:email]
end

When(/^I click on a squad member$/) do
  click_link(member.name)
end

When(/^I update the squad member's details$/) do
  step("I enter the details of a new squad member")
end

Then(/^I should be on the squad page$/) do
  expect(page.current_path).to eq squad_path(squad)
end

Then(/^I should see the new squad member's details$/) do
  new_member = squad.members.find_by!(email: new_member_details[:email])
  expect(page).to have_content(new_member_details[:name])
end

Then(/^I should see the squad member's new name$/) do
  expect(page).to have_content(new_member_details[:name])
end

Then(/^I should not see the squad member's old name$/) do
  expect(page).not_to have_content(member.name)
end

Then(/^I should not see the old squad member$/) do
  expect(page).not_to have_content(member.name)
end

Then(/^I should be on the new squad member's page$/) do
  new_member = squad.members.find_by!(email: new_member_details[:email])
  expect(page.current_path).to eq squad_member_path(squad, new_member)
end

Then(/^I should be on the squad member's page$/) do
  expect(page.current_path).to eq squad_member_path(squad, member)
end
