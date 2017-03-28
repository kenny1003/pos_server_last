class SaleController < ApplicationController
  $billstart
  $billid
  $totalprice

  def index

    #영업중 일때만 판매 페이지를 열 수 있음.
    if $working == 0
      redirect_to "/home/nav"
    end

    #로그인한 계정에 세팅된 메뉴만 출력
    if current_user.store.menu.exists?
      @menu = current_user.store.menu #db 추출 (  유저에 연결된 메뉴 추출)

    else
      redirect_to "/setting/index"
    end



  end

  def billpreview

    @billshow = Bill.all


    if $billstart == 0
      @bill = Bill.new
      @bill.store_id = Store.find(current_user.id).id #db 연결 (bill <-> store)
      @bill.save
      $billid = @bill.id #save한 다음에 id가
      $totalprice = 0
    end

    $billstart = 1 #계산서가 작동중임을 나타낸다.

    @salesmenu = Salesmenu.new
    @salesmenu.menu_id = params[:menuid]
    @salesmenu.bill_id = $billid
    @salesmenu.save

    redirect_to :back

  end

  def billfinish
    $billstart = 0
    $billid = 0
    redirect_to "/sale/index"
  end

end
