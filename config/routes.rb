Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get 'example_mines/test1' => "example_mines#view_data"
  get 'example_mines/shapefileTest' => "example_mines#shapefileTest"

  get 'regions/beginScrapeProcess' => "regions#beginScrapeProcess"
  get 'regions/viewRegionData' => "regions#viewRegionData"
  get 'regions/addLongAndLatToRegions'	=> "regions#addLongAndLatToRegions"
  get 'regions/viewDrillings' => "regions#viewDrillings"
  get 'regions/viewRegionData2d' => "regions#viewRegionData2d"
  get 'regions/viewSAprojects' => "regions#viewSAprojects"

  get 'regions/viewConstructionProjects' => "regions#viewConstructionProjects"
  get 'regions/viewExplorationProjects' => "regions#viewExplorationProjects"
  get 'regions/viewOperationProjects' => "regions#viewOperationProjects"
  get 'regions/viewStudyProjects' => "regions#viewStudyProjects"
  get 'regions/viewTargetProjects' => "regions#viewTargetProjects"
end
