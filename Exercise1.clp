; CLIPS Exercise 1
; Student Name: Dhrishya Menon
; Purpose : Find the routing Table of the following network:
; 			There is a directional link from A to B
; 			There is a directional link from B to C
; 			...

; the fact-base
(deffacts the-given-paths
	(path A B)
	(path B C)
	(path B D)
	(path D E)
	(path E F))
	
; the knowledge-base
(defrule infer-indirect-paths
	(path ?begin ?temp)
	(path ?temp ?end)
	=> 
	(assert (path ?begin ?end)))
	
(defrule print-paths
	(path ?begin ?end)  ;begin and end are local variables can be named differently
	=>
	(printout t "There is a path from " ?begin " to " ?end crlf))
	
; reset needs to be input in the IDE for the the-given-paths to be loaded into the fact base/IDE