defmodule Tesseract.Ext.Kernel do

  def get_in(accessable, keys, default) do
    case get_in(accessable, keys) do
      nil -> default
      x -> x
    end
  end
end