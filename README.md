[![Stories in Ready](https://badge.waffle.io/festinalent3/best_bnb.png?label=ready&title=Ready)](https://waffle.io/festinalent3/best_bnb)

[![Build Status](https://travis-ci.org/festinalent3/best_bnb.svg?branch=fix-test-coverage)](https://travis-ci.org/festinalent3/best_bnb)

[![Coverage Status](https://coveralls.io/repos/github/festinalent3/best_bnb/badge.svg?branch=master)](https://coveralls.io/github/festinalent3/best_bnb?branch=master)

#Headline specifications   

```
As a non registered user
So that I can register as a member
I want to sign up

As a user
So that my account details are protected
I want to sign out
```

* Any signed-up user can list a new space.
* Users can list multiple spaces.

```
As a user
So that I can rent out my space
I want to list it

As a user
So that I can rent out more than one space
I want to list multiple spaces
```

* Users should be able to name their space, provide a short description of the space, and a price per night.
```
As a user
So that I can organize my spaces
I want to name them

As a user
So that I can provide useful information about my space
I want to provide a short description of the space

As a user
So that I can charge the space
I want to specify a price per night
```

* Users should be able to offer a range of dates where their space is available.
```
As a user
So that I can specify when space is available
I want to offer a range of dates where my space is available
```

* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
```
As a user
So that I can hire a space
I want to request another users space

As a user
So that I can confirm a booking
I want to approve another users request to hire it
```

* Nights for which a space has already been booked should not be available for users to book that space.
```
As a user
So that I can't over-book my space
I want my listing to be automatically removed once it's been hired  
```
* Until a user has confirmed a booking request, that space can still be booked for that night.
```
As a user
So that I can review multiple requests
I want my listing to stay up until I have confirmed one request to hire it
```

#Nice-to-haves

Users should receive an email whenever one of the following happens:
They sign up
They create a space
They update a space
A user requests to book their space
They confirm a request
They request to book a space
Their request to book a space is confirmed
Their request to book a space is denied
Users should receive a text message to a provided number whenever one of the following happens:
A user requests to book their space
Their request to book a space is confirmed
Their request to book a space is denied
A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
Basic payment implementation though Stripe.
