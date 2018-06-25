defmodule Tesseract.Ext.KernelTest do
  use ExUnit.Case, async: true

  alias Tesseract.Ext.Kernel, as: KernelExt

  test "get_in/3 returns nested value when it exists." do
    accessable = [
      foo: [
        bar: [
          a: 2
        ]
      ],
      kek: [
        nek: [
          b: 6
        ]
      ]
    ]

    assert 2 === KernelExt.get_in(accessable, [:foo, :bar, :a], nil)
    assert [b: 6] === KernelExt.get_in(accessable, [:kek, :nek], nil)
  end

  test "get_in/3 returns default value when path does not exist." do
    accessable = [
      foo: [
        bar: [
          a: 2
        ]
      ],
      kek: [
        nek: [
          b: 6
        ]
      ]
    ]

    assert 0 === KernelExt.get_in(accessable, [:foo, :bar, :b], 0)
    assert :error === KernelExt.get_in(accessable, [:kek, :nek, :c, :d], :error)
  end  
end