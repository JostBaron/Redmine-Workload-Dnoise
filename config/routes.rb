
RedmineApp::Application.routes.draw do
  match 'work_load/(:action(/:id))', :controller => 'work_load'
end 
