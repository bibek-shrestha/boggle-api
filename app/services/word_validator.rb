require 'singleton'

class WordValidator
  include Singleton

  def validate(word)
    Word.exists?(:word => word)
  end
end
