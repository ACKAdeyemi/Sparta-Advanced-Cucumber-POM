Feature: BBC Login

  # Scenario Outline: Inputting incorrect username/email and incorrect password credentials shows an error
  #   Given I access the BBC login page
  #     And I input incorrect username or email details <email>
  #     And I input incorrect password details <password>
  #   When I try to login
  #   Then I receive an incorrect username or email and incorrect password error <error_one> <error_two>
  #
  #   | email | password | error_one | error_two |
  #   |  |  | Something's missing. Please check and try again. | Something's missing. Please check and try again. |

  Scenario Outline: Inputting incorrect username/email and correct password credentials shows an error
    Given I access the BBC login page
      And I input incorrect username or email details <email>
      And I input correct password details <password>
    When I try to login
    Then I receive the following username or email error: <error>

    Examples:
    | email | password | error |
    |  | rt74b2n1 | Something's missing. Please check and try again. |
    | a@a | rt74b2n1 | Sorry, that email doesn’t look right. Please check it's a proper email. |
    | a.a | rt74b2n1 | Usernames can only include... Letters, numbers and these characters: ?/\|}{+=_-^~`%$# |

  Scenario Outline: Inputting correct username and incorrect password credentials shows an error
    Given I access the BBC login page
      And I input correct username or email details <email>
      And I input incorrect password details <password>
    When I try to login
    Then I receive the following password error: <error>

    Examples:
    | email | password | error |
    | spartatest123@gmail.com |  | Something's missing. Please check and try again. |
    | spartatest123@gmail.com | abcdefg | Sorry, that password is too short. It needs to be eight characters or more. |
    | spartatest123@gmail.com | abcdefgh | Sorry, that password isn't valid. Please include something that isn't a letter. |
    | spartatest123@gmail.com | 12345678 | Sorry, that password isn't valid. Please include a letter. |
