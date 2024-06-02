class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  include SessionsHelper
end
