defmodule Worker do
    

    def generate_random_str() do
        :crypto.strong_rand_bytes(16) |> Base.encode64 |> binary_part(0,16)
    end

    def bitcoin_mined( k,  server_pid) do
        input = "angeltiwari3214;" <> generate_random_str()
        hash = Base.encode16(:crypto.hash(:sha256,input))
        num_zeros_in_hash = String.slice(hash,0..k-1)
        charlist = String.to_charlist(num_zeros_in_hash)
        flag = Enum.all?(charlist , fn(x) ->  x == 48 end)
        
        
        if flag == true  do
            
                result = Enum.join([input,hash],"\t")
                send server_pid, { :response, result }
                
        end
        bitcoin_mined( k, server_pid)
    end

    def worker_machine( k, str, socket) do
        input = "angeltiwari3214;" <> generate_random_str()
        hash = Base.encode16(:crypto.hash(:sha256,input))
        num_zeros_in_hash = String.slice(hash,0..k-1)
        charlist = String.to_charlist(num_zeros_in_hash)
        flag = Enum.all?(charlist , fn(x) ->  x == 48 end)
        
        
        if flag == true  do
            
               result = Enum.join([input,hash],"\t")
		
                :gen_tcp.send(socket, result)	
        end
      

        worker_machine( k,str, socket)
    end

end
