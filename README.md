# APIs in Ruby with Grape

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