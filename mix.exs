defmodule TesseractExt.MixProject do
  use Mix.Project

  def project do
    [
      app: :tesseract_ext,
      version: "0.1.3",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/tesseract-libs/tesseract-ext",
      homepage_url: "http://tesseract.games"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "Elixir standard library extensions for Tesseract library bundle."
  end

  defp package() do
    [
      name: "tesseract_ext",
      maintainers: ["Urban Soban"],
      licenses: ["MIT"],
      links: %{
        "github" => "https://github.com/tesseract-libs/tesseract-ext",
        "tesseract.games" => "http://tesseract.games"
      },
      organisation: "tesseract",
      files: ["lib", "test", "config", "mix.exs", "README*", "LICENSE*"]
    ]
  end
end
