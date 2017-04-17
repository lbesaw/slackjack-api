defmodule Discuss.MySecretKey do
  def fetch do
    JOSE.JWK.from_oct_file("oct-512-bit.bin")
  end
end
