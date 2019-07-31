class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_number, :license_number,:experience
    ])
    end

    def required_signin
      unless current_user || current_bus_owner
        flash[:error]  = "logIn Required!!!!!!!!"
        redirect_to root_path
      end
    end
end
