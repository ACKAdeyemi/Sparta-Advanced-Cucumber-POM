Feature: BBC Registration

  @reg_test_birthday_input
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
    | a | b | c | Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009. |


  #
  # Scenario: Inputting an invalid postcode credential whilst all other credentials are correct shows an error
  #   Given I access the BBC Register page
  #     And I click thirteen or over
  #     And I input valid birthday values for all three fields and click continue
  #     And I input valid values for every necessary field except the postcode field
  #   When I try to register
  #   Then I receive an invalid postcode error
