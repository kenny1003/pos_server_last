#영업을 시작했는지 안했는지 알기위한 전역변수, 영업중이면 1 아니면 0
$working = 0

class HomeController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.

  def index
    @test = $working

  end

  def choosestore


  end


  def makestore

    if current_user.store present?
      redirect_to "/home/nav"

    else
      @store = Store.new
      @store.user_id = current_user.id
      @store.name = params[:store_name]
      @store.goal = params[:goal]
      @store.save
      redirect_to "/home/nav"
    end

  end

  #영업 시작
  def storestart

    $working = 1 #영업중 상태
    current_user.store.working = true
    current_user.store.save

    @workperiod = Workperiod.new
    @workperiod.store_id = current_user.store.id #db 연결 (workperiod <-> store)
    @workperiod.startingtime = "start"
    @workperiod.save
    redirect_to "/home/nav"
  end

  #영업 끝
  def storefinish

    $working = 0 #영업종료 상태

    current_user.store.working = false
    current_user.store.save

    @workperiod = Workperiod.last
    @workperiod.store_id = current_user.store.id #db 연결 (workperiod <-> store)
    @workperiod.finishtime = "finish"
    @workperiod.save
    redirect_to "/home/nav"
  end

end
