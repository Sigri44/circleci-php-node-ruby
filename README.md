# A PHP, Node and Ruby Docker image for CircleCI

A [Docker image](https://hub.docker.com/r/yoant/circleci-php-node-ruby/) including PHP, Node and Ruby for a CircleCI runner.

So you can build your mixed PHP, Node and Ruby projects (for e.g. PHP server + Javascript apps + CSS build with Sass, and so on).

The image is based on the pre-built CircleCI [lastest PHP image](https://circleci.com/docs/2.0/circleci-images/#php), which already
includes Node.

We simply add [Ruby](https://rubygems.org) and [Bundler](http://bundler.io/) on top of it.

## Usage Example

You can then use the image in your CircleCI v2 configuration file `.circleci/config.yml`:

```
# PHP CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-php/ for more details
#
version: 2
jobs:
  build:
    docker:
      - image: yoant/circleci-node-ruby

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
          - v1-dependencies-{{ checksum "composer.json" }}
          # fallback to using the latest cache if no exact match is found
          - v1-dependencies-

      # Install PHP app dependencies.
      - run: composer install

      # Install Javascript app dependencies.
      - run: npm install

      # Install Sass.
      - run: bundler install

      - save_cache:
          paths:
            - node_modules
          key: v1-dependencies-{{ checksum "composer.json" }}

      # Build the Javascript app.
      - run: npm run build

      # Build the CSS using Sass.
      - run: bundle exec sass src/style.scss:assets/css/style.css --style compressed

      # run tests!
      - run: yarn test

      # run tests!
      - run: phpunit

      [...]
```

## Credits & Contributions

Image by Yoan Tournade <yoan@ytotech.com>. Reach out or [open issues](https://github.com/YtoTech/circleci-php-node-ruby/issues) or PR to make it better!

Y
