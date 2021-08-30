class ApplicationController < ActionController::Base

  #adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary
end
