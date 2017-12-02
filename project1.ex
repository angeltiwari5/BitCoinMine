defmodule Project1 do

    def serverport, do: 19912
    def genserver_port, do: 19045
    

    def if_nothing() do
        if_nothing()
    end

    def accept(k, socket) do
        
        {:ok, client} = :gen_tcp.accept(socket)
        spawn fn -> serve(client, Integer.to_string(k)) end
        accept(k, socket)
    end

    def serve(client, k) do
        :gen_tcp.send(client, k)
    end

    def main(args) do
        {_, [str], _} = OptionParser.parse(args)

        if String.contains? str, "." do
                      
            stringlist = String.to_charlist(str)
            { :ok, socket } = 
                :gen_tcp.connect(stringlist, serverport(), [{:active, false}])
            {:ok, resp} = :gen_tcp.recv(socket, 0)

            k = String.to_integer(to_string resp)
            
            { :ok, socket1 } = :gen_tcp.connect(stringlist, genserver_port(), [{:active, false}])
            spawn(Worker, :worker_machine, 
                  [ k, str, socket1])
            if_nothing()
        else
            k = elem(Integer.parse(str), 0)
            
            
            server_pid = spawn(Server, :listen, [])
            
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
 	    spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])
            spawn(Worker, :bitcoin_mined, [ k, server_pid])


            {:ok, socket1} = :gen_tcp.listen(genserver_port(),
                                            [{:active, false}])
            spawn(Server, :accept, [socket1])

            {:ok, socket} = :gen_tcp.listen(serverport(),
                                            [{:active, false}])
            accept(k, socket)
        end
    end
end
