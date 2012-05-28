Spree::Core::Engine.routes.draw do
  resources :questions, :only => [:index, :show], :path => 'faq'
  
  namespace :admin do
    resources :questions do
      resources :taxons do
        member do
          get :select, :action => :select_for_question
          delete :remove, :action => :remove_for_question
        end
        collection do
          post :available, :action => :available_for_question
          get  :selected, :action => :selected_for_question
        end
      end
      resources :products do
        member do
          get :select, :action => :select_for_question
          delete :remove, :action => :remove_for_question
        end
        collection do
          post :available, :action => :available_for_question
          get  :selected, :action => :selected_for_question
        end
      end
    end
  end
end
