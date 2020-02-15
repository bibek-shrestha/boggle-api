module Api
  module V1
    class WordsController < ApplicationController
      include Response
      def index
        begin
          word = params[:word].strip
          isValid = WordValidator.instance.validate(word)
          get_success_response({isValid: isValid}, :ok)
        rescue StandardError => e
          get_error_response(e)
        end
      end
    end
  end
end
