Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  get 'example_mines/test1' => "example_mines#view_data"
  get 'example_mines/shapefileTest' => "example_mines#shapefileTest"
end
