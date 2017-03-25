class SettingController < ApplicationController
  def index

  end

  def menu_write
    @menu = Menu.new
    @menu.name = params[:menu_name]
    @menu.category = params[:menu_category]
    @menu.price = params[:menu_price]
    @menu.save

    redirect_to :back
  end
end
