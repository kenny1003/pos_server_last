# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Store.create(:name => '1st', :user_id => "1", :workperiod_id => '1')
Store.create(:name => '2nd', :user_id => "1", :workperiod_id => '1')
Store.create(:name => '3rd', :user_id => "1", :workperiod_id => '2')
Store.create(:name => '4th', :user_id => "2", :workperiod_id => '2')
