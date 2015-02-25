Rails.application.routes.draw do
  root "application#index"

  get "/*" => "application#index"
end
