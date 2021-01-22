class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	around_action :switch_locale
	
	def switch_locale(&action)
	  locale = params[:locale] || I18n.default_locale
	  I18n.with_locale(locale, &action)
	end

	def render_error message
	  message = message.is_a?(Array) ? message.first : message
	  render json: {message: "failed", error: message}, status: :unprocessable_entity and return
	end

	def render_success data = {}
	  render status: :ok, json: { message: 'success' }.merge(data)
	end
end
