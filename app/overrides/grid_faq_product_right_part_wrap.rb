Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "grid_faq_product_right_part_wrap",
                     :insert_bottom => "[data-hook='product_right_part_wrap']",
                     :partial => "spree/shared/product_faq")