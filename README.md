# README

This aims to be collection of different types of associations between models and how to use `accepts_nested_attributes_for` and `fields_for` to handle nested forms.

* Ruby version: 2.6.5

* Rails version: 6.0.1

* Database initialization: `rails db:setup`

* How to run the test suite: `rails test`

Resource:
* https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html#method-i-accepts_nested_attributes_for
* https://apidock.com/rails/v6.0.0/ActionView/Helpers/FormHelper/fields_for

Tools I'm using:
* Spectre.css as CSS framework
* simple_form gem to handle form inputs
* vanilla_nested gem to handle dynamic add/remove nested fields (not yet)

### Examples
#### One-to-One

First example is a tipical one-to-one User <-> Address association. Models configuration and views shows how to create an address within a user form and viceversa. It includes, new, create, edit, update and error messages (using simple_form to easily show the inputs, but it's not something relevant for the actual functionality).


#### One-to-Many (model1 has_many model2, model2 belongs_to model1)


#### One-to-Many Through (model1 belongs_to model2, model2 has_many model3, model1 has_many model3 through model2)


#### One-to-Many Through (model1 has_many model2, model2 belongs_to model3, model1 has_many model3 through model2)


#### Many-to-Many (using has_and_belongs_to_many)


#### Many-to-Many Through (using has_many :through)
