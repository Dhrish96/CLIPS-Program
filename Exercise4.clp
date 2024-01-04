;the knowledge base
(defruleop1
(path $?begin [ ?x ?y ])
(test (< ?x 4))
(not (exists (state 4 ?y)))
=>
(assert (state 4 ?y))
(assert (path $?begin [ ?x ?y ] [ 4 ?y ])))
(defruleop2
(path $?begin [ ?x ?y ])
(test (< ?y 3))
(not (exists (state ?x 3)))
=>
(assert (state ?x 3))
(assert (path $?begin [ ?x ?y ] [ ?x 3 ])))
(defruleop3
(path $?begin [ ?x ?y ])
(test (< ?x 4))
(test (>= (+ ?x ?y) 4))
(not (exists (state 4 =(-(+ ?x ?y) 4))))
=>
(assert (state 4 =(-(+ ?x ?y) 4)))
(assert (path $?begin [ ?x ?y ] [ 4 =(-(+ ?x ?y) 4) ])))
(defruleop4
(path $?begin [ ?x ?y ])
(test (< ?y 3))
(test (>= (+ ?x ?y) 3))
(not (exists (state =(-(+ ?x ?y) 3) 3)))
=>
(assert (state =(-(+ ?x ?y) 3) 3))
(assert (path $?begin [ ?x ?y ] [ =(-(+ ?x ?y) 3) 3 ])))
(defruleop5
(path $?begin [ ?x ?y ])
(test (> ?x 0))
(test (<= (+ ?x ?y) 3))
(not (exists (state 0 =(+ ?x ?y))))
=>
(assert (state 0 =(+ ?x ?y)))
(assert (path $?begin [ ?x ?y ] [ 0 =(+ ?x ?y) ])))
(defruleop6
(path $?begin [ ?x ?y ])
(test (> ?y 0))
(test (<= (+ ?x ?y) 4))
(not (exists (state =(+ ?x ?y) 0)))
=>
(assert (state =(+ ?x ?y) 0))
(assert (path $?begin [ ?x ?y ] [ =(+ ?x ?y) 0 ])))
(defruleop7
(path $?begin [ ?x ?y ])
(test (> ?x 0))
(not (exists (state 0 ?y)))
=>
(assert (state 0 ?y))
(assert (path $?begin [ ?x ?y ] [ 0 ?y ])))
(defruleop8
(path $?begin [ ?x ?y ])
(test (> ?y 0))
(not (exists (state ?x 0)))
=>
(assert (state ?x 0))
(assert (path $?begin [ ?x ?y ] [ ?x 0 ])))
(defruleprint-solutions
(path [ 0 0 ] $?middle [ 2 ?y ])
=>
(bind $?solution (create$ [ 0 0 ] $?middle [ 2 ?y ]))
(printout t "Solution: " $?solution crlf))