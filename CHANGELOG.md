<<<<<<< HEAD
## Master (unreleased) - [compare](https://github.com/gregbell/active_admin/compare/v0.6.1...master)
=======
## 1.0.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.6.3...master) (unreleased)

### Major Changes
* Migration from Metasearch to Ransack [#1979][] by [@seanlinsley][]
* Rails 4 support [#2326][] by many people :heart:

### Enhancements
* Make AA ORM-agnostic [#2545][] by [@johnnyshields][]
* Add multi-record support to `attributes_table_for` [#2544][] by [@zorab47][]
* Table CSS classes are now prefixed to prevent clashes [#2532][] by [@TimPetricola][]
* Allow Inherited Resources shorthand for redirection [#2001][] by [@seanlinsley][]
```ruby
    controller do
      # Redirects to index page instead of rendering updated resource
      def update
        update!{ collection_path }
      end
    end
```

<<<<<<< HEAD
* Accept block for download links [#2040][] by [@potatosalad][]
```ruby
index download_links: ->{ can?(:view_all_download_links) || [:pdf] }
```
=======
* Convert namespace to sym to prevent duplicate namespaces such as :foo and 'foo'. [#5931] by [@westonganger]
* Use filter label when condition has a predicate. [#5886] by [@ko-lem]
* Fix error when routing with array containing symbol. [#5870] by [@jwesorick]
* Fix error when there is a model named `Tag` and `meta_tags` have been configured. [#5895] by [@micred], [@FabioRos] and [@deivid-rodriguez]
* Allow specifying custom `input_html` for `DateRangeInput`. [#5867] by [@mirelon]
* Adjust `#main_content` right margin to take into account possible custom values of `$sidebar-width` and `$section-padding`. [#5887] by [@guigs]
>>>>>>> e0ac14d0 (Convert namespace to sym to prevent duplicate namespaces (#5931))

### Security Fixes

* Prevents potential DOS attack via Ruby symbols [#1926][] by [@seanlinsley][]

## 1.4.1 [☰](https://github.com/activeadmin/activeadmin/compare/v1.4.0...v1.4.1)

### Bug Fixes

* Fixes filters for `has_many :through` relationships [#2541][] by [@shekibobo][]
* "New" action item now only shows up on the index page bf659bc by [@seanlinsley][]
* Fixes comment creation bug with aliased resources 9a082486 by [@seanlinsley][]
* Fixes the deletion of `:if` and `:unless` from filters [#2523][] by [@PChambino][]

### Deprecations

* `ActiveAdmin::Event` (`ActiveAdmin::EventDispatcher`) [#3435][] by [@timoschilling][]
  `ActiveAdmin::Event` will be removed in a future version, ActiveAdmin switched
  to use `ActiveSupport::Notifications`.
  NOTE: The blog parameters has changed:
```ruby
ActiveSupport::Notifications.subscribe ActiveAdmin::Application::BeforeLoadEvent do |event, *args|
  # some code
end

ActiveSupport::Notifications.publish ActiveAdmin::Application::BeforeLoadEvent, "some data"
```

## 0.6.3 [☰](https://github.com/activeadmin/activeadmin/compare/v0.6.2...v0.6.3)

* __Reinstitutes the 10k limit for CSV exports__ [#2847][] by [@seanlinsley][]
* Blacklists Devise versions vulnerable to CVE-2013-0233 [#2744][] by [@jjarmoc][]
* Autoloads the Comments model so it respects user's Kaminari config 77c97d27 by [@seanlinsley][]
* Hides the blank slate link if user doesn't have permissions [#2588][] by [@seanlinsley][]
* Fixes incorrect breadcrumb on edit pages [#2601][] by [@shekibobo][]
* Resurrects `ResourceMismatchError` b1c28cdb by [@seanlinsley][]
* Keeps filter conditions from being deleted fa0edec4 by [@seanlinsley][]
* Translations by [@teoulas][], [@tricknotes][], [@givanse][], and [@pcreux][] :heart:

## 0.6.2 [☰](https://github.com/activeadmin/activeadmin/compare/v0.6.1...v0.6.2)

* Patches MetaSearch bug for attributes ending in "ne" d5db9ff4 by [@seanlinsley][]

## 0.6.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.6.0...v0.6.1)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Features

* OmniAuth provider links now automatically appear on the login page [#2088][] by [@henrrrik][]
* Menu items can now properly overflow [#2046][] by [@maax][]; later updated in [#2125][] by [@ball-hayden][]
* Favicon support [#2348][] by [@stereoscott][]
* HABTM filters [#1928][] by [@Daxter][]
```ruby
    # (assuming Foo HABTM Bars)
    ActiveAdmin.register Foo do
      filter :bars
    end
```

* Advanced string filters [#2096][] by [@joseluistorres][]; later updated in [#2228][] by [@Daxter][]
* Select filters now respect custom MetaSerch search methods [#2420][] by [@Daxter][]
* The navbar now links to the current user's profile [#2395][] by [@Daxter][]

### Bug Fixes

* The CSS encapsulation from 0.6.0 has been rolled back [#1952][] by [@tinynumbers][]
* Fixes problem where extra `/` route was being generated [#2062][] by [@jbhannah][]
* `IndexAsBlog` now renders title/body procs in the view context [#2087][] by [@macfanatic][]
* Fixes `route_instance_path` for `belongs_to` resources [#2099][] by [@pcreux][]
* Fixes breadcrumb links for `belongs_to` resources [#2090][] by [@Daxter][]
* Fixes ID regression, again using `to_param` [#2175][] by [@cknoxrun][]
* Fixes `check_box_checked?` bug [#2186][] by [@Daxter][]; later updated in [#2221][] by [@dmfrancisco][]
* Ensures that assets can only be registered once [#2139][] by [@Daxter][]
* Makes breadcrumbs respect the decorator [#2315][] by [@amiel][]
* CSV download links now respect pagination [#2419][] by [@Daxter][]
* Panels no longer escape html-safe entities [#2403][] by [@zorab47][]

### Enhancements

* Adds option to "undecorate" resource when building forms [#2085][] by [@amiel][]
* Adds `:pagination_total` option to index to hide count for large databases [#2333][] by [@joseluistorres][]
* Adds [better_errors](https://github.com/charliesome/better_errors) gem for a better AA development experience [#2095][] by [@Daxter][]
* Scopes now support blocks for the `:default` option [#2084][] by [@macfanatic][]
* `:if` and `:unless` options added to `scope_to` [#2089][] by [@macfanatic][]
* Renames Comment to AdminComment [#2060][] by [@jbhannah][]; later replaced by [#2113][]
* Improves Comments UI and adds config settings [#2113][] by [@Daxter][]
```ruby
    config.show_comments_in_menu      = false          # Defaults to true
    config.comments_registration_name = 'AdminComment' # Defaults to 'Comment'
```

* `has_many` forms
  * Adds 'has_many_delete' CSS class to `li` elements [#2054][] by [@shekibobo][]
  * Adds `:heading` option to customize the heading displayed [#2068][] by [@coreyward][]
  * Adds `:allow_destroy` option to add in a checkbox to the form to delete records [#2071][] by [@shekibobo][]
  * Adds `:new_record` option to hide "new" button [#2134][] by [@developer88][]
* translations
  * German (Switzerland), English (UK) locales added [#1916][] by [@psy-q][]
  * Danish locale updated [#2154][] by [@jokklan][]
  * Bulgarian locale updated [#2150][] by [@mitio][]
  * Ukrainian locale added [#2258][] by [@valdemarua][]
  * Mexican Spanish locale added [#2319][] by [@neoriddle][]
  * Japanese locale updated [#2416][] by [@nappa][]
  * move filter translation into `SearchMethodSelect` [#2231][] by [@Daxter][]
  * fix plural translations for default `batch_action` [#2255][] by [@mindhalt][]
* In development, load each individual AA JS file [#2215][] by [@tank-bohr][]
* Removes Railtie, only using Rails Engine [#2162][] by [@jherdman][]
* Excludes associations from `display_name` helper [#2147][] by [@Daxter][]
* Prevents new AA::Application instances from using the same `namespace` hash [#2313][] by [@Daxter][]
* Moves hard-coded SASS colors into variables [#2454][] by [@ilyakatz][]

### Cleanup

* Cucumber step definitions refactor [#2015][] by [@Daxter][]
* Misc cleanup in [#2075][] and [#2107][] by [@Daxter][]
* Removes messy spacing from `AdminUser` generator file [#2058][] by [@lupinglade][]
* Fixes documentation formatting [#2083][] by [@amiel][]
* Deprecated settings & code removed [#2165][] by [@Daxter][]

<<<<<<< HEAD
## 0.6.0 - [compare](https://github.com/gregbell/active_admin/compare/v0.5.1...v0.6.0)
=======
## 0.6.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.5.1...v0.6.0)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Bug Fixes

* Fix conflict with Redcloth [#1805][] by [@adrienkohlbecker][]
* Add missing batch actions translations. [#1788][] by [@EtienneDepaulis][]
* JS fix for batch actions checkbox toggling [#1947][] by [@ai][]
* Fixed routing bug for root namespace [#2043][] by [@Daxter][] and [@gregbell][]

### Enhancements

* Rubinis compatability change over block variables [#1871][] by [@dbussin][]
* Compatability with Draper 1.0 release [#1896][] by [@hakanensari][]
* Fixed references to "dashboards.rb" in locales, since file doesn't exist [#1873][] by [@ryansch][]
* Removing deprecated bourbon box-shadow mixin [#1913][] by [@stereoscott][]
* More Japanese localizations [#1929][] by [@johnnyshields][]
* Devise lockable module now supported by default [#1933][] by [@Bishop][]
* Index table now uses a unique DOM id (`#index_table_posts` instead of `#posts`) [#1966][] by [@TiagoCardoso1983][]
* Coffeescript 1.5 compatability as constructors no longer return a value [#1940][] by [@ronen][]
* Allow options to be passed to the Abre element for rows in `attributes_table` [#1439][] by [@Daxter][]
* Gender neutral Spanish translations [#1973][] by [@laffinkippah][]
* Adds the ability to use `starts_with` and `ends_with` in string filters [#1962][] by [@rmw][]
* Adds support for translating resources when registered with `:as` [#2044][] by [@Daxter][]
* Scopes are no longer hidden when empty filter results [#1804][] by [@Daxter][]
* Dynamic scope names with procs [#2018][] by [@Daxter][]
* Filters now support the `:if` optional argument [#1801][] by [@Daxter][]
* Member & collection actions support multiple HTTP methods for the same action [#2000][] by [@rdsoze][]

### Features

* Authorization DSL including a default CanCan adapter [#1817][] by [@pcreux][] and [@gregbell][]
* New "actions" DSL for customizing actions on index listing [#1834][] by [@ejholmes][]
* Index title can now be set via a proc [#1861][] by [@jamesalmond][]
* Can now disable `download_links` per resource, index collection or globally throughout AA [#1908][] by [@TBAA][]
* Filters: add ability to search for blank/null fields with boolean search [#1893][] by [@whatcould][]
* New `navigation_menu` DSL for menu system [#1967][] by [@macfanatic][] and [@gregbell][]
* Support segmented control switch between different index styles [#1745][] by [@joshuacollins85][]

### Other

* Updated documentation for formtastic deprecated f.buttons [#1867][] by [@ericcumbee][]
* Copyright updated for 2013 [#1937][] by [@snapapps][]

### Contributors

327 Commits by 42 authors

*  Adrien Kohlbecker
*  Alexandr Prudnikov
*  Andrew Pietsch
*  Andrey A.I. Sitnik
*  Andrey Rozhkovsky
*  Anthony Zacharakis
*  Bartlomiej Niemtur
*  David DIDIER
*  David Reese
*  Daxter
*  Dirkjan Bussink
*  Dominik Masur
*  Eric Cumbee
*  Eric J. Holmes
*  Etienne Depaulis
*  Gosha Arinich
*  Greg Bell
*  Ian Carroll
*  James Almond
*  Johnny Shields
*  Joshua Collins
*  Kieran Klaassen
*  Luís Ramalho
*  Matt Brewer
*  Nathaniel Bibler
*  Olek Janiszewski
*  Philippe Creux
*  Raison Dsouza
*  Rebecca Miller-Webster
*  Roman Sklenar
*  Roman Sklenář
*  Ryan Schlesinger
*  Scott Meves
*  Sean Ian Linsley
*  Sergey Pchelincev
*  Simon Menke
*  Tiago Cardoso
*  Travis Pew
*  WU Jun
*  laffinkippah
*  ronen barzel
*  тιηуηυмвєяѕ

<<<<<<< HEAD
## 0.5.1 - [compare](https://github.com/gregbell/active_admin/compare/v0.5.0...v0.5.1)
=======
## 0.5.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.5.0...v0.5.1)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Enhancements

* Developer can pass options for CSV generation. [#1626][] by [@rheaton][]
```ruby
    ActiveAdmin.register Post do
      csv options: {force_quotes: true} do
        column :title
      end
    end
```

* Breadcrumb links can be customized by [@simonoff][]
```ruby
    ActiveAdmin.register Post do
      breadcrumb do
        [
          link_to("My account", account_path(current_user))
        ]
      end
    end
```

* Support proc for parent options on menus [#1664][] by [@shell][]
```ruby
    ActiveAdmin.register Post do
      menu parent: proc { I18n.t("admin") }
    end
```

* Support automatic use of Decorators. [#1117][] by [@amiel][] and [#1647][] by [@dapi][]
```ruby
    ActiveAdmin.register Post do
      decorate_with PostDecorator
    end
```

* Allow blacklisting of filters with 'remove_filter' [#1609][] by [@tracedwax][]
```ruby
    ActiveAdmin.register Post do
      remove_filter :author
    end
```

* ActiveAdmin i18n translations can be overwritten in your rails
application locales. [#1775][] by [@caifara][]
* Add "Powered by" to translations. [#1783][] by [@sunny][]
* Forms accept two level deeps has_many. [#1699][] by [@kerberoS][] and tests in [#1782][] by [@ptn][]
* Extract download_format_links into helper [#1752][] by [@randym][]
* Add support for semantic errors [#905][] by [@robdiciuccio][]
* Add support for boolean inputs [#1668][] by [@orendon][]
* Support subURI on logout [#1681][] by [@yawn][]

### Bug fix
* Apply before_filter to BaseController [#1683][] by [@yorch][]
* ... and much more.

### Contributions

156 commits (49 Pull Requests) by 51 contributors.

<<<<<<< HEAD
## 0.5.0 - [compare](https://github.com/gregbell/active_admin/compare/v0.4.4...v0.5.0)
=======
## 0.5.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.4.4...v0.5.0)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Enhancements

* Created new view components (Footer, TitleBar, Header, UtilityNav) to more
  easily customize the views in Active Admin and per namespace. ([@gregbell][])
* All CSS is now encapsulated under the `body.active_admin` class. This may
  change the precedence of styles that you created to override or use in
  other areas of your application.
* Dashboards are now implemented as pages. For more details of how to configure
  a page, checkout http://activeadmin.info/docs/9-custom-pages.html
* Root route can be set to any controller#action using `#root_to`.
* Batch Actions allows you to select entries on index page and perform
  an action against them.
* CSV separators are configurable.
* Lot of bug fixes.

### Deprecations

* Removed all references to ActiveAdmin::Renderer. If you were using these
  please update code to use an Arbre component. Removed
  `ActiveAdmin:Views::HeaderRender` and replaced with
  `ActiveAdmin::Views::Header` component.
* ActiveAdmin::Menu and ActiveAdmin::MenuItem API has changed. If you were
  creating custom menu items, the builder syntax has changed to. Menu#add now
  accepts a MenuItem, instead of building the menu item for you.
* `ActiveAdmin::Dashboards.build` is deprecated in favour of generating a page
  and using the new `config.root_to` option.
* Arbre is now a gem on its own.

### Contributions

561 commits (142 Pull Requests) by 88 contributors.

<<<<<<< HEAD
## 0.4.4 - [compare](https://github.com/gregbell/active_admin/compare/v0.4.3...v0.4.4)
=======
## 0.4.4 [☰](https://github.com/activeadmin/activeadmin/compare/v0.4.3...v0.4.4)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Dependencies

* Use `formtastic` ~> 2.1.1 until AA 0.5.0 is released
* Use `inherited_resources` >= 1.3.1 (ensure flash messages work)

<<<<<<< HEAD
## 0.4.3 - [compare](https://github.com/gregbell/active_admin/compare/v0.4.2...v0.4.3)
=======
## 0.4.3 [☰](https://github.com/activeadmin/activeadmin/compare/v0.4.2...v0.4.3)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Bug Fixes

* [#1063][]: Fix comment issues when using postgres ([@jancel][])

<<<<<<< HEAD
## 0.4.2 - [compare](https://github.com/gregbell/active_admin/compare/v0.4.1...v0.4.2)
=======
## 0.4.2 [☰](https://github.com/activeadmin/activeadmin/compare/v0.4.1...v0.4.2)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Enhancements

* [#822][]: Automatically include js and css to precompile list ([@jschwindt][])
* [#1033][]: Site title accepts a proc that is rendered in the context
         of the view ([@pcreux][])
* [#70][]: Form blocks are now rendered within the context of the view ([@gregbell][])
* [#70][]: Filter's collections are now eval'd in the context of the view ([@gregbell][])
* [#1032][]: The html body now includes a class for the namespace name ([@mattvague][])
* [#1013][]: Hide the count from one specific scope using `:show_count => false`
         ([@latortuga][])
* [#1023][]: Add localization support for comments ([@MoritzMoritz][])

### Bug Fixes

* [#34][]: Comments now work with models using string ids ([@jancel][])
* [#1041][]: When `table_for` collection is empty it no longer outputs
         a blank array in Ruby 1.9 ([@jancel][], [#1016][])
* [#983][]: Fixed compatibility with pry-rails ([@pcreux][])
* [#409][]: Install generator handles custom class names for user ([@gregbell][])

### Contributors

42 Commits by 10 authors

* Allen Huang
* Daniel Lepage
* Thibaut Barrère
* Drew Ulmer
* Juan Schwindt
* Moritz Behr
* Jeff Ancel
* Matt Vague
* Greg Bell
* Philippe Creux


<<<<<<< HEAD
## 0.4.1 - [compare](https://github.com/gregbell/active_admin/compare/v0.4.0...v0.4.1)
=======
## 0.4.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.4.0...v0.4.1)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Enhancements

* [#865][]: Pages support the `#page_action` to add custom controller actions
        to a page ([@BoboFraggins][])
* Columns component now supports column spans, max and min widths ([@gregbell][])
* [#497][]: Custom pagination settings per resource ([@pcreux][])
* [#993][]: Login form now focuses on email ([@mattvague][])
* [#865][]: Add `:if` support to sidebar sections ([@BoboFraggins][])
* [#865][]: Added `:scope_count => false` to the index to hide scope counts
        in generated scopes ([@BoboFraggins][])

### Bug Fixes

* [#101][]: Global nav now works with RackBaseURI ([@gregbell][])
* [#960][]: Global nav works when scoped in rails routes ([@gregbell][])
* [#994][]: Fix index page check collection.limit(1).exists? causes exception when
        ordering by virtual colum ([@latortuga][], [@gregbell][])
* [#971][]: Fix SQL when sorting tables with a column named "group" ([@ggilder][])

### Dependencies

* [#978][]: Support for Inherited Resources 1.3.0 ([@fabiormoura][])

### Contributors

75 Commits by 12 authors

* Bruno Bonamin
* David Radcliffe
* Dinesh Majrekar
* Erik Michaels-Ober
* Fábio Maia
* Gabriel Gilder
* Greg Bell
* Kyle Macey
* Matt Vague
* Oldani Pablo
* Peter Fry
* Philippe Creux
* Søren Houen


<<<<<<< HEAD
## 0.4.0 - [compare](https://github.com/gregbell/active_admin/compare/v0.3.4...v0.4.0)
=======
## 0.4.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.3.4...v0.4.0)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Upgrade Notes

If you're running on Rails 3.0.x, make sure to run `rails generate active_admin:assets`
since we've changed both the CSS and JS files.

### Deprecations

* In the initializer `config.allow_comments_in = []` is now
  `config.allow_comments = true`. Use the new namespace specific configurations
  to allow or disallow configuration within a specific namespace.
* Removed `Object#to_html` in favour of `to_s`. Any Arbre components
  implementing a `to_html` method need to be updated to use `to_s` instead.

### New Features

* Namespace specific configurations in the initializer ([@gregbell][])
* [#624][]: Set an image as the site title using `config.site_title_image` in the
  Active Admin initializer. ([@mattvague][])
* [#758][]: Create a standalone page in Active Admin using
  `ActiveAdmin.register_page` ([@pcreux][])
* [#723][]: Register stylesheets with a media type ([@macfanatic][])

### Enhancements

* [#428][]: Paginated Collection now supports `:param_name` and `:download_links`.
  These two additions allow you to use the `paginated_collection` component multiple
  times on show screens. ([@samvincent][])
* [#527][]: Refactored all form helpers to use Formtastic 2([@ebeigarts][])
* [#551][]: Dashboards can now be conditionally displayed using `:if` ([@samvincent][])
* [#555][]: scopes now accept `:if`. They only get displayed if the proc returns true ([@macfanatic][])
* [#601][]: Breadcrumbs are internationalized ([@vairix-ssierra][])
* [#605][]: Validations on ActiveAdmin::Comment should work with
  `accepts_nested_attributes_for` ([@DMajrekar ][])
* [#623][]: Index table can sort on any table using `:sort => 'table.column'` ([@ZequeZ][])
* [#638][]: Add `:label` option to `status_tag` component ([@fbuenemann][])
* [#644][]: Added proper I18n support to pagination ([@fbuenemann][])
* [#689][]: Scopes preserve title when provided as a string ([@macfanatic][])
* [#711][]: Styles update. Now sexier and more refined design. Redesigned Scopes. Split
  css into smaller files. ([@mattvague][])
* [#741][]: Default media type of css is now "all" instead of "screen" ([@sftsang][])
* [#751][]: Pagination numbers work with a custom `[@per_page][]` ([@DMajrekar][])
* `default_actions` in an index table only display implemented actions ([@watson][])

### Bug Fixes

* [#590][]: Comments now work in the default namespace ([@jbarket][])
* [#780][]: Fix stack level too deep exception when logout path is setup to use
  `:logout_path` named route. ([@george][])
* [#637][]: Fix scope all I18n ([@fbuenemann][])
* [#496][]: Remove global `Object#to_html` [@ebeigarts][]
* [#470][], [#154][]: Arbre properly supports blocks that return Numeric values
  ([@bobbytables][], [@utkarshkukreti][], [@gregbell][])
* [#897][]: Fix count display for collections with GROUP BY [@comboy][]

### Dependencies

* [#468][]: Removed vendored jQuery. Now depends on the jquery-rails gem. If you're
  running Rails 3.0.x (no asset pipeline), make sure to run
  `rails generate active_admin:assets` to generate the correct files. ([@gregbell][])
* [#527][]: Active Admin now requires Formtastic 2.0 or greater ([@ebeigarts][])
* [#711][]: Active admin now depends on Bourbon > 1.0.0. If you're using Rails
  3.0.x, make sure to run `rails generate active_admin:assets` to ensure you
  have the correct css files ([@mattvague][])
* [#869][]: Upgraded Kaminari to >= 0.13.0 and added support for
  `Kaminari.config.page_method_name`. Active Admin should now be happy if
  `will_paginate` is installed with it. ([@j][]-manu)
* [#931][]: Support for Rails 3.2 added ([@mperham][])

### Contributors

274 commits by 42 authors

 * Greg Bell
 * Philippe Creux
 * Matt Vague
 * Felix Bünemann
 * Matthew Brewer
 * Edgars Beigarts
 * Mike Perham
 * Sam Vincent
 * Kieran Klaassen
 * Jonathan Barket
 * Ankur Sethi
 * Dinesh Majrekar
 * comboy
 * Juan E. Pemberthy
 * Leandro Moreira
 * Manu
 * Marc Riera
 * Radan Skorić
 * Rhys Powell
 * Sebastian Sierra
 * Sherman Tsang
 * Szymon Przybył
 * Thomas Watson Steen
 * Tim Habermaas
 * Yara Mayer
 * Zequez
 * asancio
 * emmek
 * Alexey Noskov
 * igmizo
 * Alli
 * Bendik Lynghaug
 * Douwe Homans
 * Eric Koslow
 * Eunsub Kim
 * Garami Gábor
 * George Anderson
 * Henrik Hodne
 * Ivan Storck
 * Jeff Dickey
 * John Ferlito
 * Josef Šimánek


<<<<<<< HEAD
## 0.3.4 - [compare](https://github.com/gregbell/active_admin/compare/v0.3.3...v0.3.4)
=======
## 0.3.4 [☰](https://github.com/activeadmin/activeadmin/compare/v0.3.3...v0.3.4)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

2 commits by 2 authors

### Bug Fixes

* Fix reloading issues across operating systems.
* Fix issue where SASS was recompiling on every request. This can seriously
  decrease the load time of applications when running in development mode.
  Thanks [@dhiemstra][] for tracking this one down!

### Contributors

* Danny Hiemstra
* Greg Bell

<<<<<<< HEAD
## 0.3.3 - [compare](https://github.com/gregbell/active_admin/compare/v0.3.2...v0.3.3)
=======
## 0.3.3 [☰](https://github.com/activeadmin/activeadmin/compare/v0.3.2...v0.3.3)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

1 commit by 1 author

### Enhancements

* Only reload Active Admin when files in the load paths have changed. This is a
  major speed increase in development mode. Also helps with memory consumption
  because we aren't reloading Active admin all the time.

### Contributors

* Greg Bell

<<<<<<< HEAD
## 0.3.2 - [compare](https://github.com/gregbell/active_admin/compare/v0.3.1...v0.3.2)
=======
## 0.3.2 [☰](https://github.com/activeadmin/activeadmin/compare/v0.3.1...v0.3.2)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

45 commits by 15 contributors

### Enhancements

* Site title can now be a link. Use config.site_title_link in
  config/initializers/active_admin.rb
* i18n support for Japanese
* i18n support for Bulgarian
* i18n support for Swedish

### Bug Fixes

* DeviseGenerator respects singular table names
* Active Admin no longer assumes sass-rails is installed
* Arbre::Context passes methods to the underlying html which fixes
  issues on different types of servers (and on Heroku)
* [#45][]: Fix for multibyte characters ([@tricknotes][])
* [#505][]: Fix titlebar height when no breadcrumb ([@mattvague][])
* Fixed vertical align in dashboard
* Fixed i18n path's for multi-word model names

### Dependencies

* Formtastic 2.0.0 breaks Active Admin. Locking to < 2.0.0

### Contributors

* Amiel Martin
* Christian Hjalmarsson
* Edgars Beigarts
* Greg Bell
* Jan Dupal
* Joe Van
* Mark Roghelia
* Mathieu Martin
* Matt Vague
* Philippe Creux
* Ryunosuke SATO
* Sam Vincent
* Trace Wax
* Tsvetan Roustchev
* l4u

<<<<<<< HEAD
## 0.3.1 - [compare](https://github.com/gregbell/active_admin/compare/v0.3.0...v0.3.1)

* Only support InheritedResources up to 1.2.2

## 0.3.0 - [compare](https://github.com/gregbell/active_admin/compare/v0.2.2...v0.3.0)
=======
## 0.3.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.3.0...v0.3.1)

* Only support InheritedResources up to 1.2.2

## 0.3.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.2.2...v0.3.0)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

326 commits by 35 contributors

### New Features

* I18n! Now supported in 10 languages!
* Customizeable CSV ([@pcreux][], [@gregbell][])
* Menus now support `if` and `priority` (Moritz Lawitschka)
* Rails 3.1 support
* Asset pipeline support ([@gregbell][])
* `skip_before_filter` now supported in DSL ([@shayfrendt][])
* Added a blank slate design ([@mattvague][])
* Collection and Member actions use the Active Admin layout ([@gregbell][])

### Enhancements

* Better I18n config file loading ([@fabiokr][])
* `TableFor` now supports I18n headers ([@fabiokr][])
* `AttributesTable` now supports I18n attributes ([@fabiokr][])
* Member actions all use CSS class `member_link` ([@doug316][])
* Made `status_tag` an Arbre component ([@pcreux][])
* CSV downloads have sexy names such as "articles-2011-06-21.csv" ([@pcreux][])
* Created `ActiveAdmin::Setting` to easily create settings ([@gregbell][])
* New datepicker styles ([@mattvague][])
* Set `[@page_title][]` in member action to render a custom title ([@gregbell][])
* [#248][]: Settable logout link options in initializer ([@gregbell][])
* Added a DependencyChecker that warns if dependencies aren't met ([@pcreux][])

### Bug Fixes

* [#52][]: Fix update action with STI models ([@gregbell][])
* [#122][]: Fix sortable columns on nested resources ([@knoopx][])
* Fix so that Dashboard Sections can appear in root namespace ([@knoopx][])
* [#131][]: Fixed `status_tag` with nil content ([@pcreux][])
* [#110][]: Fixed dropdown menu floats in Firefox ([@mattvague][])
* Use quoted table names ([@krug][])
* Fixed CSS float of `.paginated_collection_contents` bug in Firefox ([@mattvague][])
* Removed unwanted gradient in IE in attribute table headers ([@emzeq][])
* [#222][]: Added `Arbre::Context#length` for Rack servers ([@gregbell][])
* [#255][]: Fixed problem with dropdown menus in IE8 and IE9 ([@mattvague][])
* [#235][]: Default sort order should use primary_key ([@gregbell][])
* [#197][]: Fixed issues with #form params disappearing ([@rolfb][])
* [#186][]: Fixes for when `default_namespace = false` ([@gregbell][])
* [#135][]: Comments on STI classes redirect correctly ([@gregbell][])
* [#77][]: Fixed performance issue where ActiveRecord::Base.all was being called ([@pcreux][])
* [#332][]: Fixed Devise redirection when in false namespace ([@gregbell][])
* [#171][]: Fixed issue where class names would clash with HTML object names ([@gregbell][])
* [#381][]: Fixed issues with Devise < 1.2 ([@pcreux][])
* [#369][]: Added support for pluralized model names such as News ([@gregbell][])
* [#42][]: Default forms work with polymorphic associations ([@mattvague][])

### Dependencies

* Switched from will_paginate to  Kaminari for pagination ([@mwindwer][])
* Removed dependency on InheritedViews ([@gregbell][])
* Removed Jeweler. Using Bundler and a gemspec ([@gregbell][])

### Contributors

* Armand du Plessis
* Aurelio Agundez
* Bruno Bonamin
* Chris Ostrowski
* Corey Woodcox
* DeLynn Berry
* Doug Puchalski
* Fabio Kreusch
* Greg Bell
* Ismael G Marin C
* Jackson Pires
* Jesper Hvirring Henriksen
* Josef Šimánek
* Jørgen Orehøj Erichsen
* Liborio Cannici
* Matt Vague
* Matthew Windwer
* Moritz Lawitschka
* Nathan Le Ray
* Nicolas Mosconi
* Philippe Creux
* Rolf Bjaanes
* Ryan D Johnson
* Ryan Krug
* Shay Frendt
* Steve Klabnik
* Tiago Rafael Godinho
* Toby Hede
* Vijay Dev
* Víctor Martínez
* doabit
* hoverlover
* nhurst
* whatthewhat
* Łukasz Anwajler


<<<<<<< HEAD
## 0.2.2 (2011-05-26) - [compare](https://github.com/gregbell/active_admin/compare/v0.2.1...v0.2.2)
=======
## 0.2.2 [☰](https://github.com/activeadmin/activeadmin/compare/v0.2.1...v0.2.2)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

68 Commits by 13 Contributors

### Features & Enhancements

* Arbre includes self closing tags ([#100][])
* Controller class & action added to body as CSS classes ([#99][])
* HAML is not required by default ([#92][])
* Devise login now respects Devise.authentication_keys ([#69][])
* Active Admin no longer uses <tt>ActiveRecord::Base#search</tt> ([#28][])
* Resource's can now override the label in the menu ([#48][])
* Subdirectories are now loaded in the Active Admin load path

### Bug Fixes

* Sort order now includes table name ([#38][])
* Fixed table_for 'odd', 'even' row classes ([#96][])
* Fixed Devise installation if AdminUser already exists ([#95][])
* Fixed issues when ActiveAdmin.default_namespaces is false ([#32][])
* Added styles for missing HTML 5 inputs ([#31][])
* Fixed issue if adding empty Active Admin Comment ([#21][])
* Fixed layout issues in FF 4 ([#22][])
* Use Sass::Plugin.options[:css_location] instead of Rails.root ([#55][])

### Test Suite

* Update RSpec to latest & fix specs (Thanks Ben Marini & Jeremt Ruppel!) ([#100][])
* Added tests for STI models ([#52][])

### Contributors

* Ben Marini
* Bookis Smuin
* Caley Woods
* Doug Puchalski
* Federico Romero
* Greg Bell
* Ian MacLeod
* Jeremy Ruppel
* Jordan Sitkin
* Juha Suuraho
* Mathieu Martin
* Paul Annesley
* Philippe Creux

<<<<<<< HEAD
## 0.2.1 (2011-05-12) - [compare](https://github.com/gregbell/active_admin/compare/v0.2.0...v0.2.1)
=======
## 0.2.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.2.0...v0.2.1)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Bug Fixes
* Fixed issue with dashboard rendering a sidebar

<<<<<<< HEAD
## 0.2.0 (2011-05-12) - [compare](https://github.com/gregbell/active_admin/compare/v0.1.1...v0.2.0)
=======
## 0.2.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.1.1...v0.2.0)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

0.2.0 is essentially an entire re-write of Active Admin. Here are some
of the highlights. 250 commits. Enough said.

### Features & Enhancements

* Full visual redesign
* Integrated Devise for authentication
* Brand new view and component layer called Arbre (Project coming soon)
* Added ActiveAdmin::Comments

### Bug Fixes

* Too many to list! Been in production for close to a year

<<<<<<< HEAD
## 0.1.1 (2010-09-15) - [compare](https://github.com/gregbell/active_admin/compare/v0.1.0...v0.1.1)
=======
## 0.1.1 [☰](https://github.com/activeadmin/activeadmin/compare/v0.1.0...v0.1.1)
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)

### Bug Fixes

* Fixed issues running on Ruby 1.9.2

## 0.1.0

* Initial release

<!--- The following link definition list is generated by PimpMyChangelog --->
<<<<<<< HEAD
[#21]: https://github.com/gregbell/active_admin/issues/21
[#22]: https://github.com/gregbell/active_admin/issues/22
[#28]: https://github.com/gregbell/active_admin/issues/28
[#31]: https://github.com/gregbell/active_admin/issues/31
[#32]: https://github.com/gregbell/active_admin/issues/32
[#34]: https://github.com/gregbell/active_admin/issues/34
[#38]: https://github.com/gregbell/active_admin/issues/38
[#42]: https://github.com/gregbell/active_admin/issues/42
[#45]: https://github.com/gregbell/active_admin/issues/45
[#48]: https://github.com/gregbell/active_admin/issues/48
[#52]: https://github.com/gregbell/active_admin/issues/52
[#55]: https://github.com/gregbell/active_admin/issues/55
[#69]: https://github.com/gregbell/active_admin/issues/69
[#70]: https://github.com/gregbell/active_admin/issues/70
[#77]: https://github.com/gregbell/active_admin/issues/77
[#92]: https://github.com/gregbell/active_admin/issues/92
[#95]: https://github.com/gregbell/active_admin/issues/95
[#96]: https://github.com/gregbell/active_admin/issues/96
[#99]: https://github.com/gregbell/active_admin/issues/99
[#100]: https://github.com/gregbell/active_admin/issues/100
[#101]: https://github.com/gregbell/active_admin/issues/101
[#110]: https://github.com/gregbell/active_admin/issues/110
[#122]: https://github.com/gregbell/active_admin/issues/122
[#131]: https://github.com/gregbell/active_admin/issues/131
[#135]: https://github.com/gregbell/active_admin/issues/135
[#154]: https://github.com/gregbell/active_admin/issues/154
[#171]: https://github.com/gregbell/active_admin/issues/171
[#186]: https://github.com/gregbell/active_admin/issues/186
[#197]: https://github.com/gregbell/active_admin/issues/197
[#222]: https://github.com/gregbell/active_admin/issues/222
[#235]: https://github.com/gregbell/active_admin/issues/235
[#248]: https://github.com/gregbell/active_admin/issues/248
[#255]: https://github.com/gregbell/active_admin/issues/255
[#332]: https://github.com/gregbell/active_admin/issues/332
[#369]: https://github.com/gregbell/active_admin/issues/369
[#381]: https://github.com/gregbell/active_admin/issues/381
[#409]: https://github.com/gregbell/active_admin/issues/409
[#428]: https://github.com/gregbell/active_admin/issues/428
[#468]: https://github.com/gregbell/active_admin/issues/468
[#470]: https://github.com/gregbell/active_admin/issues/470
[#496]: https://github.com/gregbell/active_admin/issues/496
[#497]: https://github.com/gregbell/active_admin/issues/497
[#505]: https://github.com/gregbell/active_admin/issues/505
[#527]: https://github.com/gregbell/active_admin/issues/527
[#551]: https://github.com/gregbell/active_admin/issues/551
[#555]: https://github.com/gregbell/active_admin/issues/555
[#590]: https://github.com/gregbell/active_admin/issues/590
[#601]: https://github.com/gregbell/active_admin/issues/601
[#605]: https://github.com/gregbell/active_admin/issues/605
[#623]: https://github.com/gregbell/active_admin/issues/623
[#624]: https://github.com/gregbell/active_admin/issues/624
[#637]: https://github.com/gregbell/active_admin/issues/637
[#638]: https://github.com/gregbell/active_admin/issues/638
[#644]: https://github.com/gregbell/active_admin/issues/644
[#689]: https://github.com/gregbell/active_admin/issues/689
[#711]: https://github.com/gregbell/active_admin/issues/711
[#723]: https://github.com/gregbell/active_admin/issues/723
[#741]: https://github.com/gregbell/active_admin/issues/741
[#751]: https://github.com/gregbell/active_admin/issues/751
[#758]: https://github.com/gregbell/active_admin/issues/758
[#780]: https://github.com/gregbell/active_admin/issues/780
[#822]: https://github.com/gregbell/active_admin/issues/822
[#865]: https://github.com/gregbell/active_admin/issues/865
[#869]: https://github.com/gregbell/active_admin/issues/869
[#897]: https://github.com/gregbell/active_admin/issues/897
[#905]: https://github.com/gregbell/active_admin/issues/905
[#931]: https://github.com/gregbell/active_admin/issues/931
[#960]: https://github.com/gregbell/active_admin/issues/960
[#971]: https://github.com/gregbell/active_admin/issues/971
[#978]: https://github.com/gregbell/active_admin/issues/978
[#983]: https://github.com/gregbell/active_admin/issues/983
[#993]: https://github.com/gregbell/active_admin/issues/993
[#994]: https://github.com/gregbell/active_admin/issues/994
[#1013]: https://github.com/gregbell/active_admin/issues/1013
[#1016]: https://github.com/gregbell/active_admin/issues/1016
[#1023]: https://github.com/gregbell/active_admin/issues/1023
[#1032]: https://github.com/gregbell/active_admin/issues/1032
[#1033]: https://github.com/gregbell/active_admin/issues/1033
[#1041]: https://github.com/gregbell/active_admin/issues/1041
[#1063]: https://github.com/gregbell/active_admin/issues/1063
[#1117]: https://github.com/gregbell/active_admin/issues/1117
[#1439]: https://github.com/gregbell/active_admin/issues/1439
[#1609]: https://github.com/gregbell/active_admin/issues/1609
[#1626]: https://github.com/gregbell/active_admin/issues/1626
[#1647]: https://github.com/gregbell/active_admin/issues/1647
[#1664]: https://github.com/gregbell/active_admin/issues/1664
[#1668]: https://github.com/gregbell/active_admin/issues/1668
[#1681]: https://github.com/gregbell/active_admin/issues/1681
[#1683]: https://github.com/gregbell/active_admin/issues/1683
[#1699]: https://github.com/gregbell/active_admin/issues/1699
[#1745]: https://github.com/gregbell/active_admin/issues/1745
[#1752]: https://github.com/gregbell/active_admin/issues/1752
[#1775]: https://github.com/gregbell/active_admin/issues/1775
[#1782]: https://github.com/gregbell/active_admin/issues/1782
[#1783]: https://github.com/gregbell/active_admin/issues/1783
[#1788]: https://github.com/gregbell/active_admin/issues/1788
[#1801]: https://github.com/gregbell/active_admin/issues/1801
[#1804]: https://github.com/gregbell/active_admin/issues/1804
[#1805]: https://github.com/gregbell/active_admin/issues/1805
[#1817]: https://github.com/gregbell/active_admin/issues/1817
[#1834]: https://github.com/gregbell/active_admin/issues/1834
[#1861]: https://github.com/gregbell/active_admin/issues/1861
[#1867]: https://github.com/gregbell/active_admin/issues/1867
[#1871]: https://github.com/gregbell/active_admin/issues/1871
[#1873]: https://github.com/gregbell/active_admin/issues/1873
[#1893]: https://github.com/gregbell/active_admin/issues/1893
[#1896]: https://github.com/gregbell/active_admin/issues/1896
[#1908]: https://github.com/gregbell/active_admin/issues/1908
[#1913]: https://github.com/gregbell/active_admin/issues/1913
[#1916]: https://github.com/gregbell/active_admin/issues/1916
[#1928]: https://github.com/gregbell/active_admin/issues/1928
[#1929]: https://github.com/gregbell/active_admin/issues/1929
[#1933]: https://github.com/gregbell/active_admin/issues/1933
[#1937]: https://github.com/gregbell/active_admin/issues/1937
[#1940]: https://github.com/gregbell/active_admin/issues/1940
[#1947]: https://github.com/gregbell/active_admin/issues/1947
[#1952]: https://github.com/gregbell/active_admin/issues/1952
[#1960]: https://github.com/gregbell/active_admin/issues/1960
[#1961]: https://github.com/gregbell/active_admin/issues/1961
[#1962]: https://github.com/gregbell/active_admin/issues/1962
[#1966]: https://github.com/gregbell/active_admin/issues/1966
[#1967]: https://github.com/gregbell/active_admin/issues/1967
[#1973]: https://github.com/gregbell/active_admin/issues/1973
[#2000]: https://github.com/gregbell/active_admin/issues/2000
[#2015]: https://github.com/gregbell/active_admin/issues/2015
[#2018]: https://github.com/gregbell/active_admin/issues/2018
[#2043]: https://github.com/gregbell/active_admin/issues/2043
[#2044]: https://github.com/gregbell/active_admin/issues/2044
[#2046]: https://github.com/gregbell/active_admin/issues/2046
[#2054]: https://github.com/gregbell/active_admin/issues/2054
[#2058]: https://github.com/gregbell/active_admin/issues/2058
[#2060]: https://github.com/gregbell/active_admin/issues/2060
[#2062]: https://github.com/gregbell/active_admin/issues/2062
[#2068]: https://github.com/gregbell/active_admin/issues/2068
[#2071]: https://github.com/gregbell/active_admin/issues/2071
[#2072]: https://github.com/gregbell/active_admin/issues/2072
[#2075]: https://github.com/gregbell/active_admin/issues/2075
[#2083]: https://github.com/gregbell/active_admin/issues/2083
[#2084]: https://github.com/gregbell/active_admin/issues/2084
[#2085]: https://github.com/gregbell/active_admin/issues/2085
[#2087]: https://github.com/gregbell/active_admin/issues/2087
[#2088]: https://github.com/gregbell/active_admin/issues/2088
[#2089]: https://github.com/gregbell/active_admin/issues/2089
[#2090]: https://github.com/gregbell/active_admin/issues/2090
[#2095]: https://github.com/gregbell/active_admin/issues/2095
[#2096]: https://github.com/gregbell/active_admin/issues/2096
[#2099]: https://github.com/gregbell/active_admin/issues/2099
[#2107]: https://github.com/gregbell/active_admin/issues/2107
[#2113]: https://github.com/gregbell/active_admin/issues/2113
[#2125]: https://github.com/gregbell/active_admin/issues/2125
[#2134]: https://github.com/gregbell/active_admin/issues/2134
[#2139]: https://github.com/gregbell/active_admin/issues/2139
[#2147]: https://github.com/gregbell/active_admin/issues/2147
[#2150]: https://github.com/gregbell/active_admin/issues/2150
[#2154]: https://github.com/gregbell/active_admin/issues/2154
[#2162]: https://github.com/gregbell/active_admin/issues/2162
[#2165]: https://github.com/gregbell/active_admin/issues/2165
[#2175]: https://github.com/gregbell/active_admin/issues/2175
[#2186]: https://github.com/gregbell/active_admin/issues/2186
[#2215]: https://github.com/gregbell/active_admin/issues/2215
[#2221]: https://github.com/gregbell/active_admin/issues/2221
[#2228]: https://github.com/gregbell/active_admin/issues/2228
[#2231]: https://github.com/gregbell/active_admin/issues/2231
[#2255]: https://github.com/gregbell/active_admin/issues/2255
[#2258]: https://github.com/gregbell/active_admin/issues/2258
[#2313]: https://github.com/gregbell/active_admin/issues/2313
[#2315]: https://github.com/gregbell/active_admin/issues/2315
[#2319]: https://github.com/gregbell/active_admin/issues/2319
[#2333]: https://github.com/gregbell/active_admin/issues/2333
[#2348]: https://github.com/gregbell/active_admin/issues/2348
[#2395]: https://github.com/gregbell/active_admin/issues/2395
[#2403]: https://github.com/gregbell/active_admin/issues/2403
[#2416]: https://github.com/gregbell/active_admin/issues/2416
[#2419]: https://github.com/gregbell/active_admin/issues/2419
[#2420]: https://github.com/gregbell/active_admin/issues/2420
[#2454]: https://github.com/gregbell/active_admin/issues/2454
=======
[#21]: https://github.com/activeadmin/activeadmin/issues/21
[#22]: https://github.com/activeadmin/activeadmin/issues/22
[#28]: https://github.com/activeadmin/activeadmin/issues/28
[#31]: https://github.com/activeadmin/activeadmin/issues/31
[#32]: https://github.com/activeadmin/activeadmin/issues/32
[#34]: https://github.com/activeadmin/activeadmin/issues/34
[#38]: https://github.com/activeadmin/activeadmin/issues/38
[#42]: https://github.com/activeadmin/activeadmin/issues/42
[#45]: https://github.com/activeadmin/activeadmin/issues/45
[#48]: https://github.com/activeadmin/activeadmin/issues/48
[#52]: https://github.com/activeadmin/activeadmin/issues/52
[#55]: https://github.com/activeadmin/activeadmin/issues/55
[#69]: https://github.com/activeadmin/activeadmin/issues/69
[#70]: https://github.com/activeadmin/activeadmin/issues/70
[#77]: https://github.com/activeadmin/activeadmin/issues/77
[#92]: https://github.com/activeadmin/activeadmin/issues/92
[#95]: https://github.com/activeadmin/activeadmin/issues/95
[#96]: https://github.com/activeadmin/activeadmin/issues/96
[#99]: https://github.com/activeadmin/activeadmin/issues/99
[#100]: https://github.com/activeadmin/activeadmin/issues/100
[#101]: https://github.com/activeadmin/activeadmin/issues/101
[#110]: https://github.com/activeadmin/activeadmin/issues/110
[#122]: https://github.com/activeadmin/activeadmin/issues/122
[#131]: https://github.com/activeadmin/activeadmin/issues/131
[#135]: https://github.com/activeadmin/activeadmin/issues/135
[#154]: https://github.com/activeadmin/activeadmin/issues/154
[#171]: https://github.com/activeadmin/activeadmin/issues/171
[#186]: https://github.com/activeadmin/activeadmin/issues/186
[#197]: https://github.com/activeadmin/activeadmin/issues/197
[#222]: https://github.com/activeadmin/activeadmin/issues/222
[#235]: https://github.com/activeadmin/activeadmin/issues/235
[#248]: https://github.com/activeadmin/activeadmin/issues/248
[#255]: https://github.com/activeadmin/activeadmin/issues/255
[#332]: https://github.com/activeadmin/activeadmin/issues/332
[#369]: https://github.com/activeadmin/activeadmin/issues/369
[#381]: https://github.com/activeadmin/activeadmin/issues/381
[#409]: https://github.com/activeadmin/activeadmin/issues/409
[#428]: https://github.com/activeadmin/activeadmin/issues/428
[#468]: https://github.com/activeadmin/activeadmin/issues/468
[#470]: https://github.com/activeadmin/activeadmin/issues/470
[#496]: https://github.com/activeadmin/activeadmin/issues/496
[#497]: https://github.com/activeadmin/activeadmin/issues/497
[#505]: https://github.com/activeadmin/activeadmin/issues/505
[#527]: https://github.com/activeadmin/activeadmin/issues/527
[#551]: https://github.com/activeadmin/activeadmin/issues/551
[#555]: https://github.com/activeadmin/activeadmin/issues/555
[#590]: https://github.com/activeadmin/activeadmin/issues/590
[#601]: https://github.com/activeadmin/activeadmin/issues/601
[#605]: https://github.com/activeadmin/activeadmin/issues/605
[#623]: https://github.com/activeadmin/activeadmin/issues/623
[#624]: https://github.com/activeadmin/activeadmin/issues/624
[#637]: https://github.com/activeadmin/activeadmin/issues/637
[#638]: https://github.com/activeadmin/activeadmin/issues/638
[#644]: https://github.com/activeadmin/activeadmin/issues/644
[#689]: https://github.com/activeadmin/activeadmin/issues/689
[#711]: https://github.com/activeadmin/activeadmin/issues/711
[#723]: https://github.com/activeadmin/activeadmin/issues/723
[#741]: https://github.com/activeadmin/activeadmin/issues/741
[#751]: https://github.com/activeadmin/activeadmin/issues/751
[#758]: https://github.com/activeadmin/activeadmin/issues/758
[#780]: https://github.com/activeadmin/activeadmin/issues/780
[#822]: https://github.com/activeadmin/activeadmin/issues/822
[#865]: https://github.com/activeadmin/activeadmin/issues/865
[#869]: https://github.com/activeadmin/activeadmin/issues/869
[#897]: https://github.com/activeadmin/activeadmin/issues/897
[#905]: https://github.com/activeadmin/activeadmin/issues/905
[#931]: https://github.com/activeadmin/activeadmin/issues/931
[#960]: https://github.com/activeadmin/activeadmin/issues/960
[#971]: https://github.com/activeadmin/activeadmin/issues/971
[#978]: https://github.com/activeadmin/activeadmin/issues/978
[#983]: https://github.com/activeadmin/activeadmin/issues/983
[#993]: https://github.com/activeadmin/activeadmin/issues/993
[#994]: https://github.com/activeadmin/activeadmin/issues/994
[#1013]: https://github.com/activeadmin/activeadmin/issues/1013
[#1016]: https://github.com/activeadmin/activeadmin/issues/1016
[#1023]: https://github.com/activeadmin/activeadmin/issues/1023
[#1032]: https://github.com/activeadmin/activeadmin/issues/1032
[#1033]: https://github.com/activeadmin/activeadmin/issues/1033
[#1041]: https://github.com/activeadmin/activeadmin/issues/1041
[#1063]: https://github.com/activeadmin/activeadmin/issues/1063
[#1117]: https://github.com/activeadmin/activeadmin/issues/1117
[#1439]: https://github.com/activeadmin/activeadmin/issues/1439
[#1609]: https://github.com/activeadmin/activeadmin/issues/1609
[#1626]: https://github.com/activeadmin/activeadmin/issues/1626
[#1647]: https://github.com/activeadmin/activeadmin/issues/1647
[#1664]: https://github.com/activeadmin/activeadmin/issues/1664
[#1668]: https://github.com/activeadmin/activeadmin/issues/1668
[#1681]: https://github.com/activeadmin/activeadmin/issues/1681
[#1683]: https://github.com/activeadmin/activeadmin/issues/1683
[#1699]: https://github.com/activeadmin/activeadmin/issues/1699
[#1745]: https://github.com/activeadmin/activeadmin/issues/1745
[#1752]: https://github.com/activeadmin/activeadmin/issues/1752
[#1775]: https://github.com/activeadmin/activeadmin/issues/1775
[#1782]: https://github.com/activeadmin/activeadmin/issues/1782
[#1783]: https://github.com/activeadmin/activeadmin/issues/1783
[#1788]: https://github.com/activeadmin/activeadmin/issues/1788
[#1801]: https://github.com/activeadmin/activeadmin/issues/1801
[#1804]: https://github.com/activeadmin/activeadmin/issues/1804
[#1805]: https://github.com/activeadmin/activeadmin/issues/1805
[#1817]: https://github.com/activeadmin/activeadmin/issues/1817
[#1834]: https://github.com/activeadmin/activeadmin/issues/1834
[#1861]: https://github.com/activeadmin/activeadmin/issues/1861
[#1867]: https://github.com/activeadmin/activeadmin/issues/1867
[#1871]: https://github.com/activeadmin/activeadmin/issues/1871
[#1873]: https://github.com/activeadmin/activeadmin/issues/1873
[#1893]: https://github.com/activeadmin/activeadmin/issues/1893
[#1896]: https://github.com/activeadmin/activeadmin/issues/1896
[#1908]: https://github.com/activeadmin/activeadmin/issues/1908
[#1913]: https://github.com/activeadmin/activeadmin/issues/1913
[#1916]: https://github.com/activeadmin/activeadmin/issues/1916
[#1926]: https://github.com/activeadmin/activeadmin/issues/1926
[#1928]: https://github.com/activeadmin/activeadmin/issues/1928
[#1929]: https://github.com/activeadmin/activeadmin/issues/1929
[#1933]: https://github.com/activeadmin/activeadmin/issues/1933
[#1937]: https://github.com/activeadmin/activeadmin/issues/1937
[#1940]: https://github.com/activeadmin/activeadmin/issues/1940
[#1947]: https://github.com/activeadmin/activeadmin/issues/1947
[#1952]: https://github.com/activeadmin/activeadmin/issues/1952
[#1960]: https://github.com/activeadmin/activeadmin/issues/1960
[#1961]: https://github.com/activeadmin/activeadmin/issues/1961
[#1962]: https://github.com/activeadmin/activeadmin/issues/1962
[#1966]: https://github.com/activeadmin/activeadmin/issues/1966
[#1967]: https://github.com/activeadmin/activeadmin/issues/1967
[#1973]: https://github.com/activeadmin/activeadmin/issues/1973
[#1979]: https://github.com/activeadmin/activeadmin/issues/1979
[#2000]: https://github.com/activeadmin/activeadmin/issues/2000
[#2001]: https://github.com/activeadmin/activeadmin/issues/2001
[#2015]: https://github.com/activeadmin/activeadmin/issues/2015
[#2018]: https://github.com/activeadmin/activeadmin/issues/2018
[#2040]: https://github.com/activeadmin/activeadmin/issues/2040
[#2043]: https://github.com/activeadmin/activeadmin/issues/2043
[#2044]: https://github.com/activeadmin/activeadmin/issues/2044
[#2046]: https://github.com/activeadmin/activeadmin/issues/2046
[#2054]: https://github.com/activeadmin/activeadmin/issues/2054
[#2058]: https://github.com/activeadmin/activeadmin/issues/2058
[#2060]: https://github.com/activeadmin/activeadmin/issues/2060
[#2062]: https://github.com/activeadmin/activeadmin/issues/2062
[#2068]: https://github.com/activeadmin/activeadmin/issues/2068
[#2071]: https://github.com/activeadmin/activeadmin/issues/2071
[#2072]: https://github.com/activeadmin/activeadmin/issues/2072
[#2075]: https://github.com/activeadmin/activeadmin/issues/2075
[#2083]: https://github.com/activeadmin/activeadmin/issues/2083
[#2084]: https://github.com/activeadmin/activeadmin/issues/2084
[#2085]: https://github.com/activeadmin/activeadmin/issues/2085
[#2087]: https://github.com/activeadmin/activeadmin/issues/2087
[#2088]: https://github.com/activeadmin/activeadmin/issues/2088
[#2089]: https://github.com/activeadmin/activeadmin/issues/2089
[#2090]: https://github.com/activeadmin/activeadmin/issues/2090
[#2095]: https://github.com/activeadmin/activeadmin/issues/2095
[#2096]: https://github.com/activeadmin/activeadmin/issues/2096
[#2099]: https://github.com/activeadmin/activeadmin/issues/2099
[#2107]: https://github.com/activeadmin/activeadmin/issues/2107
[#2113]: https://github.com/activeadmin/activeadmin/issues/2113
[#2125]: https://github.com/activeadmin/activeadmin/issues/2125
[#2134]: https://github.com/activeadmin/activeadmin/issues/2134
[#2139]: https://github.com/activeadmin/activeadmin/issues/2139
[#2147]: https://github.com/activeadmin/activeadmin/issues/2147
[#2150]: https://github.com/activeadmin/activeadmin/issues/2150
[#2154]: https://github.com/activeadmin/activeadmin/issues/2154
[#2162]: https://github.com/activeadmin/activeadmin/issues/2162
[#2165]: https://github.com/activeadmin/activeadmin/issues/2165
[#2175]: https://github.com/activeadmin/activeadmin/issues/2175
[#2186]: https://github.com/activeadmin/activeadmin/issues/2186
[#2215]: https://github.com/activeadmin/activeadmin/issues/2215
[#2221]: https://github.com/activeadmin/activeadmin/issues/2221
[#2228]: https://github.com/activeadmin/activeadmin/issues/2228
[#2231]: https://github.com/activeadmin/activeadmin/issues/2231
[#2255]: https://github.com/activeadmin/activeadmin/issues/2255
[#2258]: https://github.com/activeadmin/activeadmin/issues/2258
[#2313]: https://github.com/activeadmin/activeadmin/issues/2313
[#2315]: https://github.com/activeadmin/activeadmin/issues/2315
[#2319]: https://github.com/activeadmin/activeadmin/issues/2319
[#2326]: https://github.com/activeadmin/activeadmin/issues/2326
[#2333]: https://github.com/activeadmin/activeadmin/issues/2333
[#2348]: https://github.com/activeadmin/activeadmin/issues/2348
[#2395]: https://github.com/activeadmin/activeadmin/issues/2395
[#2403]: https://github.com/activeadmin/activeadmin/issues/2403
[#2416]: https://github.com/activeadmin/activeadmin/issues/2416
[#2419]: https://github.com/activeadmin/activeadmin/issues/2419
[#2420]: https://github.com/activeadmin/activeadmin/issues/2420
[#2454]: https://github.com/activeadmin/activeadmin/issues/2454
[#2523]: https://github.com/activeadmin/activeadmin/issues/2523
[#2532]: https://github.com/activeadmin/activeadmin/issues/2532
[#2541]: https://github.com/activeadmin/activeadmin/issues/2541
[#2544]: https://github.com/activeadmin/activeadmin/issues/2544
[#2545]: https://github.com/activeadmin/activeadmin/issues/2545
<<<<<<< HEAD
[#2588]: https://github.com/activeadmin/activeadmin/issues/2588
[#2601]: https://github.com/activeadmin/activeadmin/issues/2601
[#2744]: https://github.com/activeadmin/activeadmin/issues/2744
[#2847]: https://github.com/activeadmin/activeadmin/issues/2847
>>>>>>> 1e938ac5 (rename active_admin to activeadmin)
[@Bishop]: https://github.com/Bishop
[@BoboFraggins]: https://github.com/BoboFraggins
[@DMajrekar]: https://github.com/DMajrekar
[@Daxter]: https://github.com/Daxter
[@EtienneDepaulis]: https://github.com/EtienneDepaulis
[@MoritzMoritz]: https://github.com/MoritzMoritz
[@TBAA]: https://github.com/TBAA
[@TiagoCardoso1983]: https://github.com/TiagoCardoso1983
[@ZequeZ]: https://github.com/ZequeZ
[@adrienkohlbecker]: https://github.com/adrienkohlbecker
[@ai]: https://github.com/ai
=======
[#3038]: https://github.com/activeadmin/activeadmin/issues/3038
[#3075]: https://github.com/activeadmin/activeadmin/issues/3075
[#3463]: https://github.com/activeadmin/activeadmin/issues/3463
[#3464]: https://github.com/activeadmin/activeadmin/issues/3464
[#3486]: https://github.com/activeadmin/activeadmin/issues/3486
[#3519]: https://github.com/activeadmin/activeadmin/issues/3519
[#3535]: https://github.com/activeadmin/activeadmin/issues/3535
[#3553]: https://github.com/activeadmin/activeadmin/issues/3553
[#3606]: https://github.com/activeadmin/activeadmin/issues/3606
[#3686]: https://github.com/activeadmin/activeadmin/issues/3686
[#3695]: https://github.com/activeadmin/activeadmin/issues/3695
[#3731]: https://github.com/activeadmin/activeadmin/issues/3731
[#3783]: https://github.com/activeadmin/activeadmin/issues/3783
[#3894]: https://github.com/activeadmin/activeadmin/issues/3894
[#4118]: https://github.com/activeadmin/activeadmin/issues/4118
[#4173]: https://github.com/activeadmin/activeadmin/issues/4173
[#4187]: https://github.com/activeadmin/activeadmin/issues/4187
[#4254]: https://github.com/activeadmin/activeadmin/issues/4254
[#5043]: https://github.com/activeadmin/activeadmin/issues/5043
[#5198]: https://github.com/activeadmin/activeadmin/issues/5198

[21b6138f]: https://github.com/activeadmin/activeadmin/pull/5740/commits/21b6138fdcf58cd54c3f1d3f60cb1127b174b40f

[#3091]: https://github.com/activeadmin/activeadmin/pull/3091
[#3435]: https://github.com/activeadmin/activeadmin/pull/3435
[#4477]: https://github.com/activeadmin/activeadmin/pull/4477
[#4731]: https://github.com/activeadmin/activeadmin/pull/4731
[#4759]: https://github.com/activeadmin/activeadmin/pull/4759
[#4768]: https://github.com/activeadmin/activeadmin/pull/4768
[#4848]: https://github.com/activeadmin/activeadmin/pull/4848
[#4851]: https://github.com/activeadmin/activeadmin/pull/4851
[#4867]: https://github.com/activeadmin/activeadmin/pull/4867
[#4870]: https://github.com/activeadmin/activeadmin/pull/4870
[#4882]: https://github.com/activeadmin/activeadmin/pull/4882
[#4940]: https://github.com/activeadmin/activeadmin/pull/4940
[#4950]: https://github.com/activeadmin/activeadmin/pull/4950
[#4951]: https://github.com/activeadmin/activeadmin/pull/4951
[#4989]: https://github.com/activeadmin/activeadmin/pull/4989
[#4996]: https://github.com/activeadmin/activeadmin/pull/4996
[#4997]: https://github.com/activeadmin/activeadmin/pull/4997
[#5003]: https://github.com/activeadmin/activeadmin/pull/5003
[#5029]: https://github.com/activeadmin/activeadmin/pull/5029
[#5037]: https://github.com/activeadmin/activeadmin/pull/5037
[#5044]: https://github.com/activeadmin/activeadmin/pull/5044
[#5046]: https://github.com/activeadmin/activeadmin/pull/5046
[#5052]: https://github.com/activeadmin/activeadmin/pull/5052
[#5060]: https://github.com/activeadmin/activeadmin/pull/5060
[#5069]: https://github.com/activeadmin/activeadmin/pull/5069
[#5081]: https://github.com/activeadmin/activeadmin/pull/5081
[#5088]: https://github.com/activeadmin/activeadmin/pull/5088
[#5093]: https://github.com/activeadmin/activeadmin/pull/5093
[#5099]: https://github.com/activeadmin/activeadmin/pull/5099
[#5104]: https://github.com/activeadmin/activeadmin/pull/5104
[#5119]: https://github.com/activeadmin/activeadmin/pull/5119
[#5120]: https://github.com/activeadmin/activeadmin/pull/5120
[#5125]: https://github.com/activeadmin/activeadmin/pull/5125
[#5137]: https://github.com/activeadmin/activeadmin/pull/5137
[#5143]: https://github.com/activeadmin/activeadmin/pull/5143
[#5157]: https://github.com/activeadmin/activeadmin/pull/5157
[#5167]: https://github.com/activeadmin/activeadmin/pull/5167
[#5180]: https://github.com/activeadmin/activeadmin/pull/5180
[#5187]: https://github.com/activeadmin/activeadmin/pull/5187
[#5194]: https://github.com/activeadmin/activeadmin/pull/5194
[#5208]: https://github.com/activeadmin/activeadmin/pull/5208
[#5210]: https://github.com/activeadmin/activeadmin/pull/5210
[#5223]: https://github.com/activeadmin/activeadmin/pull/5223
[#5238]: https://github.com/activeadmin/activeadmin/pull/5238
[#5240]: https://github.com/activeadmin/activeadmin/pull/5240
[#5251]: https://github.com/activeadmin/activeadmin/pull/5251
[#5253]: https://github.com/activeadmin/activeadmin/pull/5253
[#5266]: https://github.com/activeadmin/activeadmin/pull/5266
[#5272]: https://github.com/activeadmin/activeadmin/pull/5272
[#5275]: https://github.com/activeadmin/activeadmin/pull/5275
[#5284]: https://github.com/activeadmin/activeadmin/pull/5284
[#5295]: https://github.com/activeadmin/activeadmin/pull/5295
[#5299]: https://github.com/activeadmin/activeadmin/pull/5299
[#5320]: https://github.com/activeadmin/activeadmin/pull/5320
[#5324]: https://github.com/activeadmin/activeadmin/pull/5324
[#5330]: https://github.com/activeadmin/activeadmin/pull/5330
[#5334]: https://github.com/activeadmin/activeadmin/pull/5334
[#5336]: https://github.com/activeadmin/activeadmin/pull/5336
[#5341]: https://github.com/activeadmin/activeadmin/pull/5341
[#5343]: https://github.com/activeadmin/activeadmin/pull/5343
[#5357]: https://github.com/activeadmin/activeadmin/pull/5357
[#5359]: https://github.com/activeadmin/activeadmin/pull/5359
[#5368]: https://github.com/activeadmin/activeadmin/pull/5368
[#5370]: https://github.com/activeadmin/activeadmin/pull/5370
[#5375]: https://github.com/activeadmin/activeadmin/pull/5375
[#5376]: https://github.com/activeadmin/activeadmin/pull/5376
[#5399]: https://github.com/activeadmin/activeadmin/pull/5399
[#5401]: https://github.com/activeadmin/activeadmin/pull/5401
[#5408]: https://github.com/activeadmin/activeadmin/pull/5408
[#5413]: https://github.com/activeadmin/activeadmin/pull/5413
[#5417]: https://github.com/activeadmin/activeadmin/pull/5417
[#5418]: https://github.com/activeadmin/activeadmin/pull/5418
[#5433]: https://github.com/activeadmin/activeadmin/pull/5433
[#5446]: https://github.com/activeadmin/activeadmin/pull/5446
[#5448]: https://github.com/activeadmin/activeadmin/pull/5448
[#5453]: https://github.com/activeadmin/activeadmin/pull/5453
[#5458]: https://github.com/activeadmin/activeadmin/pull/5458
[#5461]: https://github.com/activeadmin/activeadmin/pull/5461
[#5464]: https://github.com/activeadmin/activeadmin/pull/5464
[#5486]: https://github.com/activeadmin/activeadmin/pull/5486
[#5501]: https://github.com/activeadmin/activeadmin/pull/5501
[#5504]: https://github.com/activeadmin/activeadmin/pull/5504
[#5517]: https://github.com/activeadmin/activeadmin/pull/5517
[#5537]: https://github.com/activeadmin/activeadmin/pull/5537
[#5555]: https://github.com/activeadmin/activeadmin/pull/5555
[#5583]: https://github.com/activeadmin/activeadmin/pull/5583
[#5608]: https://github.com/activeadmin/activeadmin/pull/5608
[#5611]: https://github.com/activeadmin/activeadmin/pull/5611
[#5627]: https://github.com/activeadmin/activeadmin/pull/5627
[#5631]: https://github.com/activeadmin/activeadmin/pull/5631
[#5632]: https://github.com/activeadmin/activeadmin/pull/5632
[#5650]: https://github.com/activeadmin/activeadmin/pull/5650
[#5590]: https://github.com/activeadmin/activeadmin/pull/5590
[#5662]: https://github.com/activeadmin/activeadmin/pull/5662
[#5710]: https://github.com/activeadmin/activeadmin/pull/5710
[#5726]: https://github.com/activeadmin/activeadmin/pull/5726
[#5738]: https://github.com/activeadmin/activeadmin/pull/5738
[#5740]: https://github.com/activeadmin/activeadmin/pull/5740
[#5751]: https://github.com/activeadmin/activeadmin/pull/5751
[#5758]: https://github.com/activeadmin/activeadmin/pull/5758
[#5777]: https://github.com/activeadmin/activeadmin/pull/5777
[#5794]: https://github.com/activeadmin/activeadmin/pull/5794
[#5800]: https://github.com/activeadmin/activeadmin/pull/5800
[#5801]: https://github.com/activeadmin/activeadmin/pull/5801
[#5802]: https://github.com/activeadmin/activeadmin/pull/5802
[#5811]: https://github.com/activeadmin/activeadmin/pull/5811
[#5816]: https://github.com/activeadmin/activeadmin/pull/5816
[#5822]: https://github.com/activeadmin/activeadmin/pull/5822
[#5826]: https://github.com/activeadmin/activeadmin/pull/5826
[#5831]: https://github.com/activeadmin/activeadmin/pull/5831
[#5548]: https://github.com/activeadmin/activeadmin/pull/5548
[#5842]: https://github.com/activeadmin/activeadmin/pull/5842
[#5854]: https://github.com/activeadmin/activeadmin/pull/5854
[#5874]: https://github.com/activeadmin/activeadmin/pull/5874
[#5877]: https://github.com/activeadmin/activeadmin/pull/5877
[#5886]: https://github.com/activeadmin/activeadmin/pull/5886
[#5870]: https://github.com/activeadmin/activeadmin/pull/5870
[#5895]: https://github.com/activeadmin/activeadmin/pull/5895
[#5867]: https://github.com/activeadmin/activeadmin/pull/5867
[#5887]: https://github.com/activeadmin/activeadmin/pull/5887
[#5931]: https://github.com/activeadmin/activeadmin/pull/5931

[@5t111111]: https://github.com/5t111111
[@aarek]: https://github.com/aarek
[@ajw725]: https://github.com/ajw725
[@alex-bogomolov]: https://github.com/alex-bogomolov
>>>>>>> e0ac14d0 (Convert namespace to sym to prevent duplicate namespaces (#5931))
[@amiel]: https://github.com/amiel
[@ball-hayden]: https://github.com/ball-hayden
[@bobbytables]: https://github.com/bobbytables
[@caifara]: https://github.com/caifara
[@cknoxrun]: https://github.com/cknoxrun
[@comboy]: https://github.com/comboy
[@coreyward]: https://github.com/coreyward
[@dapi]: https://github.com/dapi
[@dbussin]: https://github.com/dbussin
[@developer88]: https://github.com/developer88
[@dhiemstra]: https://github.com/dhiemstra
[@dmfrancisco]: https://github.com/dmfrancisco
[@doug316]: https://github.com/doug316
[@ebeigarts]: https://github.com/ebeigarts
[@ejholmes]: https://github.com/ejholmes
[@emzeq]: https://github.com/emzeq
[@ericcumbee]: https://github.com/ericcumbee
[@ericpromislow]: https://github.com/ericpromislow
[@fabiokr]: https://github.com/fabiokr
[@fabiormoura]: https://github.com/fabiormoura
[@fbuenemann]: https://github.com/fbuenemann
[@george]: https://github.com/george
[@ggilder]: https://github.com/ggilder
[@gregbell]: https://github.com/gregbell
[@hakanensari]: https://github.com/hakanensari
[@henrrrik]: https://github.com/henrrrik
[@ilyakatz]: https://github.com/ilyakatz
[@j]: https://github.com/j
[@jamesalmond]: https://github.com/jamesalmond
[@jancel]: https://github.com/jancel
[@jbarket]: https://github.com/jbarket
[@jbhannah]: https://github.com/jbhannah
[@jherdman]: https://github.com/jherdman
[@johnnyshields]: https://github.com/johnnyshields
[@jokklan]: https://github.com/jokklan
[@joseluistorres]: https://github.com/joseluistorres
[@joshuacollins85]: https://github.com/joshuacollins85
[@jschwindt]: https://github.com/jschwindt
[@kerberoS]: https://github.com/kerberoS
[@knoopx]: https://github.com/knoopx
[@krug]: https://github.com/krug
[@laffinkippah]: https://github.com/laffinkippah
[@latortuga]: https://github.com/latortuga
[@lupinglade]: https://github.com/lupinglade
[@maax]: https://github.com/maax
[@macfanatic]: https://github.com/macfanatic
[@mattvague]: https://github.com/mattvague
[@mindhalt]: https://github.com/mindhalt
[@mitio]: https://github.com/mitio
[@mperham]: https://github.com/mperham
[@mwindwer]: https://github.com/mwindwer
[@nappa]: https://github.com/nappa
[@neoriddle]: https://github.com/neoriddle
[@orendon]: https://github.com/orendon
[@page_title]: https://github.com/page_title
[@pcreux]: https://github.com/pcreux
[@per_page]: https://github.com/per_page
[@psy-q]: https://github.com/psy-q
[@ptn]: https://github.com/ptn
[@randym]: https://github.com/randym
[@rdsoze]: https://github.com/rdsoze
[@rheaton]: https://github.com/rheaton
[@rmw]: https://github.com/rmw
[@robdiciuccio]: https://github.com/robdiciuccio
[@rolfb]: https://github.com/rolfb
[@ronen]: https://github.com/ronen
[@ryansch]: https://github.com/ryansch
[@samvincent]: https://github.com/samvincent
[@sftsang]: https://github.com/sftsang
[@shayfrendt]: https://github.com/shayfrendt
[@shekibobo]: https://github.com/shekibobo
[@shell]: https://github.com/shell
[@simonoff]: https://github.com/simonoff
[@snapapps]: https://github.com/snapapps
[@stereoscott]: https://github.com/stereoscott
<<<<<<< HEAD
[@sunny]: https://github.com/sunny
[@tank-bohr]: https://github.com/tank-bohr
[@tinynumbers]: https://github.com/tinynumbers
[@tracedwax]: https://github.com/tracedwax
[@tricknotes]: https://github.com/tricknotes
[@utkarshkukreti]: https://github.com/utkarshkukreti
[@vairix]: https://github.com/vairix
[@vairix-ssierra]: https://github.com/vairix-ssierra
[@valdemarua]: https://github.com/valdemarua
[@watson]: https://github.com/watson
[@whatcould]: https://github.com/whatcould
[@yawn]: https://github.com/yawn
[@yorch]: https://github.com/yorch
=======
[@tiagotex]: https://github.com/tiagotex
[@timoschilling]: https://github.com/timoschilling
[@TimPetricola]: https://github.com/TimPetricola
[@varyonic]: https://github.com/varyonic
[@violeta-p]: https://github.com/violeta-p
[@WaKeMaTTa]: https://github.com/WaKeMaTTa
[@wasifhossain]: https://github.com/wasifhossain
[@westonganger]: https://github.com/westonganger
[@Wowu]: https://github.com/Wowu
[@wspurgin]: https://github.com/wspurgin
>>>>>>> e0ac14d0 (Convert namespace to sym to prevent duplicate namespaces (#5931))
[@zorab47]: https://github.com/zorab47
