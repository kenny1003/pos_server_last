puts "test"
   require "rails"
   @a= Store.find(1);
   @a.bills.each do |x|
     puts x

   end