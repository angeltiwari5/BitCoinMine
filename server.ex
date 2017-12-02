require Logger
defmodule Server do
    def listen do
        receive do
            {:response, response} -> IO.puts response
        end
        listen()
    end

    def accept(socket) do
        {:ok, client} = :gen_tcp.accept(socket)
        spawn fn -> serve(client) end
        accept(socket)
    end

    def serve(client) do
        {:ok, print_message} = :gen_tcp.recv(client, 0)
        IO.puts print_message
        serve(client)
    end
    
end
