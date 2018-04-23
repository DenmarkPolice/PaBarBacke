# README

Pictures of the site: https://imgur.com/a/qncpQ

The card input is a test version and not really crediting your card. You can test by using the testcard: cardnumber: 4242 4242 4242 4242, expire date: anything, cvc: anything.

To be able to run this, you need to do a ```> bundle install``` to get the necessary file ```config/application.yml``` to run the stripe payments api. In the ```application.yml``` a stripe api public and secret key is required and it should look something like this:
```yml
# Add configuration values here, as shown below.

STRIPE_PUBLISHABLE_KEY: pk_test_randomGeneratedCode
STRIPE_SECRET_KEY: sk_test_randomGeneratedCode
```
To generate your own stripe keys you need to get a stripe account at: https://stripe.com/se 

A demo of the site can be found: https://tranquil-atoll-10545.herokuapp.com/
