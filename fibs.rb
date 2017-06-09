class Fibs
  attr_accessor :generated_fibs

  def generate num_of_fibs
    generate_fibs num_of_fibs
  end

  def is_known_fib? fib
    generated_fibs.include? fib
  end

  def all_fibs? fibs
    fibs.each {|fib|
      unless is_known_fib? fib
        return false
      end
    }
    true
  end

  def known_fibs_sum_of_squares
    !fib_size.zero? ? fib_squares : 0
  end

  def generated_fibs
    @generated_fibs ||= []
  end

  private
  def fib_squares
    fib_sq = generated_fibs.map{|fib| fib**2}
    squares = fib_sq.inject{ |sum,fib| sum + fib }
    squares
  end

  def fib_size
    generated_fibs.length
  end

  def generate_fibs fib_total
    fibset = (fib_size...fib_total)
    fibset.each { |fib|
      fib.zero? || fib == 1 ? @generated_fibs.push(fib) : @generated_fibs.push(@generated_fibs[-1] + @generated_fibs[-2])

    }
    @generated_fibs
  end

end
