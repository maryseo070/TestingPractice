class TowersOfHanoi

  attr_reader :stacks
  def initialize(stacks = nil)
    @stacks = stacks || [[3,2,1], [], []]
  end

  def render
    "Tower 0:  " + @stacks[0].join("  ") + "\n" +
    "Tower 1:  " + @stacks[1].join("  ") + "\n" +
    "Tower 2:  " + @stacks[2].join("  ") + "\n"
  end

  def display
    system("clear")
    puts render
  end

  def move(from, to)
    raise "cannot move from empty tower" if @stacks[from].empty?
    raise "cannot move onto smaller disk" unless valid_move?(from, to)
    @stacks[to] << @stacks[from].pop
  end

  def valid_move?(from, to)
    return false unless [from, to].all? { |x| x.between?(0, 2) }

    if @stacks[from].empty?
      return false
    elsif @stacks[to].empty? && !(@stacks[from].empty?)
      return true
    elsif @stacks[from].last > @stacks[to].last
      return false
    else
      return true
    end
  end

  def won?
    @stacks[0].empty? && (@stacks[1].empty? || @stacks[2].empty?)
  end

  def play
    display

    until won?
      puts "Where do you want to move from?"
      from = gets.to_i
      puts "Where do you want to move to?"
      to = gets.to_i
      if valid_move(from, to)
        move(from, to)
      else
        display
        raise "not a valid move, try again"
      end
    end
    puts "winner!"
  end

end

if $PROGRAM_NAME == __FILE__
  TowersOfHanoi.new().play
end
