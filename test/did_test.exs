defmodule DIDTest do
  use ExUnit.Case
  doctest DID

  test "parse a DID" do
    assert %DID{
             method: "example",
             id: "q7ckgxeq1lxmra0r"
           } = DID.parse("did:example:q7ckgxeq1lxmra0r")

    assert %DID{
             method: "example",
             id: "q7ckgxeq1lxmra0r",
             fragment: "keys-1"
           } = DID.parse("did:example:q7ckgxeq1lxmra0r#keys-1")

    assert {:error, :invalid_input} = DID.parse(1)
  end
end
