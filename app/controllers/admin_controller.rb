class AdminController < ApplicationController
  before_action :authenticate_user! #로그인 사용자만 이용할 수 있음.
  #before_action :
  def index
  end

  def pincode
    @pincode_all = Pincode.all
  end


  def security

  end
end
