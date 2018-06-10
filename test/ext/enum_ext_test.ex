defmodule Tesseract.Ext.EnumExtTest do
    alias Tesseract.Ext.EnumExt

    use ExUnit.Case, async: true

    test "min_with_index works for list with a single element", _ do
        input = [42]
        func = fn (x) -> x end

        {42, 0} = EnumExt.min_with_index(input, func)
    end

    test "min_with_index works for list with two elements", _ do
        input = [42, 52]
        func = fn (x) -> x end

        {42, 0} = EnumExt.min_with_index(input, func)
    end

    test "min_with_index works for list with two elements (reversed input)", _ do
        input = [52, 42]
        func = fn (x) -> x end

        {42, 1} = EnumExt.min_with_index(input, func)
    end

    test "min_with_index correctly identifies a single minumum", _ do
        input = [2, 3, 1, 6, 3, 2]
        func = fn (x) -> x end

        {1, 2} = EnumExt.min_with_index(input, func)
    end

    test "min_with_index correctly identifies multiple minumums", _ do
        input = [2, 3, 1, 6, 3, 1, 2]
        func = fn (x) -> x end

        [{1, 5}, {1, 2}] = EnumExt.min_with_index(input, func)
    end

    test "min_with_index correctly resolves ties if resolve function is given", _ do
        input = [{1, 1}, {2, 5}, {3, 5}, {1, 2}, {1, 6}]
        func = fn ({x, _}) -> x end
        resolve_func = fn ({_, y}) -> y end

        {{1, 1}, 0} = EnumExt.min_with_index(input, func, resolve_func)
    end
end