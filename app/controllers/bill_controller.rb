class BillController < ApplicationController
  #전체계산서
  def index
    if current_user.store.present?
      @bill_all = current_user.store.bills
    end

  end

  #오늘계산서
  def today
    @bill_today = current_user.store.workperiod.last.bill
  end

  def bill_destroy
    @bill_temp = Bill.find(params[:billid])
    @bill_temp.salesmenu.each do |b|
      b.destroy
    end
    @bill_temp.destroy
    redirect_to :back
  end

  def qty_minus
    @temp = Salesmenu.find(params[:qty])
    @temp.qty-=1
    @temp.save
    @temp.bill.totalprice -=   @temp.menu.price
    @temp.bill.save
    if @temp.qty == 0 #메뉴 주문 수량이 0이 되면 해당 메뉴를 삭제한다
      @temp.destroy
    end

    redirect_to :back

  end

  #주문화면에서 메뉴 수량 증가
  def qty_plus
    @temp = Salesmenu.find(params[:qty])
    @temp.qty+=1
    @temp.save
    redirect_to :back
  end

  def workperiod
    @workperiod = current_user.store.workperiod
  end

  def workperiod_show
    @workperiod = current_user.store.workperiod

    #사용자가 선택한 workperiod
    @picked_workperiod = current_user.store.workperiod.find(params[:workperiod_id])


  end

end
