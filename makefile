install:
	bundle install

dev:
	bundle exec jekyll serve

publish:
	gem push $(shell gem build millidocs.gemspec | grep 'millidocs-' | sed 's/File: / /g')
