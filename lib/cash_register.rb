require "pry"

class CashRegister

    attr_reader :items, :discount
    attr_writer 
    attr_accessor :total, :quantity_record, :price_record
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []  
        @quantity_record = []
        @price_record = []              
    end
    
    def add_item(title, price, quantity = 1)
        quantity = quantity == 0 ? 1 : quantity
        self.total=(@total + (price * quantity))          
        quantity.times do 
            @items << title            
        end
        @quantity_record << quantity
        @price_record << price * quantity
    end

    def apply_discount
        discounted_total = (@total - (@total * (@discount / 100.00)))
        self.total = discounted_total
        @discount == 0 ? "There is no discount to apply." 
                       : "After the discount, the total comes to $#{discounted_total.to_i}."        
    end   

    def void_last_transaction
        self.total=(@total - @price_record.pop)
        @quantity_record.pop.times do 
            @items.pop           
        end
    end
end