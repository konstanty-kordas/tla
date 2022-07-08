---- MODULE DieHard ----
EXTENDS Integers

VARIABLES small, big

TypeOK ==   /\ small \in 0..3
            /\ big \in 0..5

Saved == big /= 4

Init == /\ small = 0
        /\ big = 0

(******************)
(* WELL WELL WELL *)
(******************)
FillSmall ==    /\ big'= big
                /\ small' = 3

FillBig ==  /\ big' = 5
            /\ small' = small

EmptySmall ==   /\ big' = big
                /\ small' = 0

EmptyBig == /\ big' = 0
            /\ small' = small

SmallToBig ==   IF big + small =< 5
                    THEN    /\ big' = big + small
                            /\ small' = 0
                    ELSE    /\ big' = 5
                            /\ small' = small - (5 - big)

BigToSmall ==   IF big + small =< 3
                    THEN    /\ big' = 0
                            /\ small' = small + big
                    ELSE    /\ big' = big - (3 - small)
                            /\ small' = 3

    
Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall
====
