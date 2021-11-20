defmodule Chacha20.Poly1305 do
  use Rustler, otp_app: :paseto, crate: :chacha20


  # @spec encrypt(nonce::binary(), key::binary(), payload::binary())
  # def encrypt(nonce, key, payload), do: error()
  # def error(), do: nil
end
