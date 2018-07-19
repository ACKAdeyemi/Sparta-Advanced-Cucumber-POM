Feature: BBC Login

  Scenario: Inputting incorrect username/email and incorrect password credentials shows an error
    Given I access the BBC login page
      And I input incorrect username details
      And I input incorrect password details
    When I try to login
    Then I receive an incorrect username or email and incorrect password error

  Scenario: Inputting incorrect username/email and correct password credentials shows an error
    Given I access the BBC login page
      And I input incorrect username details
      And I input correct password details
    When I try to login
    Then I receive an incorrect username or email error

  Scenario: Inputting correct username and incorrect password credentials shows an error
    Given I access the BBC login page
      And I input correct username details
      And I input incorrect password details
    When I try to login
    Then I receive an incorrect password error
