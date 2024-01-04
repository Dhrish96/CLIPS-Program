; Given the follow family tree:
; Albert is the father of Tony and Andy
; Tony is the father of Allen and Newman
; Andy is the father of Mendy and Nancy
;Please find and display all cousins of dynamically entered name.


	
;the fact base
(deffacts the-family-tree
	(fatherof Albert Tony)
	(fatherof Albert Andy)
	(fatherof Tony Allen)
	(fatherof Tony Newman)
	(fatherof Andy Mendy)
	(fatherof Andy Nancy))

;the knowledge base
(defrule get-name
	=>
	(printout t "Please enter a name: ")
	(assert (name (read))))
	
(defrule find-cousins
	(name ?username)
	(fatherof ?papa ?username)
	(fatherof ?grandpa ?papa)
	(fatherof ?grandpa ?uncle&~?papa)
	(fatherof ?uncle ?cousin)
	=>
	(printout t ?cousin " is a cousin of "?username crlf))