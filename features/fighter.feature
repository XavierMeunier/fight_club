Feature: Fighters
  Visitor wants to play with fighters

  Scenario: List all fighters
    Given Multiple fighters exist
    When I visit fighters page
    Then I should see all fighters

  Scenario: See fighter page
    Given a fighter exists
    When I visit fighter page
    Then I should see fighter attributes

  Scenario: Create a fighter
    Given I visit new fighter page
    When I complete the new fighter form
    Then I should be on fighter page
    Then I should see fighter attributes
    Then I should see shape button

  Scenario: Shape a fighter
    Given a fighter exists
    Given I visit fighter shape page
    When I complete the shape upgrade fighter form
    Then I should be on fighter page
    Then I should see upgraded fighter attributes
    Then I should not see shape button
