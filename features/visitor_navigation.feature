Feature: Visitor navigation
  Visitor wants to visit fight club

  Scenario: Check acces to home
    Given I visit home page
    Then I should be on home page

  Scenario: Check acces to fighters
    Given I visit fighters page
    Then I should be on fighters page