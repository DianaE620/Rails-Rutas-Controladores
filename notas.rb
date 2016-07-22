#--------------------------- Crea un esqueleto de rails
# rails new nombre

#--------------------------- Crea un controlador
# rails generate controller nombre del controlador en plural

#--------------------------- Arranca el servidor
# rails s
# rails server

#--------------------------- Ver las rutas
#rake routes

#------------------------------ Vistas o Acciones

# Cada controlador tiene una carpeta con sus vistas, las vistas deben de tener la extension .html.erb

#---------- Nuevos Links
<%= link_to 'Link rails', pages_contact_path, class: 'css_link' %>

# De esta manera creamos links en rails la sintaxis es link_to 'entre comillas lo que dira el link ' nombre de la ruta agregandole _path al final' las 
#rutas se pueden consultar con rake routes

# Si queremos agregar una clase la sintaxis es class: los dos puntos sin espacio y nombre de la clase entre comillas 

#Investigar sintaxis sass Syntactically Awesome Style Sheets http://sass-lang.com/guide


#--------------------------- Rutas Helpers y Resources

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

