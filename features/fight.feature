Feature: Fights
  Visitor wants to organize a fight

  Scenario: List all fights
    Given Multiple fights exist
    When I visit fights page
    Then I should see all fights

  Scenario: Create a fight
    Given Multiple fighters exist
    Given I visit new fight page
    When I complete the new fight form
    Then I should be on fight page
    Then I should see fight statistics
