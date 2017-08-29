defmodule OMTT.Util.Random do

  @default_chars "abcdefghijklmnopqrstuvwxyz"
              <> "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
              <> "0123456789"

  @spec string(Integer.t, String.t) :: String.t
  def string( length, chars ) when is_binary(chars) do
      get_string( length, chars )
  end

  @spec string(Integer.t) :: String.t
  def string( length ) do
      get_string( length )
  end

  @spec string() :: String.t
  def string() do
      get_string( 8 )
  end

  defp get_string( length, chars \\ @default_chars ) do
      chars_length = chars |> String.length
      1..length
      |> Enum.map_join(fn(_) ->
          chars |> String.at(:rand.uniform( chars_length ) - 1)
      end)
  end

  @spec number() :: Integer.t
  def number() do
    get_digits(8)
  end

  @spec number(Integer.t) :: Integer.t
  def number( length ) do
    get_digits(length)
  end

  defp get_digits(length) do
    floor = :math.pow(10, length - 1)
    ceil = round(:math.pow(10, length) - floor)

    :rand.uniform(ceil) + floor - 1
    |> round
  end
end
