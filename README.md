# Active Admin

Active Admin is a Ruby on Rails framework for creating elegant backends for website administration.

[![Version         ](http://img.shields.io/gem/v/activeadmin.svg)                               ](https://rubygems.org/gems/activeadmin)
[![Travis CI       ](http://img.shields.io/travis/activeadmin/activeadmin/master.svg)           ](https://travis-ci.org/activeadmin/activeadmin)
[![Quality         ](http://img.shields.io/codeclimate/github/activeadmin/activeadmin.svg)      ](https://codeclimate.com/github/activeadmin/activeadmin)
[![Coverage        ](http://img.shields.io/coveralls/activeadmin/activeadmin.svg)               ](https://coveralls.io/r/activeadmin/activeadmin)
[![Inch CI         ](http://inch-ci.org/github/activeadmin/activeadmin.svg?branch=master)       ](http://inch-ci.org/github/activeadmin/activeadmin)
[![Gratipay Team   ](https://img.shields.io/gratipay/team/Active-Admin.svg)](https://gratipay.com/Active-Admin/)

## State of the project

### Rails 4.2

#### Special Branch

This branch (`rails-4-2`) is a draft to support Rails 4.2. There is no guarantee that this branch will work with Rails 4.2.
If you want to contribute to the improvement of the Rails 4.2 support, create a pull request against the `rails-4-2` branch, not against `master`!

#### Setup

To use `activeadmin` with `rails 4.2`, you need to setup your Gemfile like this:

```ruby
gem 'activeadmin', github: 'activeadmin', branch: 'rails-4-2'
gem 'inherited_resources', github: 'josevalim/inherited_resources', branch: 'rails-4-2'
```

#### Related Issues

Issues related to Rails 4.2 will be tagged with [`rails-4-2`](https://github.com/activeadmin/activeadmin/labels/rails-4-2).

#### Some background informations

ActiveAdmin is based on [`inherited_resources`](https://github.com/josevalim/inherited_resources), in a hard and fundamentally way. Which means thats it is a big change to remove `inherited_resources`. For ActiveAdmin `1.0` it is not an option, to remove `inherited_resources`, in my eyes. But if someone want's to do it, I will be happy to see a PR for that.

Some things about the [`Deprecation notice`](https://github.com/josevalim/inherited_resources#deprecation-notice) of `inherited_resources`:

1. The readme says `[inherited_resources] is no longer actively maintained`, that's not the full truth! [@rafaelfranca](https://github.com/rafaelfranca) has [announced](https://github.com/activeadmin/activeadmin/pull/3193#issuecomment-62421649), that he will maintain `inherited_resources` until Rails 5.0 for us! Thanks for that again btw! For Rails 5.0 we need to remove `inherited_resources` and find a own solution (there is already a [issue](https://github.com/activeadmin/activeadmin/issues/3604) for that).
2. `inherited_resources` says `I suggest developers to make use of Rails' respond_with feature alongside the responders gem as a replacement to Inherited Resources.`, this sentences is irritating! `responders` is not a full replacement of `inherited_resources`! `responders` is a dependency of `inherited_resources` for example.

### 1.0.0

We're [currently working on 1.0.0](https://github.com/activeadmin/activeadmin/issues?milestone=18),
which as far as dependencies, moves us from meta_search to Ransack and adds Rails 4 support.
You can get Rails 4 and 4.1 support by tracking master:

```ruby
gem 'activeadmin', github: 'activeadmin'
```

### 0.6.x

The plan is to follow [semantic versioning](http://semver.org/) as of 1.0.0. The 0.6.x line will
still be maintained, and we will backport bug fixes into future 0.6.x releases. If you don't want
to have to wait for a release, you can track the branch instead:

```ruby
gem 'activeadmin', github: 'activeadmin', branch: '0-6-stable'
```

## Documentation

For the latest docs, check out the Github <http://activeadmin.info> and the [wiki](https://github.com/activeadmin/activeadmin/wiki).

## Links

* Website: <http://activeadmin.info>
* Live demo: <http://demo.activeadmin.info/admin>
* Documentation
  * Guides: <https://github.com/activeadmin/activeadmin/tree/master/docs>
  * YARD: <http://rubydoc.info/gems/activeadmin>
  * Wiki: <https://github.com/activeadmin/activeadmin/wiki>

## Goals

1. Enable developers to quickly create good-looking administration interfaces.
2. Build a DSL for developers and an interface for businesses.
3. Ensure that developers can easily customize every nook and cranny.

## Getting started

Check out [the docs](http://activeadmin.info/0-installation.html)!

## Need help?

Ask us in IRC ([#activeadmin](https://webchat.freenode.net/?channels=activeadmin)), on the
[mailing list](http://groups.google.com/group/activeadmin), or on
[Stack Overflow](http://stackoverflow.com/questions/tagged/activeadmin).

## Want to contribute?

The [contributing guide](https://github.com/activeadmin/activeadmin/blob/master/CONTRIBUTING.md)
is a good place to start. If you have questions, feel free to ask.

## Want to support us?

You can support us with a weekly tip via [Gratipay](https://gratipay.com).

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.1.3/dist/gratipay.png)](https://gratipay.com/Active-Admin)

## Dependencies

We try not to reinvent the wheel, so Active Admin is built with other open source projects:

Tool                  | Description
--------------------- | -----------
[Arbre]               | Ruby -> HTML, just like that.
[Devise]              | Powerful, extensible user authentication
[Formtastic]          | A Rails form builder plugin with semantically rich and accessible markup
[Iconic Icons]        | An excellent SVG icon set designed by P.J. Onori
[Inherited Resources] | Simplifies controllers with pre-built RESTful controller actions
[Kaminari]            | Elegant pagination for any sort of collection
[Ransack]             | Provides a simple search API to query your data

[Arbre]: https://github.com/activeadmin/arbre
[Devise]: https://github.com/plataformatec/devise
[Formtastic]: https://github.com/justinfrench/formtastic
[Iconic Icons]: http://somerandomdude.com/projects/iconic
[Inherited Resources]: https://github.com/josevalim/inherited_resources
[Kaminari]: https://github.com/kaminari/kaminari
[Ransack]: https://github.com/activerecord-hackery/ransack

## Releasing

* Make sure all pull requests are in and that changelog is current
* Update `version.rb` file and changelog with new version number
* Create a stable branch for that release:

  ```sh
  git checkout master
  git fetch activeadmin
  git rebase activeadmin/master
  # If the release is 2.1 then this should be: 2-1-stable
  git checkout -b N-N-stable
  git push activeadmin N-N-stable:N-N-stable
  ```

* `bundle exec rake release`
