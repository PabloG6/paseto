defmodule Mix.Tasks.Paseto.Gen.Secret do
  use Mix.Task
  def run([]), do: run(["64"])


  def run([int]), do: parse!(int) |> gen_random_string() |> Mix.shell.info()


  @spec invalid_args!() :: no_return()

  defp invalid_args!(), do: Mix.raise("paseto.gen.secret requires an integer greater than 32 or none at all.")

  defp parse!(int) do
    case Integer.parse(int) do
      {num, ""} -> num
      _ -> invalid_args!()
    end
  end



  defp gen_random_string(length) when length > 31 do
    :crypto.strong_rand_bytes(length) |> Base.encode64(padding: false) |> binary_part(0, length)

  end
end
