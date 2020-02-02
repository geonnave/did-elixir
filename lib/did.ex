defmodule DID do
  @moduledoc """
  Documentation for DID.
  """

  defstruct method: nil,
            id: nil,
            path: nil,
            query: nil,
            fragment: nil

  def parse(%DID{} = did), do: did

  def parse("did:" <> input) when is_binary(input) do
    [method, rest] = String.split(input, ":", parts: 2)
    [id, fragment] = parse_id(rest)

    %DID{
      method: method,
      id: id,
      fragment: fragment
    }
  end

  def parse(_), do: {:error, :invalid_input}

  def parse_id(rest) do
    case String.split(rest, "#", parts: 2) do
      [id, rest] ->
        [id, rest]

      [id] ->
        [id, ""]
    end
  end
end
