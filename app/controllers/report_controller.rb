class ReportController < ApplicationController
  def index
    @bill_all = current_user.store.bills
  end
end
