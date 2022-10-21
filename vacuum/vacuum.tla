---- MODULE vacuum ----
EXTENDS  Integers

VARIABLES vacuum, rooms
CONSTANT size
TypeOK == vacuum \in 1..size
Init == /\ rooms = <<FALSE,FALSE>>
        /\ vacuum = 1

Clean == rooms /= <<TRUE,TRUE>>

Left == IF vacuum=1 
            THEN    /\ UNCHANGED <<vacuum, rooms>>
            ELSE    /\ vacuum' = vacuum - 1
                    /\ rooms' = rooms

Right ==  IF vacuum = size
            THEN    /\ UNCHANGED <<vacuum,rooms>>
            ELSE    /\ vacuum' = vacuum + 1
                    /\ rooms' = rooms

Suck == /\ vacuum' = vacuum
        /\ rooms' = [rooms EXCEPT ![vacuum] = TRUE]


Next == \/ Left
        \/ Right
        \/ Suck
====