# BitCoinMine
Group Members-
1. Umang Hans ( 63564391)
2. Angel Tiwari (86495810)
• Work Unit –
The size of the work unit that resulted in best performance for our
implementation was 1,000,000 i.e. 1 million strings. This was
determined by running our program for various difficulty levels of
the problems. The more the number of 0s provided as input by the
user the larger number of string the worker will have to work upon
in order to obtain a coin.
Moreover, the worker presumably has lower computation power as
compared to the servers just like in real life bitcoin mining and thus
will take a longer time for increased level of difficulty. Since we
used eight processors 1 million strings will also avoid the situation
where the same strings are being processed by the server and the
workers.
If we used a smaller size of work unit the worker might not be able
to mine a higher difficulty levelled coin and the server will have to
provide it with more strings. Hence, a bigger work unit size also
decreased the frequency of the server being involved in sending
work load to the workers.
We are generating random strings and then taking the hash value
so every time the hash value would be different. Hence, it ensures
no overlapping of bit coin mining.

• The largest number of working machines we were able to run
our code with is 8. Which was the number of PC’s available in
our apartment at the time of testing.
