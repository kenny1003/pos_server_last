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
    @bill_all=current_user.store.bills.paginate(:page => params[:page], :per_page => 10).order("#{order_way}")

       # @bill_all=@bill_all.paginate(:page => params[:page], :per_page => 10)
  end
end
