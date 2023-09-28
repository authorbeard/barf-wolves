Rails.application.routes.draw do
  # Adding only the minimum required routes here.
  # Being very literal with the story, which means
  # the thank you page will be rendered by volunteers#create
  # no matter what, instead of redirecting to a different route
  # to display that.
  # Doing this half b/c the story doesn't ask for anything more
  # and half because 30 minutes is not a lot of minutes.

  root "volunteers#new"

  resources :volunteers, only: [:new, :create]
end
