class PagesController < ApplicationController
  def index
    @positions = Position.all

    render 'pages/index'
  end
end
