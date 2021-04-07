# Ruby on Rails Tutorial - Twitter Clone

This is a Twitter Clone developed for the [*Ruby on Rails Tutorial*](https://railstutorial.org/)(6th Edition) by Michael Hartl

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details

## Get Started

To get up and running, clone the repo and install the required gems:

```
$ gem install bundler
$ bundle config set --local without 'production'
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run tests to verify everything is working correctly:

```
$ rails test
```

If the tests pass, run the application on your local server:

```
$ rails server
```
