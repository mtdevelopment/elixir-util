defmodule OMTT.Util.SMTP do

  def send_html(from, to_recipients, subject, body, server, username, password, port) do
    headers = [
      {"Subject", subject},
      {"From", from},
      {"To", hd(to_recipients)},
      {"Return-Path", from}
    ]

    email = :mimemail.encode({"text", "html", headers, [{"charset", "utf-8"}], body})

    opts = [
      relay: server,
      username: username,
      password: password,
      port: port,
      tls: :always ]

    :gen_smtp_client.send({from, to_recipients, email}, opts, fn result ->
      {:ok, _receipt} = result
    end)
  end
end
