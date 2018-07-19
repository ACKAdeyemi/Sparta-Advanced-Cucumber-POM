Feature: BBC Registration

  @reg_test1
  Scenario Outline: Inputting incorrent birthday credentials that output different errors
    Given I access the BBC Register page
      And I click thirteen or over
      And I input an invalid date of birth value <dd> <mm> <yyyy>
    When I try to continue
    Then I receive the following invalid birthday error: <error>

    Examples:
    | dd | mm | yyyy | error |
    |  |  |  | Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    | 02 |  |  | Oops, that month and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    |  | 03 |  | Oops, that day and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    |  |  | 1990 | Oops, that day and month don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    | 02 | 03 |  | Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    | 02 |  | 1990 | Oops, that month doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |
    |  | 03 | 1990 | Oops, that day doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |

  # @reg_test1
  # Scenario Outline: Inputting incorrent birthday credentials that output different errors
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I input an invalid day value <dd>
  #     And I input an invalid month value <mm>
  #     And I input an invalid year value <yyyy>
  #   When I try to continue
  #   Then I receive the following birthday error: <error>
  #
  #   Examples:
  #   | dd | mm | yyyy | error |
  #   |  |  |  | Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |

# ============================================================

  # Scenario: Only inputting a valid day value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the day field
  #   When I try to continue
  #   Then I receive an invalid month and year birthday error
  #
  # Scenario: Only inputting a valid month value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the month field
  #   When I try to continue
  #   Then I receive an invalid day and year birthday error
  #
  # Scenario: Only inputting a valid year value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the year field
  #   When I try to continue
  #   Then I receive an invalid day and month birthday error
  #
  # Scenario: Inputting incorrect birthday values shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I input letters in the all three fields
  #   When I try to continue
  #   Then I receive an invalid birthday error
  #
  # Scenario: Only inputting a valid day and month value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the day and month field
  #   When I try to continue
  #   Then I receive an invalid year birthday error
  #
  # Scenario: Only inputting a valid day and year value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the day and year field
  #   When I try to continue
  #   Then I receive an invalid month birthday error
  #
  # Scenario: Only inputting a valid month and year value birthday credential shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I only input a valid value in the month and year field
  #   When I try to continue
  #   Then I receive an invalid day birthday error
  #
  # Scenario: Inputting an invalid postcode credential whilst all other credentials are correct shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I input valid birthday values for all three fields and click continue
  #     And I input valid values for every necessary field except the postcode field
  #   When I try to register
  #   Then I receive an invalid postcode error
