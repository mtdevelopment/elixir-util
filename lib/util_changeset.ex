defmodule OMTT.Util.Changeset do


  def lowercase_field(changeset, fieldname) when is_atom(fieldname) do
    field = Ecto.Changeset.get_field(changeset, fieldname)
    Ecto.Changeset.put_change(changeset, fieldname, String.downcase(field))
  end

end