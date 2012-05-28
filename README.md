Spree Grid FAQ
=========
This Spree extension will install a pretty advanced FAQ (Frequently Asked Question) to your Spree store.  Warning, it was designed for [Alarm Grid] (http://www.alarmgrid.com), so I make no guarantees it will work for your store.  Feel free to submit Pull requests to make it work for you.  Don't break stuff for me and it's in.

Known Issues / Coming Soon
=========
* Breadcrumbs
* Browse by taxon (in sidebar) for FAQ pages
* Search by SKU
* DRY up copy and pasted product / taxon code
* Double active tabs in admin

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2012 Eric Hochberger, released under the New BSD License
