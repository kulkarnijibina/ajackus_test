class MessagesController < ApplicationController

  # GET /messages/new
  def index
  end

  # POST /messages
  def create
    message = Message.new(message_params)
    respond_to do |format|
      if message.save!
        format.js do
          render_success data: {message: message}
        end
      else
        format.js do
          render_error message.errors.full_messages
        end
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:first_name, :last_name, :email, :phone, :message)
    end
end
