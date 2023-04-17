class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_locale
    before_action :login_required
    # rescue_from MyCustomError, with: show_custom_error_page
    
    private

    def login_required
        redirect_to login_url unless current_user
    end


    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    private
    
    # def show_custom_error_page(error)
    #     @error = error
    #     render :custom_error
    # end

    def set_locale
        I18n.locale = @current_user&.locale || :ja #ログインしていなければ日本語
    end
end
