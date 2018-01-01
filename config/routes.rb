Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do 
    root to: 'dashboards#show'
  end
  root to: "homes#show"
end
