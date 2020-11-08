class TakeAway

  attr_reader :dishes, :order

  def initialize
    @dishes = { hotdog: 5.00, fries: 3.50 }
    @order = {}
  end

  def print_menu
    dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} is not on the menu!" unless has_dish?(dish)
    order[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  def price(dish)
    dishes[dish]
  end

  def item_totals
    order.map do |dish, quantity|
      dishes[dish] * quantity
    end
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

end