defmodule Stack.Impl do
  def pop([]), do: {:empty, []}

  def pop([head | tail]), do: {"Popped #{inspect(head)} from stack", tail}

  def push(stack, item), do: stack ++ [item]
end
