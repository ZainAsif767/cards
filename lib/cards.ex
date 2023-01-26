defmodule Cards do
  @moduledoc """
   Provide methods for creating and handling deck of cards.
  """
  @doc """
   Returns a list of strings representing a deck of playing cards.
  """
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
  @doc """
   Divides a deck into a hand & the remainder of the deck.
   The `hand_size` argument indicates how many cards should
   be in the hand.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
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

  # setting pipe operator, the pipe operator runs different
  # methods in one singal method(the first argument is consistent!)
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
