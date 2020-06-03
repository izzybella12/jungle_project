# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

I picked up the project where it was left off and filled in some features such as adding product/category for Admin pages, authentication for Admin, order summary page, user authentication... I implemented the views with bootstrap and dove into MVC (setting up routes, views, controllers...). I also tested the project with RSpec and Capybara (one of my favorite parts)! Overall, had a lot of fun. 

## Screenshots
!["Order Reciept"](https://github.com/izzybella12/jungle_project/blob/master/docs/order_reciept.png?raw=true)


!["Admin Category Page"](https://github.com/izzybella12/jungle_project/blob/master/docs/new_category_admin.png?raw=true)


!["Sign Up Form"](https://github.com/izzybella12/jungle_project/blob/master/docs/sign_up_form.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
