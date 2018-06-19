defmodule Tesseract.Ext.MapLike do
  defmacro __using__(opts) do
    for_module = opts[:for]

    quote do
      defimpl Collectable, for: unquote(for_module) do
        def into(original) do
          {original,
           fn
             map, {:cont, {k, v}} -> :maps.put(k, v, map)
             map, :done -> struct(unquote(for_module), map)
             _, :halt -> :ok
           end}
        end
      end

      defimpl Enumerable, for: unquote(for_module) do
        def count(timeline) do
          Enum.count(Map.from_struct(timeline))
        end

        def member?(timeline, element) do
          Enum.member?(Map.from_struct(timeline), element)
        end

        def reduce(timeline, acc, fun) do
          do_reduce(:maps.to_list(Map.from_struct(timeline)), acc, fun)
        end

        defp do_reduce(_, {:halt, acc}, _fun), do: {:halted, acc}

        defp do_reduce(list, {:suspend, acc}, fun),
          do: {:suspended, acc, &do_reduce(list, &1, fun)}

        defp do_reduce([], {:cont, acc}, _fun), do: {:done, acc}
        defp do_reduce([h | t], {:cont, acc}, fun), do: do_reduce(t, fun.(h, acc), fun)
      end
    end
  end
end
