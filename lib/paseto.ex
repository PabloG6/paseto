defmodule Paseto do
  @moduledoc """
  Documentation for `Paseto`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Paseto.hello()
      :world

  """
  def hello do
  end

  defp combine_string(version, type, nonce), do: Enum.join([version, type, nonce], ".")


  defp create_nonce(_payload, type, version , opts) do
    size = Keyword.get(opts, :size, 32)
    length = Keyword.get(opts, :length, 32)
    secret_key = Application.fetch_env!(:paseto, :secret_key)
    rand_bytes = :crypto.strong_rand_bytes(size)

    nonce = Blake2.hash2b(rand_bytes, length, secret_key)

    combine_string(version, type, nonce) |> Base.encode64(padding: false)


  end

  def create_token(payload, type \\ "local", version \\ "v2", opts \\ []) do
    nonce = create_nonce(payload, type, version, opts)

  end



end
