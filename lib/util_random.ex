defmodule OMTT.Util.Random do

  @spec string(String.t) :: String.t
  def string( length ) do
      get_string( length )
  end

  @spec string() :: String.t
  def string() do
      get_string( 8 )
  end

  defp get_string( length ) do
      alphabet
          =  "abcdefghijklmnopqrstuvwxyz"
          <> "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
          <> "0123456789"
      alphabet_length = alphabet |> String.length
      1..length
      |> Enum.map_join(fn(_) ->
          alphabet |> String.at(:rand.uniform( alphabet_length ) - 1)
      end)
  end

  @spec number() :: Integer.t
  def number() do
    get_digits([], 8)
  end

  @spec number(Integer.t) :: Integer.t
  def number( length ) do
    get_digits([], length)
  end

  defp get_digits([],0) do
    0
  end

  defp get_digits(acc, 0) do
    Enum.join(acc, "")
    |> Integer.parse
    |> elem(0)
  end

  defp get_digits([], length) do
    case (:rand.uniform(10)-1) do
      0 ->
        get_digits([], length)
      x ->
        get_digits([x], length-1)
    end
  end

  defp get_digits(acc, length) do
    get_digits([(:rand.uniform(10)-1) | acc], length-1)
  end

end
