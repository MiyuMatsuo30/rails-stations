class ApplicationController < ActionController::Base
    add_flash_types :secondary, :success, :danger, :warning, :info, :light, :dark
end
