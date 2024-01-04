; CLIPS Exercise 3

; The Given Family Tree:
; Albert is the father of Tony and Andy
; Tony is the father of Allen
; Tony is the father of Newman
; Andy is the father of Mendy
; Andy is the father of Nancy


; Please find tand display all cousins of Mendy by using ordered facts


; Fact base
(deffacts the-family-tree
	(father-of Albert Tony)
	(father-of Albert Andy)
	(father-of Tony Allen)
	(father-of Tony Newman)
	(father-of Andy Mendy)
	(father-of Andy Nancy))
	
; Knowledge base
(defrule find-cousins
		(father-of ?papa Mendy)
		(father-of ?grandpa ?papa)
		(father-of ?grandpa ?uncle&~?papa)
		(father-of ?uncle ?cousin)
		=>
		(printout t ?cousin " is a cousin of Mendy" crlf))
		
		
		
		