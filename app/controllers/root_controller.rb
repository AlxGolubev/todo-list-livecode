class RootController < ApplicationController
  def hello_world
    @name = params[:name]
  end
end
