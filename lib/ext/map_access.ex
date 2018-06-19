defmodule Tesseract.Ext.MapAccess do
  defmacro __using__(_) do
    quote do
      @behaviour Access

      def fetch(term, key) do
        Map.fetch(term, key)
      end

      def get(term, key, default) do
        Map.get(term, key, default)
      end

      def get_and_update(data, key, fun) do
        Map.get_and_update(data, key, fun)
      end

      def pop(data, key) do
        Map.pop(data, key)
      end
    end
  end
end
