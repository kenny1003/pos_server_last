class SaleController < ApplicationController
  $billstart
  $billid
  $totalprice

  def index

    #영업중 일때만 판매 페이지를 열 수 있음.
    if current_user.store.working

      #로그인한 계정에 세팅된 메뉴만 출력
      if current_user.store.category.exists?
        @category = current_user.store.category #db 추출 (카테고리추출)
      else
        redirect_to "/setting/menusetting"
      end
      @billshow = current_user.store.bills.last
    else
      redirect_to "/home/nav"
    end

  end

  def billpreview

    if current_user.store.billopen #계산서가 열여있으면,
      #첫번째 이후의 주문, 2번째 3번째 ...
      @salesmenu = Salesmenu.new
      @salesmenu.menu_id = params[:menuid]
      @salesmenu.bill_id = current_user.store.bills.last.id
      @salesmenu.save

      @billshow = current_user.store.bills.last

    else #계산서가 닫혀있으면 새로운 계산서 생성
      @bill = Bill.new
      @bill.store_id = current_user.store.id #db 연결 (bill <-> store)
      @bill.save

      #첫번째 주문
      @salesmenu = Salesmenu.new
      @salesmenu.menu_id = params[:menuid]
      @salesmenu.bill_id = @bill.id
      # @salesmenu.qty =

      @salesmenu.save

      @billshow = @bill #current_user.store.bills.last

    end

    current_user.store.billopen = true #계산서가 작동중임을 나타낸다.
    current_user.store.save

    redirect_to :back

  end

  def billfinish
    #계산서가 닫혀있음을 나타낸다.
    @temp = current_user.store
    @temp.billopen = false
    @temp.save

    $billstart = 0
    $billid = 0
    redirect_to "/sale/index"
  end

  def qty_minus
    @temp = Salesmenu.find(params[:qty])
    @temp.qty-=1
    @temp.save
    if @temp.qty == 0
      @temp.destroy
    end

    redirect_to :back


  end

  def qty_plus
    @temp = Salesmenu.find(params[:qty])
    @temp.qty+=1
    @temp.save
    redirect_to :back



  end

  def qty_change

  end

end
