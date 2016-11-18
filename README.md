# Product Search
Search and cache results from the semantics API.

## Ruby version
Stored in the `.ruby-version` file for using `rbenv` or `rvm`.

## Setup
```
bundle
rake db:create
rake db:migrate
rake db:seed
bundle exec rails s
```

## Tests
```
bundle exec rspec
```

## Semantics3
Note that the test api keys are hard coded into the `SemanticsService` class. This is just for ease of use, should be put in `ENV` variables and not checked into git if this was going to production.
