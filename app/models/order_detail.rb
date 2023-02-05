class OrderDetail < ApplicationRecord
  
  enum making_status: { cannot_start: 0, waiting_for_making: 1, making: 2, finish_making: 3 }
  
end
