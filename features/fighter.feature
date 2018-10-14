Feature: Fighters
  Visitor wants to play with fighters

  Scenario: List all fighters
    Given Multiple fighters exist
    Given I visit fighters page
    Then I should see all fighters