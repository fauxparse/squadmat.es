Feature: Claim an existing membership
  As a new user
  I want my new login to be attached to existing memberships with the same email
  So that I can join in with the rest of the squad

  Scenario: Member signs up
    Given there is an existing member of the "Sulaco" squad named "Ripley" with the email address "ripley@sula.co"
     When I register with the email address "ripley@sula.co"
      And I log in as "ripley@sula.co"
      And I visit the squads page
     Then I should not see "Sulaco"

     When I confirm my email address
      And I log in as "ripley@sula.co"
      And I visit the squads page
     Then I should be a member of the "Sulaco" squad
     Then I should see "Sulaco"
