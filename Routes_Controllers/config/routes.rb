Rails.application.routes.draw do

  root 'pages#index' #Podemos establecer el index con root

  get 'pages/index' # Esta ruta se genero en automatico cuando creamos el controlador pages, se accede a la vista de manera directa
  get 'pages/contact' # Esta ruta se genero en automatico cuando creamos el controlador pages, se accede a la vista de manera directa
  get 'pages/aboutus' # Esta ruta se genero en automatico cuando creamos el controlador pages, se accede a la vista de manera directa

  get '/holamundo' => 'pages#aboutus' #Nombramos las rutas de manera personalizada pages es el nombre del controlador y 
  # aboutus el nombre de la vista que se desplega para que esto funcione debemos tener un metodo con el nombre de la vista en el controlador
  #Ya no es necesario hacer un render directo ya que rails entiende a que vista debe llegar con los anteriores pasos

  # Al utilizar resources creo todas las rutas necesarias para un CRUD en una sola linea como ejemplo crearemos un controlador users y usaremos resources
  resources :users
  # http://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html documentacion de resources metodos y funcionamientos

  #---------------------------------------------------Notas y Recursos--------------------------------------

  #Url Helpers documentacion http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html 
  #forms para resources http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html
  # video rails resources https://www.youtube.com/watch?v=QYHdAGRzmMA
  # Rails Routes https://www.youtube.com/watch?v=j8t902C58dA
  # Rails Routing http://guides.rubyonrails.org/routing.html
  # Rails Nested Resources https://www.youtube.com/watch?v=T0lcUENA8zs

  # Podemos crear nested resource(s) ejemplo:
  resources :posts do
    resources :comments, except: [:update, :destroy]
  end

  resources :comments, only: [ :update, :destroy]

  # Member route A member route will require an ID, because it acts on a member.
  # member          /photos/1/preview   preview_photo_path(photo)   Acts on a specific resource so required id (preview specific photo)

  # A collection route doesn't because it acts on a collection of objects.
  # collection      /photos/search      search_photos_path          Acts on collection of resources(display all photos)


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #  resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
