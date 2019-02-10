# app/services/fibonacci_service.rb
class FibonacciService
  class << self
    def fib(n, memo = {})
      if n < 0
        return 'Only positive values accepted'
      elsif n == 0 || n == 1
        return n
      end
      memo[n] ||= fib(n-1, memo) + fib(n-2, memo)
    end
  end

end