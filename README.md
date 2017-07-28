# README

[![Build Status](https://travis-ci.org/epintozzi/usts_app.svg?branch=master)](https://travis-ci.org/epintozzi/usts_app)

The US Title Series web app  provides club information to the public and allows members to register and pay for events online.

Production App: [https://ustitleseries.net](https://ustitleseries.net)

Ruby Version: 2.3.1
<br>
Rails Version: 5.0.2

#### Setup

To run this project:

```
git clone git@github.com:epintozzi/usts_app.git
cd usts_app
bundle install
rake db:create db:migrate
rails s
```

#### Testing

This project uses RSpec for testing and can be run with the command `rspec`
<br>
You may need to `rake db:test:prepare` before running the tests.
