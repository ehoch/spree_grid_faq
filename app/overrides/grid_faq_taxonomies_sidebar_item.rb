Deface::Override.new(:virtual_path => "spree/shared/_taxonomies",
                     :name => "grid_faq_taxonomies_sidebar_item",
                     :insert_bottom => "#taxonomies[class='sidebar-item']",
                     :partial => "spree/shared/taxon_faq")