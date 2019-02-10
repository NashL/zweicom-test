# app/controllers/api/v1/fibonacci_controller.rb
module Api
  module V1
    class FibonacciController < ApplicationController
      before_action :sanitize_params

      def fibonacci
        fibonacci = FibonacciService.fib(params[:number])
        render json: {data: fibonacci}, status: :ok
      end

      private

      def sanitize_params
        params[:number] = params[:number].to_i
      end
    end
  end
end

