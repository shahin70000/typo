Feature: Categories
	As the website admin
	In order to organize my articles
	I want to have categories

	Background:
		Given the blog is set up
		And I am logged into the admin panel

	Scenario: Visit categories page
		When I follow "Categories"
		Then I should see "Categories"
		Then I should see "Keywords"		