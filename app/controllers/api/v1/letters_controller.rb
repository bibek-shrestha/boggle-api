module Api
  module V1
    class LettersController < ApplicationController
      include Response
      def index
        begin
          letters = LetterGenerator.generate
          get_success_response(letters, :ok)
        rescue StandardError => e
          get_error_response(e)
        end
      end
    end
  end
end
