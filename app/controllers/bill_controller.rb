class BillController < ApplicationController

  #전체계산서
  def index
    @bill_all = current_user.store.bills
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





end
