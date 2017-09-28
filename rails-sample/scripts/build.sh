#!/bin/bash
cd rails-sample
bundle install --path vendor/bundle
bundle exec rspec spec
