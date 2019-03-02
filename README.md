# Millidocs Theme

Simple documentation theme for Jekyll featuring [Milligram CSS framework](http://milligram.io/), [PrismJS syntax highlighter](http://prismjs.com/) and [LunrJS search](https://lunrjs.com/).

One of the core features is a full text client side search and full responsiveness. It has zero dependencies with other gems and should be easily build with Github.

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "millidocs"
```

Adapt your Jekyll site config `_config.yml`:

```yaml
  title: My Docs Page Title
  description: MY description
  url: "https://base/url/site"
  theme: millidocs

  markdown: kramdown
  kramdown:
    syntax_highlighter_opts:
      disable : true

  exclude:
    - Gemfile
    - Gemfile.lock
    - README.md
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install millidocs


## Usage

### Github Pages

You can use this theme by simply adding `remote_theme: alexander-heimbuch/millidocs` to your `_config.yml` (Thanks to @kogli for the hint).

### Available Themes

This theme is made for _pages_ only and doesn't support _posts_ by default. So the only available layouts are `default` and `page`.

### Navigation

The navigation supports especially only one level. If you need deep nested structures you propably should use a larger documentation system like [GitBook](https://www.gitbook.com/).

Not every page by default is part of the navigation. If you want to add a page to the navigation you have to add the `navigation` attribute with a desired `index`:

```
---
layout: page
title: Navigation
navigation: 2
---
```

The navigation `index` is starting with 1 representing the first item. 


## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, and `_sass` tracked with Git will be released.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

