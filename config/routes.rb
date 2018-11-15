Rails.application.routes.draw do
  devise_for :cohorts
  devise_for :courses
  devise_for :admins
  devise_for :students, controllers: { sessions: "students/sessions", :registrations => "students/registrations" }
  devise_for :instructors
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :instructors do
    resources :instructors
  end

  get '/students/:id/edit', to: 'students#edit'
  patch '/students/:id/edit/confirm', to: 'students#change'

  get '/cohorts/:id/edit/', to: 'cohorts#edit'
  patch '/cohorts/:id/edit/confirm', to: 'cohorts#change'

  get '/courses/:id/edit/', to: 'courses#edit'
  patch '/courses/:id/edit/confirm', to: 'courses#change'

  #Admin Delete
  get '/instructors/:id/sign_out', to: 'instructors#remove'
  get '/students/:id/sign_out', to: 'students#remove'
  get '/cohorts/:id/sign_out', to: 'cohorts#remove'
  get '/courses/:id/sign_out', to: 'courses#remove'

  # Admin Creation
  get '/create/student', to: 'students#create'
  post '/created/student', to: 'students#created'

  get '/create/instructor', to: 'instructors#create'
  post '/created/instructor', to: 'instructors#created'

  get '/create/course', to: 'courses#create'
  post '/created/course', to: 'courses#created' 

  get '/create/cohort', to: 'cohorts#create'
  post '/created/cohort', to: 'cohorts#created'

end
  