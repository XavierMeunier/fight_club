Feature: Visitor navigation
  Visitor wants to visit fight club

########
# HOME #
########

  Scenario: Check acces to home
    Given I visit home page
    Then I should be on home page

  Scenario: Check navigation to home page
    Given I visit fighters page
    When I click on "Home"
    Then I should be on home page

############
# FIGHTERS #
############

  Scenario: Check acces to fighters
    Given I visit fighters page
    Then I should be on fighters page

  Scenario: Check navigation to fighters page
    Given I visit home page
    When I click on "Fighters"
    Then I should be on fighters page
