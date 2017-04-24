Feature: As a TestNow user
  I want to submit my professional data
  and verify the acknowledgement

  Scenario: Verify I can submit the testnow form
    Given I am on the test page
    When I submit the form
    Then I verify n accept the validation alert
    When I fill following data:
      | Name           | Role       | Language |
      | Kaushal Rupani | Automation | Ruby     |
    And I submit the form
    Then I verify n accept the confirmation box
    And I verify the acknowledgement
