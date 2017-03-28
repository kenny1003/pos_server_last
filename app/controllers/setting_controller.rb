class SettingController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.

  def index
    @menu = current_user.store.menu #db 추출 (유저에 연결된 메뉴 추출)
  end

  def menu_write
    @menu = Menu.new
    @menu.store_id = Store.find(current_user.id).id #db 연결 (store <-> menu)
    @menu.name = params[:menu_name]
    @menu.category = params[:menu_category]
    @menu.price = params[:menu_price]
    @menu.save

    redirect_to :back
  end

  def menu_change1
    @menu = Menu.find(params[:menu_id])

  end

  def menu_change2
    @menu = Menu.find(params[:menu_id])
    #@menu.store_id 는 고칠필요없음
    @menu.name = params[:menu_name]
    @menu.category = params[:menu_category]
    @menu.price = params[:menu_price]
    @menu.save

    redirect_to "/setting/index"

  end

  def menu_destroy
    @menu = Menu.find(params[:menu_id])
    @menu.destroy
    redirect_to :back
  end
end
