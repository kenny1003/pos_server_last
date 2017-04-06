class ReportController < ApplicationController

  def index
    require "rubygems"
    require "will_paginate"
    array_order=["id","id desc","created_at","created_at desc","totalprice","totalprice desc"]
    if params[:value].blank?
      @order_count=0
    else  
      
      @order_count=params[:value].to_i
    end
    puts @order_count
    puts array_order[@order_count]
    order_way=array_order[@order_count]
    #@bill_all = current_user.store.bills.order("#{order_way}")
    if !current_user.store.bills.present?
      @error_message = "DB에 저장된 Report가 없습니다.
      미리 저장한 계산서가 있는지 확인하세요.
      문제상황이 계속된다면 관리자에게 문의하세요.
      (예외 처리 example)
      "
    else
    @bill_all=current_user.store.bills.paginate(:page => params[:page], :per_page => 10).order("#{order_way}")
    end
  end
end
