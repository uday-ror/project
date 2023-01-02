module ApplicationHelper

 	def sub_total(card)
	    sum = 0 
	      sum = card.coffee.amount * card.quantity
	    return sum
  	end

  	def total_price(tp)
       s = tp.map{|i| i.coffee.amount * i.quantity}
	   s.sum
    end

end
