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

  Scenario: Check access to fighter page
    Given a fighter exists
    When I visit fighter page
    Then I should be on fighter page

  Scenario: Check navigation to fighter page
    Given Multiple fighters exist
    Given I visit fighters page
    When I click on a fighter profile
    Then I should be on fighter page

  Scenario: Check access to fighter shape page
    Given a fighter exists
    When I visit fighter shape page
    Then I should be on fighter shape page
 
  Scenario: Check navigation to fighter shape page
    Given a fighter exists
    Given I visit fighter page
    When I should see shape button
    When I click on "Shape"
    Then I should be on fighter shape page

  Scenario: Check no navigation to fighter shape page on fighter without available upgrade
    Given a fighter without available upgrade exists
    Given I visit fighter page
    Then I should not see shape button

  Scenario: Check access to new fighter page
    Given I visit new fighter page
    Then I should be on new fighter page

  Scenario: Check navigation to new fighter page
    Given I visit fighters page
    When I click on "New Fighter"
    Then I should be on new fighter page

  Scenario: Check access to fights
    Given I visit fights page
    Then I should be on fights page

  Scenario: Check navigation to fights
    Given I visit home page
    When I click on "Fights"
    Then I should be on fights page
