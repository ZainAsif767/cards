defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # List Comprehension Mapping
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # Shuffling our Deck of cards
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # Checking if the deck contains the card specified
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Dealing our Deck by giving the size, the size splits the deck
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
