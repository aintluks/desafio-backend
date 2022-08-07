Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "deputies#index"

  post "file_uploads", to: "file_uploads#create"
end
