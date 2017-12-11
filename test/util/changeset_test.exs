defmodule OMTT.Util.ChangesetTest do
  use ExUnit.Case
  alias OMTT.Util.Changeset
  import Ecto.Changeset, only: [cast: 3]

  defmodule Post do
    use Ecto.Schema

    schema "posts" do
      field :title, :string
      field :body, :string
    end
  end

  test "lowercase_field lowercases field" do
    changeset =
      cast(%Post{}, %{title: "Title", body: "Body"}, Post.__schema__(:fields))
      |> Changeset.lowercase_field(:title)

    assert changeset.valid?
    assert changeset.changes == %{title: "title", body: "Body"}
  end

  test "lowercase_field handles missing fields" do
    changeset =
      cast(%Post{}, %{body: "Body"}, Post.__schema__(:fields))
      |> Changeset.lowercase_field(:title)

    assert changeset.valid?
    assert changeset.changes == %{body: "Body"}
  end
end
