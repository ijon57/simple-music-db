Feature: Album management
  In order to manage my music
  As a registered user
  I want to create, edit and delete albums
  
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
    
