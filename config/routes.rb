Spree::Core::Engine.routes.draw do
  resources :questions, :only => [:show], :path => 'faq' do
    collection do
      get '(/page-:page)', :action => :index, :as => ''
      match '/browse/(*id)(/page-:page)', :action => :browse, :as => 'browse'
    end
  end
  
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
