Feature: Album management
  In order to access my albums faster
  As a user
  I want to search my albums
  
  Scenario: Search albums
    Given I am logged in
    And I have an album with title: "title1", artist: "artist1"
    And I have an album with title: "title2", artist: "artist1"
    And I have an album with title: "title3", artist: "artist2"
    And I am on my page
    When I fill in "query" with "artist1"
    And I press button "Search"
    Then I should see 2 albums
  