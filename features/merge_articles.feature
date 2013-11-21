Feature: Merge Article
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create two articles and merge them
    Given I am on the new article page

    When I fill in "article_title" with "Article1"
    And I fill in "article__body_and_extended_editor" with "Lorem "
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Article1"
    When I follow "New Article"
    # Given I am on the new article page
    And I fill in "article_title" with "Article2"
    And I fill in "article__body_and_extended_editor" with "Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Article2"
    When I follow "Edit"
    Then I should be on edit page for article 1
    Then I should see "Merge Articles"

    When I fill in "Article ID" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    Then I should see "Article1"
    And I should not see "Article2"

    When I go to the home page
    Then I should see "Article1"
    And I should not see "Article2"

    When I follow "Article1"
    Then I should see "Lorem Ipsum"
