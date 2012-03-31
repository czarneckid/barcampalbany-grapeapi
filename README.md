# APIs in Ruby with Grape

A sample API in Ruby using the [https://github.com/intridea/grape](Grape) framework that was TDD'd at 
BarCamp Albany on March 31, 2012.

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
curl -X PUT http://localhost:8080/api/v1/voting/vote_for/david/
curl -X PUT http://localhost:8080/api/v1/voting/unvote_for/david/
curl -X GET http://localhost:8080/api/v1/voting/votes/  
```