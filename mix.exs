defmodule Postgrex.Mixfile do
  use Mix.Project

  def project do
    [app: :omtt_util,
     version: "1.0.0",
     elixir: "1.3.2",
     description: description(),
     package: package(),
     deps: nil
   ]
  end

  def application do
    []
  end


  defp description do
    """
    Internal utils and helper snippets used across our internal projects.
    Copy and re-use as you like.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :omtt_util,
     files: ["lib", "mix.exs", "README*"],
     maintainers: ["Oliver Mulelid-Tynes", "Trond Ekseth"],
     licenses: ["MIX/Expat"],
     links: %{"GitHub" => "https://github.com/mtdevelopment/elixir-util"}]
  end
end
