class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def func
    puts "Hello World"
  end
end
