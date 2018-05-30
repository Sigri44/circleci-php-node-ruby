# Based on the pre-built CircleCI PHP image.
# See https://circleci.com/docs/2.0/circleci-images/#php
FROM circleci/php:latest
LABEL maintainer="yoan@ytotech.com"

# Add Ruby.
RUN sudo apt-get update \
	&& sudo apt-get install -y \
		ruby ruby-dev \
	&& sudo rm -rf /var/lib/apt/lists/*

# Install Bundler.
RUN sudo gem install bundler
