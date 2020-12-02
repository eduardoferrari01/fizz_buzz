defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "builder/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzBuzz, :buzz, 91]}

      assert FizzBuzz.build("number.txt") == expected_response
    end

    test "when an invalid file is provided, returns an error" do
      expected_response = {:error, "Error reading the file: enoent"}

      assert FizzBuzz.build("invalid.txt") == expected_response
    end
  end
end
