# APIs in Ruby with Grape

A sample API in Ruby using the [https://github.com/intridea/grape](Grape) framework that was TDD'd at 
BarCamp Albany on March 31, 2012.

The slides are on SpeakerDeck at [http://speakerdeck.com/u/czarneckid/p/barcamp-albany-apis-in-ruby-with-grape](APIs in Ruby with Grape).

## Installation and Setup

```
bundle install
redis-server &
```

## Starting a server

```
unicorn -c config/unicorn.rb
```

## CURLing endpoints

```
curl -X GET http://localhost:8080/api/v1/status/ping
curl -X PUT http://localhost:8080/api/v1/voting/vote_for/david/
curl -X PUT http://localhost:8080/api/v1/voting/unvote_for/david/
curl -X GET http://localhost:8080/api/v1/voting/votes/  
```