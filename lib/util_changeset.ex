defmodule OMTT.Util.Changeset do
  import Ecto.Changeset, only: [get_field: 2, put_change: 3]

  def lowercase_field(changeset, fieldname) when is_atom(fieldname) do
    case get_field(changeset, fieldname) do
      nil   -> changeset
      field -> put_change(changeset, fieldname, String.downcase(field))
    end
  end
end
