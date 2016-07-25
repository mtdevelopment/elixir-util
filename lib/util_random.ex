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
        get_number(8)
    end

    @spec number(Integer.t) :: Integer.t
    def number( length ) do
        get_number( length )
    end

    defp get_number( length ) do
        { number, "" } = Integer.parse 1..length |> Enum.map_join( fn(_) ->
            :rand.uniform(10) - 1
        end)
        number
    end

end
