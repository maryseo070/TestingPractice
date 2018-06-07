def my_unique(arr)
  unique = []
  arr.each do |el|
    unique << el unless unique.include?(el)
  end
  unique
end


def two_sum(arr)
  indices = []
  arr.each_index do |i|
    (i + 1).upto(arr.length - 1) do |j|
      indices << [i, j] if arr[i] + arr[j] == 0
    end
  end
  indices
end


def my_transpose(rows)
  length = rows.first.count
  columns = Array.new(length) { Array.new(length) }

  length.times do |i|
    length.times do |j|
      columns[j][i] = rows[i][j]
    end
  end
  columns
end


def stock_picker(prices)
  best_pair = nil
  best_profit = 0

   prices.each_index do |buy_date|
     prices.each_index do |sell_date|
       # can't sell before buy
       next if sell_date < buy_date

       profit = prices[sell_date] - prices[buy_date]
       if profit > best_profit
         # Choose best days. Greed is good.
         best_pair, best_profit = [buy_date, sell_date], profit
       end
     end
   end

   best_pair
end
