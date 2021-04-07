class ApplicationController < ActionController::Base
  def hello
    render html: "Hello, World! Here we come!"
  end
end
