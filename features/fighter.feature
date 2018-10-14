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

  Scenario: Shape a fighter
    Given a fighter exists
    Given I visit fighter shape page
    When I complete the shape upgrade fighter
    Then I should be on fighter page
    Then I should see fighter attributes
    Then I should not see shape button
