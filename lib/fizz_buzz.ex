defmodule FizzBuzz do
  def build(file_name) do
    File.read(file_name) |> handle_file_read()
  end

  # p = private
  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.replace("\n", "")
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  @spec convert_and_evaluate_numbers(binary) :: :fizz
  def convert_and_evaluate_numbers(elem) do
    String.to_integer(elem)
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzBuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
