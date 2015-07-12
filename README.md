# KataShop
Kata with ruby about a shop with offers

## Description of the problem

We sell only three products:

Product code        Name            Price

AM                 Agua mineral      3.11
AC                 Aceite            5.00
CA                 Cafe             11.23

Our CEO is a big fan of buy-one-get-one-free offers and of AM. He wants us to add a rule to do this.

The COO, though, likes low prices and wants people buying AC to get a price discount for bulk purchases. 
If you buy 3 or more AC, the price should drop to 4.50. Our check-out can scan items in any order, and because the CEO and COO change their minds often, it needs to be flexible regarding our pricing rules.

The interface to our checkout looks like this (shown in Ruby):

co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(another item)
Price = co.total

Implement a checkout system that fulfils these requirements in Ruby.

## Test Data

Basket: AM, AC, AM, CA
Total price expected: £22.25

Basket: AM, AM
Total price expected: £3.11

Basket: AC, AC, AM, AC
Total price expected: £16.61
Running the tests

  ruby checkout_test.rb
