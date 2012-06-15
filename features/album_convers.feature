Feature: Album management
  In order to display covers for my albums
  As a user with an album
  I want to upload a cover  
  
  Scenario: Edit existing album
    Given I am logged in
    And I have an album with title: "example", artist: "example"
    And I am on the album's edit page
    When I attach the file "data/cover.jpg" to "album_cover"
    And I press button "Update Album"
    Then I should see "Album updated successfully!"
    And album's cover should not be nil