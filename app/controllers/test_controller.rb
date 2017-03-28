class TestController < ApplicationController
  def index
    require "rubygems"
    require "axlsx"

    Axlsx::Package.new do |p|
      p.workbook do |wb|
        styles = wb.styles
        header = styles.add_style :bg_color => "DD", :sz => 16, :b => true, :alignment => {:horizontal => :center}
        tbl_header = styles.add_style :b => true, :alignment => { :horizontal => :center }
        ind_header = styles.add_style :bg_color => "FFDFDEDF", :b => true, :alignment => {:indent => 1}
        col_header  = styles.add_style :bg_color => "FFDFDEDF", :b => true, :alignment => { :horizontal => :center }
        label       = styles.add_style :alignment => { :indent => 1 }
        money       = styles.add_style :num_fmt => 5
        t_label       = styles.add_style :b => true, :bg_color => "FFDFDEDF"
        t_money = styles.add_style :b => true, :num_fmt => 5, :bg_color => "FFDFDEDF"

        wb.add_worksheet do |sheet|
          #db data
          Store.find(1).bills do |x|

          sheet.add_row

          sheet.add_row
          sheet.add_row [nil, x, "asdfasdfasd", nil, "How am I doing"], :style => tbl_header
          end
          end
      end
      p.serialize 'test.xlsx'
    end
  end
end
