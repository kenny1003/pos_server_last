class HomeController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.
  before_action :admin_check

  def index
    if current_user.store.present? and current_user.store.workperiod.present?
      #누적계산서 총액
      @bill_all = current_user.store.bills
      current_user.store.incomeall = 0
      @bill_all.each do |b|
        current_user.store.incomeall += b.totalprice
      end
      current_user.store.save
      @income_all = current_user.store.incomeall

      #오늘계산서 총액
      @bill_today = current_user.store.workperiod.last.bill
      current_user.store.incometoday = 0
      @bill_today.each do |b|
        current_user.store.incometoday += b.totalprice
      end
      current_user.store.save
      @income_today = current_user.store.incometoday

      #누적계산서 수
      @bill_all_count = current_user.store.bills.size

      #오늘계산서 수
      @bill_today_count = current_user.store.workperiod.last.bill.size
    end


  end

  def nav
    if current_user.store.present?

    else
      redirect_to :back
    end
  end

  def choosestore
    if Pincode.where(:pincode => params[:pincode]).present? and !Pincode.where(:pincode => params[:pincode]).last.used
      @temp = Pincode.where(:pincode => params[:pincode])
      @pincode = @temp.last

      @temp_store = current_user.store
      @temp_store.confirmation = true
      @temp_store.save

      #인증코드
      @pincode.storeid=@temp_store.id
      @pincode.used = true
      @pincode.save
      redirect_to "/home/index"

    else
      redirect_to "/home/index"
    end

  end


  def makestore

    if current_user.store present?
      redirect_to "/home/index"

    else
      #새로운 주점을 만들경우

      #입력한 핀코드가 맞는지 확인한다. 그리고 그 인증코드가 사용중인지 아닌지 확인한다.
      if Pincode.where(:pincode => params[:pincode]).present? and !Pincode.where(:pincode => params[:pincode]).last.used
        @temp = Pincode.where(:pincode => params[:pincode])
        @pincode = @temp.last

        @store = Store.new
        @store.user_id = current_user.id
        @store.name = params[:store_name]
        @store.major = params[:major]
        @store.goal = params[:goal]
        @store.confirmation = true
        @store.save

        #인증코드
        @pincode.storeid=@store.id
        @pincode.used = true
        @pincode.save
        redirect_to "/home/index"
      else
        redirect_to "/home/index"
        #redirect_to :back
      end

      #@store = Store.new
      #@store.user_id = current_user.id
      #@store.name = params[:store_name]
      #@store.goal = params[:goal]
      #@store.save
      #redirect_to "/home/index"
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
    redirect_to "/home/index"
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
      redirect_to "/home/index"

    end

  end

  def setting
    @store = current_user.store
  end

  def setting_store
    @store = current_user.store

  end

  def setting_store_update
    @store = current_user.store
    @store.name = params[:store_name]
    @store.goal = params[:goal]
    @store.major = params[:major]
    @store.save

    redirect_to "/home/setting"


  end








  #처음 가입하는 이메일을 통해서 관리자 권한을 부여
  def admin_check
    if current_user.email == "kwang3353@gmail.com" or current_user.email == "nemoland0506@gmail.com" or current_user.email == "admin@gmail.com"
      current_user.admin_check = true
      current_user.save
    end
  end



end
