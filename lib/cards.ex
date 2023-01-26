defmodule Cards do
  @moduledoc """
   Provide methods for creating and handling deck of cards.
  """
  @doc """
   Returns a list of strings representing a deck of playing cards.

  ## Examples

      iex> deck = Cards.create_deck()
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # List Comprehension Mapping
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
   Returns us a shuffled deck of cards.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.shuffle(deck)

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
   Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

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

  @doc """
   Saves our deck of cards in a file by creating it with
   the name specified.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.save(deck, "my_deck")

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  #  loading the saved file by using case we actually mean if else but
  # in elixir using if & else is discouraged
  @doc """
   loads our saved file.

  ## Examples

      iex> Cards.load("my_deck")

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      # _ means there will be a variable
      {:error, _reason} -> "The file does not exist."
    end
  end

  # setting pipe operator, the pipe operator runs different
  # methods in one singal method(the first argument is consistent!)
  @doc """
   Creates a new deck, shuffles it and deals it with the `hand_size`
   specified.

  ## Examples

      iex> Cards.create_hand(3)

  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
