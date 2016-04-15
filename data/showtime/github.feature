Feature: As a github user
  I want to verify my user is searchable on github
  and confirm my name is displayed correctly on my profile

  Scenario: Verify full name is displayed on facebook public profile
    Given I am on github page
    When I search for "Kaushal Rupani" keyword
    And I follow the Users Tab
    Then I verify "Kaushal Rupani" is displayed
    When I follow username link to view the profile page
    Then I verify "Kaushal Rupani" is displayed
