Feature: Visitor navigation
  Visitor wants to visit fight club

  Scenario: Check acces to home
    Given I visit home page
    Then I should be on home page

  Scenario: Check navigation to home page
    Given I visit fighters page
    When I click on "Home"
    Then I should be on home page

  Scenario: Check acces to fighters
    Given I visit fighters page
    Then I should be on fighters page

  Scenario: Check navigation to fighters page
    Given I visit home page
    When I click on "Fighters"
    Then I should be on fighters page

  Scenario: Check navigation to fighter page
    Given Multiple fighters exist
    Given I visit fighters page
    When I click on a fighter profile
    Then I should be on fighter page
 
  Scenario: Check navigation to fighter shape page
    Given a fighter exists
    Given I visit fighter page
    Then I should see shape button

  Scenario: Check navigation to fighter shape page
    Given a fighter without available upgrade exists
    Given I visit fighter page
    Then I should not see shape button

  Scenario: Check navigation to new fighter page
    Given I visit fighters page
    When I click on "New Fighter"
    Then I should be on new fighter page