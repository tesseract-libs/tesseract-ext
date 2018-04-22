defmodule Tesseract.Ext.MathExt do
  def average([]), do: 0
  def average(enum), do: Enum.sum(enum) / length(enum)

  def log(x, base), do: :math.log2(x) / :math.log2(base)
end
