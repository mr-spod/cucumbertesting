Feature: Do all the tests pass?
  This feature file conatins all scenarios for testing this gem

  Scenario: Test Xcode Project
    Given I read in "CucumberTesting" from "test" directory
    When I bump the build number from '3.3.3'
    Then Its build number should be '3.3.4' at plist path "test/CucumberTesting/CucumberTesting/Info.plist"

  Scenario: Read from file test.json
    Given I make a ClassA object
    When I call loadVals
    Then x should be 5

    Given I make a ClassA object
    When I call loadVals
    Then y should be "New Value"
    And x should be 5

    Given I make a ClassA object
    When I call loadVals
    And I call loadVals with "test2.json"
    Then z should be 'w'

    Given I make a ClassA object
    When I call loadVals
    And I call loadVals with "test2.json"
    Then x should be 1000

  Scenario: Read from test2.json
    Given I make a ClassA object
    When I call loadVals with "test2.json"
    Then y should be "Newer Value"
