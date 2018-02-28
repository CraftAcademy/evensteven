Feature: User is sent to a dashboard where they can create or join a group.
  As a user
  In order to understand what functions are available to me as a new user
  I would like to see a welcome page with directions of what to do next


  Background:
    Given the following user exists
      |  email    | password    | password_confirmation |
      | jf@ca.com | password123 | password123           |
    And I am on the Landing page

  Scenario: User signs up and is sent to dashboard page
    Given I click on "Sign up"
    When I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click on "Create account"
    Then I am on the Dashboard page
    And I should see "Create a group" button
    And I should see "Join a group" button

  #Sad paths
  Scenario: User fails to log in and is redirected to the sign in page
    Given I click on "Login"
    When I fill in "Email" with "david@ca.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see the text "Invalid Email or password."
    And I should be on the Sign in page

  Scenario: User fails to sign up and is redirected
    Given I click on "Sign up"
    When I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password"
    And I click on "Create account"
    Then I should see the text "Password confirmation doesn't match"
    And I should be on the Sign up page
