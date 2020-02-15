module Api
  module V1
    class LettersController < ApplicationController
      include Response

      def index
        begin
          letters = LetterGenerator.instance.generate
          get_json_response(letters, :ok)
        rescue StandardError => e
          handleError(e)
        end
      end

      def validate
        begin
          word = params[:word].strip
          isValid = WordValidator.instance.validate(word)
          get_json_response({isValid: isValid}, :ok)
        rescue StandardError => e
          handleError(e)
        end
      end

      private

      def handleError(error)
        logger.error(error.message)
        get_json_response(error.message, :internal_server_error)
      end
    end
  end
end
