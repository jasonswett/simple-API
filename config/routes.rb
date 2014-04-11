SurfBreakRentals::Application.routes.draw do
  resources :listings, only: %w(create new)
  get "/listings/:slug" => "listings#show", as: "listing"
end
