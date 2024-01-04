
; CLIPS program that can find at least one optimal way to purchase a soft drink. 
; The optimal way of purchasing means using the least number of coins.
; The machine accepts quarters, dimes and nickels
; The problem state is represented by the amount of money, in cents, that has been accepted by the machine.
; The soft drink costs 65 cents
; q=quarter, n=nickle, d=dime


; Intialize the state and path facts
(deffacts initialization 
	(state 0 0 0)                                      ; Initial state with all values set to 0
	(path [ 0 0 0 ]))                                  ; Initial path starting at [0, 0, 0]
	
; Rule op1: If q is less than 25 and there is no state with q=25, then assert a new state with q=25 and update the path

(defrule op1
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (< ?q 25))                                   ; Check if ?q is less than 25
	(not (exists (state 25 ?n ?d)))                    ; Check if there is no existing state with q=25
	=>
	(assert (state 25 ?n ?d))                          ; If conditions are met, asserting a new state with q=25
	(assert (path $?begin [ ?q ?n ?d ] [ 25 ?n ?d ]))) ; Updating the path

; Rule op2: If n is less than 10 and there is no state with n=10, then assert a new state with n=10 and update the path
(defrule op2
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (< ?n 10))                                   ; Check if ?n is less than 10
	(not (exists (state ?q 10 ?d)))                    ; Check if there is no existing state with n=10 
	=>
	(assert (state ?q 10 ?d))                          ; If conditions are met, asserting a new state with n=10
	(assert (path $?begin [ ?q ?n ?d ] [ ?q 10 ?d ]))) ; Updating the path
	
; Rule op3: If d is less than 5 and there is no state with d=5, then assert a new state with d=5 and update the path
(defrule op3
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (< ?d 5))                                    ; Check if ?d is less than 5
	(not (exists (state ?q ?n 5)))                     ; Check if there is no existing state with d=5
	=>
	(assert (state ?q ?n 5))                           ; If conditions are met, asserting a new state with d=5
	(assert (path $?begin [ ?q ?n ?d ] [ ?q ?n 5 ])))  ; Updating the path

; Rule op4: If the sum of q, n, and d is less than or equal to 65 and there is no state with q increased by 25, 
; then assert a new state with q increased by 25 and update the path

(defrule op4
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d] 
	(test (<= (+ (+ ?q ?n) ?d) 65))                    ; Check if the sum of ?q, ?n, and ?d is less than or equal to 65
	(not (exists (state =(+ ?q 25) ?n ?d)))            ; Check if there is no existing state with q increased by 25
	=>
	(assert (state =(+ ?q 25) ?n ?d))                  ; If conditions are met, assert a new state with q increased by 25
	(assert (path $?begin [ ?q ?n ?d ] [ =(+ ?q 25) ?n ?d ])))  ; Asserting a new path which is the old path followed by the new state where q is increased by 25

;If q is 50, n is less than 10, the sum of q, n, and d is less than or equal to 65, and there is no state with n increased by 10, 
; then assert a new state with n increased by 10 and update the path
(defrule op5
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (= ?q 50))                                   ; Check if ?q is equal to 50
	(test (< ?n 10))                                   ; Check if ?n is less than 10
	(test (<= (+ (+ ?q ?n) ?d) 65))                    ; Check if the sum of ?q, ?n, and ?d is less than or equal to 65
	(not (exists (state ?q =(+ ?n 10) ?d)))            ; Check if there is no existing state with n increased by 10
	=>
	(assert (state ?q =(+ ?n 10) ?d))                  ; If conditions are met, assert a new state with n increased by 10
	(assert (path $?begin [ ?q ?n ?d ] [ ?q =(+ ?n 10) ?d ]))) ; Updating the path

;If q is 50, d is less than 5, the sum of q, n, and d is less than or equal to 65, and there is no state with z increased by 5, 
; then assert a new state with z increased by 5 and update the path
(defrule op6
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (= ?q 50))                                   ; Check if ?q is equal to 50
	(test (< ?d 5))                                    ; Check if ?z is less than 5
	(test (<= (+ (+ ?q ?n) ?d) 65))                    ; Check if the sum of ?q, ?n, and ?d is less than or equal to 65
	(not (exists (state ?q ?n =(+ ?d 5))))             ; Check if there is no existing state with d increased by 5
	=>
	(assert (state ?q ?n =(+ ?d 5)))                   ; Assert a new state fact where d is increased by 5
	(assert (path $?begin [ ?q ?n ?d ] [ ?q ?n =(+ ?d 5) ]))) ;Asserting new path which is the old path followed by the new state where d is increased by 5
	
	
;If the sum of q and n is 60, the sum of q, n, and d is less than 65, and there is no state with d increased by 5, 
; they assert a new state with d increased by 5 and update the path
(defrule op7
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (= (+ ?q ?n) 60))                            ; Check if the sum of ?q and ?n is equal to 60
	(test (< (+ (+ ?q ?n) ?d) 65))                     ; Check if the sum of ?q, ?n, and ?d is less than 65
	(not (exists (state ?q ?n =(+ ?d 5))))             ; Check if there is no existing state with d increased by 5
	=>
	(assert (state ?q ?n =(+ ?d 5)))                   ; If conditions are met, assert a new state with d increased by 5
	(assert (path $?begin [ ?q ?n ?d ] [ ?q ?n =(+ ?d 5) ]))) ; Asserting new path which is the old path followed by the new state where d is increased by 5


;If the sum of q and n is 55, the sum of q, n, and d is less than 65, and there is no state with n increased by 10,
;  then assert a new state with n increased by 10 and update the path
(defrule op8
	(path $?begin [ ?q ?n ?d ])                        ; Match any path ending in [?q ?n ?d]
	(test (= (+ ?q ?d) 55))                            ; Check if the sum of ?q and ?d is equal to 55
	(test (< (+ (+ ?q ?n) ?d) 65))                     ; Check if the sum of ?q, ?n, and ?d is less than 65
	(not (exists (state ?q =(+ ?n 10) ?d )))           ; Check if there is no existing state with n increased by 10
	=>
	(assert (state ?q =(+ ?n 10) ?d ))                 ; Assert a new state fact where n is increased by 10
	(assert (path $?begin [ ?q ?n ?d ] [ ?q =(+ ?n 10) ?d ])))  ; Asserting new path which is the old path followed by the new state where n is increased by 10
	
; Printing the solution
(defrule print-solution
	(path [ 0 0 0 ] $?middle [ 50 ?n ?d ])             ; Match any path starting from [0 0 0] and ending in [50 ?n ?d]
	=>
	(bind $?solution (create$ [ 0 0 0 ] $?middle [ 50 ?n ?d ])) ; Create a list of states from the initial state to the final state
	(printout t "Solution: " $?solution crlf))                  ; Print the solution 