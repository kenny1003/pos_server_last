class HomeController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.

  def index


  end

  def nav
    if current_user.store.present?

    else
      redirect_to :back
    end
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
      redirect_to "/home/index"
    end

  end

  #영업 시작
  def storestart

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
    if current_user.store.billopen #계산서가 열려있으면 영업종료를 할 수 없다.
      redirect_to "/sale/index"


    else
      current_user.store.working = false
      current_user.store.save

      @workperiod = Workperiod.last
      @workperiod.store_id = current_user.store.id #db 연결 (workperiod <-> store)
      @workperiod.finishtime = "finish"
      @workperiod.save
      redirect_to "/home/nav"

    end

  end

end
