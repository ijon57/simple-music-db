Feature: User authentication
  In order to use my account
  As a registered user
  I want to login

  Scenario: Logging in
    Given a user exists with email: "example@example.com", password: "example"
    And I am on the homepage
    When I press "Sign in"
    And I fill in the following:
      | user_session_email                 | example@example.com  |
      | user_session_password              | example              |
    And I press button "Login"
    Then I should see "Login successful"
    