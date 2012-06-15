Feature: User registration
  In order to be able to manage my albums
  As a new user
  I have to sign up
  
  Scenario: Submitting correctly filled out registration form
    Given I am on the homepage
    When I press "Sign up"
    And I fill in the following:
      | email                 | example@example.com |
      | password              | example             |
      | password_confirmation | example             |
    And I press "Submit"
    Then I should see "You have registered successfully!"
    
  