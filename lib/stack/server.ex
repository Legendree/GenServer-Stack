defmodule Stack.Server do
  use GenServer

  alias Stack.Impl

  def init(initial_state) when is_list(initial_state) do
    {:ok, initial_state}
  end

  def init(inital_state) when not is_list(inital_state) do
    {:ok, [inital_state]}
  end

  def handle_call(:pop, _from, stack) do
    {status, updated_stack} = Impl.pop(stack)
    {:reply, status, updated_stack}
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, Impl.push(stack, item)}
  end

  def terminate(reason, _state) do
    IO.puts("Exited with status code of #{inspect(reason)}")
  end
end
