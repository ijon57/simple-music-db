Feature: Album management
  In order to manage my music
  As a registered user
  I want to create, edit and delete albums

  Scenario: List of albums
    Given I am logged in
    And I have 3 albums
    And I am on my page
    When I press "Albums"
    Then I should see 3 albums
  
  Scenario: Creating new album
    Given I am logged in
    And I am on my page
    When I press "Create new album"
    And I fill in the following:
      | album_title  | Cucumber Castle  |
      | album_artist | Bee Gees         |
    And I press button "Create Album"
    Then I should see "Album created successfully!"
    And I should have 1 album
    
  Scenario: Edit existing album
    Given I am logged in
    And I have an album with title: "example", artist: "example"
    And I am on the album's page
    When I press "Edit"
    And I fill in the following:
      | album_title  | Cucumber Castle  |
    And I press button "Update Album"
    Then I should see "Album updated successfully!"
    And album's title should be "Cucumber Castle"