class ApplicationController < ActionController::API 
  # protect_from_forgery with: :null_session,
  #     if: Proc.new { |c| c.request.format =~ %r{application/json} }
  #   def current_user
  #      User.first
  #   end

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end
end