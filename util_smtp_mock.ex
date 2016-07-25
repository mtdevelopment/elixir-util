defmodule OMTT.Util.SMTPMock do
  require Logger
  
  def send_html(from, to_recipients, subject, body, server, username, password, port) do
    Logger.info "EMAIL WOULD BE SENT TO #{inspect to_recipients} from #{from}"
    Logger.info "EMAIL BODY\n#{body}"
  end
end
