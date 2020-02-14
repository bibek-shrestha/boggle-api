require 'net/https'
require 'httparty'

module Api
    module V1
        class LettersController < ApplicationController
            def index
                render json: { letters: generate }, status: :ok
            end

            def validate                                                      
                render json: { valid: checkWord(params[:word]) }, status: :ok
            end

            private

            def generate
                randomAlphabets = (0...16).map { ('A'..'Z').to_a[rand(26)] }
                letters = Array.new
                row = 0
                column = 0
                randomAlphabets.each_with_index do |l, i|
                    if column > 3
                        row = row + 1
                        column = 0
                    end
                    letters << Letter.new(l, row, column)
                    column = column + 1    
                end
                letters
            end


            def checkWord(word)
               exists =  Word.where(value: word).exists?
            end
        end
    end
end
