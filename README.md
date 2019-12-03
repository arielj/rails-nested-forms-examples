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


## Disclaimer

I'm using *simple_form* gem for the forms just so the input fields are not distracting from the actual important code that is the `fields_for` method. You'll see `simple_fields_for` on the code, but it works just the same as `fields_for`, it's only so I have access to simple_form helpers (error messages, markup, etc). You can simply replace `simple_fields_for` with `fields_for` instead if you don't use that gem and everything else is the same.


### Examples
#### One-to-One

First example is a tipical one-to-one User <-> Address association. Models configuration and views shows how to create an address within a user form and viceversa. It includes, new, create, edit, update and error messages (using simple_form to easily show the inputs, but it's not something relevant for the actual functionality).


#### One-to-Many (model1 has_many model2, model2 belongs_to model1)

Second example is a tipical one-to-many User <-> Pet(s) association. There are two variantes of this:
* fixed number of pets (always show the same amount of nested elements)
* variable number of pets ("add pet" button)

Bonus example: you can combine both example 1 and 2 in a single form and update the user, the address and a variable number of pets with a single form and a single call to `attributes = ....` on the controller!


#### One-to-Many Through (model1 belongs_to model2, model2 has_many model3, model1 has_many model3 through model2)


#### One-to-Many Through (model1 has_many model2, model2 belongs_to model3, model1 has_many model3 through model2)


#### Many-to-Many (using has_and_belongs_to_many)


#### Many-to-Many Through (using has_many :through)
