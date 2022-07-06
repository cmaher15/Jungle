# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. The application has basic features which include:
- an "About Us" page, providing a sumamry of the app
- allowing a user to register for an account and login. If an e-mail is already in use, the user will not be able to register. If a user enters incorrect login credentials, they will be unable to login and must try again
- once a user is logged in, their name will be displayed in the nav bar with a "logout" link
- allowing a user to browse products and add these items to their cart
- if the user's cart is empty, a notification will be displayed on the cart page which includes a link to the product page
- once a user places an order, they are shown an order summary page including their order number, name and e-mail associated with the order, and the order total
- an admin has the ability to add, edit, and delete products
- an admin has the ability to add new categories
- if an item's quantity is 0, the item will display a "sold out" badge and users will not be able to click the "add to cart" button

## Screenshots
!["Login Page"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.38.40%20PM.png?raw=true)
!["Empty Cart Message"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.39.44%20PM.png?raw=true)
!["Signup Page"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.43.40%20PM.png?raw=true)
!["Navbar for Logged in User"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.44.07%20PM.png?raw=true)
!["Admin Dashboard"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.44.16%20PM.png?raw=true)
!["Sold Out Badge"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.45.03%20PM.png)
(https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.45.14%20PM.png?raw=true)
!["Order Confirmation Page"](https://github.com/cmaher15/Jungle/blob/master/docs/Screen%20Shot%202022-07-06%20at%201.47.16%20PM.png?raw=true)




## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
