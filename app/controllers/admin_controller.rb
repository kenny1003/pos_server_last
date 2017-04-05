class AdminController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.
  before_action :admincheck #관리자인지 확인한다.
  def index
    @user = User.all
  end

  def pincode
    @pincode_all = Pincode.all
  end

  def pincode_write
    @pincode_new = Pincode.new
    @pincode_new.pincode = params[:pincode]
    @pincode_new.memo = params[:memo]

    #인증코드가 중복이 되지 않게 한다.
    if Pincode.where(:pincode => params[:pincode]).present?
      redirect_to :back
    else
      @pincode_new.save
      redirect_to :back
    end

  end

  def pincode_destory
    @temp = Pincode.find(params[:pincode_id])

    #만약 삭제하려고 하는 인증코드가 사용중이라면, 해당 인증코드로 사용하는 상점의 인증여부(confirmation)를 false한다.
    if @temp.used?
      @temp_store = Store.find(@temp.storeid)
      @temp_store.confirmation = false
      @temp_store.save
    end

    @temp.destroy
    redirect_to :back

  end


  def store
    @store = Store.all

  end

  def store_detail
    @picked_store = Store.find(params[:storeid])
  end


  def admincheck
    if !current_user.admin_check
      redirect_to "/home/index"
    end

  end
end
