Feature: Signing in

Scenario: Unsuccessful signin
  Given a user visits the signin page
  When user submits invalid signin information
  Then he should see an error message

Scenario: Successful signin
  Given a user visits the signin page
  And the user has an account
  And the user submits valid signin information
  Then he should see his profile page
  And he should see a signout link

Scenario: Successful signin with Twitter
  Given a user visits the signin page
  And the user should see a twitter login button
