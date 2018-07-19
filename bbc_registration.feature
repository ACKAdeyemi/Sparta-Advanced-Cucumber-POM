Feature: BBC Registration

  Scenario: Not inputting any birthday credentials shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I don't input any birthday details
    When I try to continue
    Then I receive an invalid birthday error

  Scenario: Only inputting a valid day value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the day field
    When I try to continue
    Then I receive an invalid month and year birthday error

  Scenario: Only inputting a valid month value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the month field
    When I try to continue
    Then I receive an invalid day and year birthday error

  Scenario: Only inputting a valid year value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the year field
    When I try to continue
    Then I receive an invalid day and month birthday error

  Scenario: Inputting incorrect birthday values shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I input letters in the all three fields
    When I try to continue
    Then I receive an invalid birthday error

  Scenario: Only inputting a valid day and month value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the day and month field
    When I try to continue
    Then I receive an invalid year birthday error

  Scenario: Only inputting a valid day and year value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the day and year field
    When I try to continue
    Then I receive an invalid month birthday error

  Scenario: Only inputting a valid month and year value birthday credential shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I only input a valid value in the month and year field
    When I try to continue
    Then I receive an invalid day birthday error

  Scenario: Inputting an invalid postcode credential whilst all other credentials are correct shows an error
    Given I access the BBC Register page
      And I click thirteen or over
      And I input valid birthday values for all three fields and click continue
      And I input valid values for every necessary field except the postcode field
    When I try to register
    Then I receive an invalid postcode error
