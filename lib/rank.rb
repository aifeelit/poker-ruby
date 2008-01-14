class PokerHand

  # Rank objects maintain the poker value of the hand. Ex. Full House
  class Rank
    include Comparable
    attr_accessor :value  
    
    HIGH_CARD = 0
    PAIR = 1
    TWO_PAIR = 2
    THREE_OF_A_KIND = 3
    STRAIGHT = 4
    FLUSH = 5
    FULL_HOUSE = 6
    FOUR_OF_A_KIND = 7
    STRAIGHT_FLUSH = 8
    ROYAL_FLUSH = 9
  
    # Creates a new Rank instance of <code>value</code>
    # Values can be 0-9. Consider using the Rank constants
    # for the hand values.
    def initialize value
      @value = value
    end
  
    # Returns the text representation of the poker rank. Ex. "Two Pair"
    def to_s
      case @value
        when 0 then "High Card"
        when 1 then "Pair"
        when 2 then "Two Pair"
        when 3 then "Three of a Kind"
        when 4 then "Straight"
        when 5 then "Flush"
        when 6 then "Full House"
        when 7 then "Four of a Kind"
        when 8 then "Straight Flush"
        when 9 then "Royal Flush"
        else "Unknown"
      end
    end
  
    def <=> other
      @value <=> other.value
    end
  end   # class Rank

end