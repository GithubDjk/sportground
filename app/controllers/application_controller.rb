class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        if current_user.admin?
         rails_admin_path
        else
         root_path
        end
    end
end
