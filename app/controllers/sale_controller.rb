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
        redirect_to "/setting/menusetting" #상점에서 저장한 메뉴가 하나도 없으면 메뉴 세팅 페이지로 이동
      end
      @billshow = current_user.store.bills.last #마지막에 생성된 계산서를 보여준다.
    else
      redirect_to "/home/index" #영업중이 아니라면 메뉴페이지로 이동한다.
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

    else #계산서가 닫혀있으면 새로운 계산서 생성(처음 계산서르 생성한 후 첫번째 주문)
      @bill = Bill.new
      @bill.store_id = current_user.store.id #db 연결 (bill <-> store)
      @bill.workperiod_id = current_user.store.workperiod.last.id #db 연결 (bill <-> workpeiod)
      @bill.save

      #첫번째 주문
      @salesmenu = Salesmenu.new
      @salesmenu.menu_id = params[:menuid]
      @salesmenu.bill_id = @bill.id
      @salesmenu.qty = 1 #처음 주문을 하면 주문 수량을 1부터 시작

      @salesmenu.save

      @billshow = @bill #current_user.store.bills.last
    end

    @temp_store = current_user.store #임시값으로 현재 사용자의 상점을 저장한다.
    @temp_store.billopen = true #계산서를 작성중으로 만든다.
    @temp_store.save #저장

    redirect_to :back
  end

  def billfinish

    @current_bill = current_user.store.bills.last

    if @current_bill.salesmenu.present?
      #판매페이지에서 완료 버튼을 누르면 계산서의 billopen을 false값으로 만들어서 주문이 끝난 상태를 나타낸다.
      @temp_store = current_user.store
      @temp_store.billopen = false
      @temp_store.save

      @current_bill.salesmenu.each do |b|
        @current_bill.totalprice += b.menu.price * b.qty
      end

      @current_bill.save
    end

    redirect_to "/sale/index"
  end

  def billreset
    @temp_bill = current_user.store.bills.last

    if @temp_bill.salesmenu.present?
      @temp_bill.salesmenu.each do |b|
        b.destroy
      end

    end

    redirect_to "/sale/index"


  end



  #주문화면에서 메뉴 수량 감소
  def qty_minus
    @temp = Salesmenu.find(params[:qty])
    @temp.qty-=1
    @temp.save
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
  
  def showmenu

    # redirect_to :back
  end
  
  def showcategory
    @category = current_user.store.category #db 추출 (카테고리추출)
  

    @picked_category = current_user.store.category.find(params[:category_id])
    @billshow = current_user.store.bills.last #마지막에 생성된 계산서를 보여준다.


  end



end
