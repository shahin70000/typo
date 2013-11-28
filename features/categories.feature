Feature: Categories
	As the website admin
	In order to organize my articles
	I want to have categories

	Background:
		Given the blog is set up
		And I am logged into the admin panel

	Scenario: Visit categories page
		When I follow "Categories"
		Then I should see "Categories" within the header
		And I should see "Keywords"

	Scenario: Create, edit and delete category
		# create it
		When I follow "Categories"
		And I fill in "Name" with "My Category"
		And I fill in "Keyword" with "The Key"
		And I fill in "Description" with "Fun"		
		And I press "Save"
		Then I should see "My Category" within the category container table
		# edit it
		When I follow "My Category" within the category container table
		Then the "Name" field should contain "My Category"
		When I fill in "Name" with "My Category changed"
		And I press "Save"
		Then I should see "My Category changed" within the category container table
		# delete it
		When I follow "Delete" within the second category row
		Then I should see "Are you sure you want to delete this category"
		When I press "delete"
		Then I should not see "My Category changed" within the category container table