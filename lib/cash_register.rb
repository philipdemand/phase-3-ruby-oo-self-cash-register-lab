require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items_array, :last_item

    def initialize(discount = 0)
        @discount = discount.to_f
        @total = 0
        @items_array = []
        @last_item = 0
    end

    def add_item(title, price, quantity = 1)
        self.total = (self.total + (price * quantity))
        quantity.times do
            self.items_array << title
        end
        
        self.last_item = price * quantity
        
    end

    def apply_discount
        if self.discount > 0
            applied_discount = (self.discount / 100)
            self.total = (self.total - (self.total * applied_discount))
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end

    def items()
        self.items_array
    end

    def void_last_transaction
        self.total = (self.total - self.last_item)
    end
end