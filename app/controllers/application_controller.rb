class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(User)
          dashboard_path(resource)
        else
          root_path
        end
    end
    

end
