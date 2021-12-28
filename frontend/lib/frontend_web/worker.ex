defmodule FrontendWeb.Worker do
  def sendMessage(channelname, data) do
    # open RabbitMQ connection
    {:ok, connection} = AMQP.Connection.open()
    {:ok, channel} = AMQP.Channel.open(connection)

    # make sure channel exists
    AMQP.Queue.declare(channel, channelname)
    # encode data to send
    {:ok, encoded_data} = Poison.encode(data)
    # send message
    AMQP.Basic.publish(channel, "", channelname, encoded_data, content_type: "application/json")

    IO.puts(" [x] Cart checkout! " <> channelname)
    AMQP.Connection.close(connection)
  end
end
