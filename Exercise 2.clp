; CLIPS Exercise 2
; There is a directional link from A to B
; There is a directional link from B to C
; There is a directional link from B to D
; There is a directional link from D to E
; There is a directional link from E to F

; Please find and display its Routing table using Ordered facts

; Fact base

(deffacts direct-paths
	(path A B)
	(path B C)
	(path B D)
	(path D E)
	(path E F))
	
; Knowledge base
(defrule infer-indirect-path
	(path $?begin ?temp)
	(path ?temp $?end)
	=>
	(assert (path ?begin ?temp ?end)))

(defrule print-paths
		(path $?nodes)
		=>
		(printout t "Path: " $?nodes crlf))
		
