require_relative '../../lib/fibs'
class Fib < ApplicationRecord
  def to_s
    Fibs.new.generate(self.iterations).to_s
  end
end
