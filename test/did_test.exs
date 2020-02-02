defmodule DIDTest do
  use ExUnit.Case
  doctest DID

  test "parse a DID" do
    assert %DID{
             method: "example",
             id: "q7ckgxeq1lxmra0r"
           } = DID.parse("did:example:q7ckgxeq1lxmra0r")

    # TODO
    assert %DID{
             method: "example",
             id: "q7ckgxeq1lxmra0r",
             path: "/a/b",
             query: "a=b",
             fragment: "keys-1"
           } = DID.parse("did:example:q7ckgxeq1lxmra0r/a/b?a=b#keys-1")
  end
end
