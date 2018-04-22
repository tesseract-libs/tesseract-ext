defmodule Tesseract.Ext.EnumExt do
  def min_with_index(enumerable, func, resolve_func \\ nil) do
    reduce_fn = fn
      {e, i}, nil ->
        {func.(e), e, i}

      {e, i}, {curr_min, _, _} = curr ->
        fe = func.(e)

        cond do
          fe < curr_min ->
            {fe, e, i}

          fe == curr_min ->
            [{fe, e, i}, curr]

          true ->
            curr
        end

      {e, i}, [{curr_min, _, _} | _] = curr ->
        fe = func.(e)

        cond do
          fe < curr_min ->
            {fe, e, i}

          fe == curr_min ->
            [{fe, e, i} | curr]

          true ->
            curr
        end
    end

    enumerable
    |> Enum.with_index()
    |> Enum.reduce(nil, reduce_fn)
    |> case do
      {_, e, i} ->
        {e, i}

      [_ | _] = mins ->
        mins = Enum.map(mins, fn {_, e, i} -> {e, i} end)

        if resolve_func == nil do
          mins
        else
          mins
          |> Enum.min_by(fn {m, _} -> resolve_func.(m) end)
        end
    end
  end
end
