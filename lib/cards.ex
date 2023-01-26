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

  # Saving our deck on a file by using some erlang code and
  # using a built-in method.
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  #  loading the saved file by using case we actually mean if else but
  # in elixir using if & else is discouraged
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      # _ means there will be a variable
      {:error, _reason} -> "The file does not exist."
    end
  end
end
