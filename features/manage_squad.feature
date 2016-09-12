Feature: Manage squad members
  As a squad manager
  I want to add, remove, and edit squad members
  So that I can keep my squad up to date

  Scenario: Add a squad member
    Given I am a squad manager
     When I visit the squad page
      And I click the "Add squad member" link
      And I enter the details of a new squad member
      And I click the "Add" button
     Then I should be on the new squad member's page
      And I should see the new squad member's details

  Scenario: Edit squad member
    Given I am a squad manager
     When I visit the squad page
      And I click on a squad member
      And I click the "Edit" link
      And I update the squad member's details
      And I click the "Update" button
     Then I should be on the squad member's page
      And I should see the squad member's new name
      And I should not see the squad member's old name

  Scenario: Remove squad member
    Given I am a squad manager
     When I visit the squad page
      And I click on a squad member
      And I click the "Edit" link
      And I click the "Remove" link
     Then I should be on the squad page
      And I should not see the old squad member
