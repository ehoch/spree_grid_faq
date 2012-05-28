Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "grid_faq_footer_right",
                     :insert_bottom => "#footer-right[data-hook]",
                     :text => "<%= link_to 'FAQ', questions_url  %>")