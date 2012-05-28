Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "grid_faq_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:questions, :taxons) %>")