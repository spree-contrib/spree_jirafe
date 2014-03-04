# Spree Jirafe
===================

Spree extension that adds client side support for [Jirafe](http://jirafe.com) 
analytics.

Installation	
=======

Add this extension to your Gemfile:

```ruby
gem "spree_jirafe", :github => "spree/spree_jirafe"
```

Then run:

```
bundle install
```

Run:

```
bundle exec rails g spree_jirafe:install
```

in order to copy over and run the required migrations.

Configuration
=========

To set your Jirafe credentials, launch your store and head to 
`/admin/jirafe_settings/edit`.

Copyright (c) 2014 Spree Commerce Inc., released under the New BSD License
