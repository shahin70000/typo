Feature: Merge Article
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
#
#  Scenario: Successfully merge two articles and delete the second as admin
#    And I am logged into the admin panel
#    Given I am on the new article page
#
#    # creating 2 articles
#    When I fill in "article_title" with "Article1"
#    And I fill in "article__body_and_extended_editor" with "Lorem "
#    And I press "Publish"
#    Then I should be on the admin content page
#    And I should see "Article1"
#    When I follow "New Article"
#    And I fill in "article_title" with "Article2"
#    And I fill in "article__body_and_extended_editor" with "Ipsum"
#    And I press "Publish"
#    Then I should be on the admin content page
#    And I should see "Article2"
#
#    # merging second article into first
#    When I follow "Edit"
#    Then I should see "Lorem"
#    And I should see "Merge Articles"
#    When I fill in "Article ID" with "4"
#    And I press "Merge"
#    Then I should be on the admin content page
#    Then I should see "Article1"
#    And I should not see "Article2"
#
#    When I go to the home page
#    Then I should see "Article1"
#    And I should not see "Article2"
#
#    When I follow "Article1"
#    Then I should see "Lorem Ipsum"

  Scenario: Successfully merge two articles while preserving comments

    Given I am on the new article page
    # creating first article
    When I fill in "article_title" with "Article1"
    And I fill in "article__body_and_extended_editor" with "Lorem "
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Article1"
  # commenting on first article
    When I go to the home page
    And I follow "Article1"
    Then I should see "Comment"
    When I fill in "comment_author" with "author1"
    And I fill in "comment_body" with "First Comment"
    And I press "comment"
    Then I should see "First Comment"
    And I should see "author1"
  # creating second article
    Given I am on the new article page
    And I fill in "article_title" with "Article2"
    And I fill in "article__body_and_extended_editor" with "Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I should see "Article2"
  # commenting on second article
    When I go to the home page
    And I follow "Article2"
    Then I should see "Comment"
    When I fill in "comment_author" with "author2"
    And I fill in "comment_body" with "Second Comment"
    And I press "comment"
    Then I should see "Second Comment"
    And I should see "author2"
  # merging second article into first
    Given I am on the admin content page
    When I follow "Edit"
    Then I should see "Lorem"
    And I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
  # First Article should exist, while second is deleted
    Then I should see "Article1"
    And I should not see "Article2"
    When I go to the home page
    Then I should see "Article1"
    And I should not see "Article2"
    When I follow "Article1"
    Then I should see "Lorem Ipsum"
  # comments should be reserved

    And I should see "First Comment"
    And I should see "author1"
    And I should see "Second Comment"
    And I should see "author2"