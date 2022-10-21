---- MODULE puzzle ----
EXTENDS Integers

VARIABLES puzzle,empty

Init == /\ puzzle = <<7,2,4,
                     5,0,6,
                     8,3,1>>
        /\ empty = 5


TypeOK == empty \in 1..9
Finished == puzzle /= << 0,1,2,3,4,5,6,7,8>>

Left ==    IF empty % 3 = 0    \* Right column
            THEN    UNCHANGED <<empty,puzzle>>
            ELSE    /\ empty' = empty+1
                    /\ puzzle' = [puzzle EXCEPT  ![empty+1] = 0, ![empty] = puzzle[empty+1]]

Right == IF empty % 3 = 1    \* Left column
            THEN    UNCHANGED <<empty,puzzle>>
            ELSE    /\ empty' = empty-1
                    /\ puzzle' = [puzzle EXCEPT  ![empty-1] = 0, ![empty] = puzzle[empty-1]]

Down == IF empty <=3  \* Top row
            THEN    UNCHANGED <<empty,puzzle>>
            ELSE    /\ empty' = empty-3
                    /\ puzzle' = [puzzle EXCEPT  ![empty-3] = 0, ![empty] = puzzle[empty-3]]

Up == IF empty >= 7 \* Bottom row
            THEN    UNCHANGED <<empty,puzzle>>
            ELSE    /\ empty' = empty+3
                    /\ puzzle' = [puzzle EXCEPT  ![empty+3] = 0, ![empty] = puzzle[empty+3]]

Next == \/ Up
        \/ Down
        \/ Right
        \/ Left
====