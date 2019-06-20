start :- 
	read_line_to_codes(current_input, Codes), split_string(Codes, " ", ".?", S), output(S).
	
output(S) :- 
	endchat(S) -> write("done")
	;
	nth0(4, S, Five) -> nth0(0, S, One), nth0(1, S, Two), nth0(2, S, Three), nth0(3, S, Four), nth0(4, S, Five),
	rule2(One, Two, Three, Four, Five)
	;
	nth0(3, S, Four) -> nth0(0, S, One), nth0(1, S, Two), nth0(2, S, Three), nth0(3, S, Four),
	rule1(One, Two, Three, Four).
		
rule1(One, Two, Three, Four) :- 
	One == "Is" -> atom_string(X, Four), Term =.. [X, Two], check(Term)
	;
	atom_string(X, Four),
	Term =.. [X, One], 
	assert(Term), write("ok"), nl, start.

rule2(One, Two, Three, Four, Five) :-
	atom_string(X, Two), 
	atom_string(Y, Five),
	Term1 =.. [X, Z], 
	Term2 =.. [Y, Z], 
	Term3 = (Term2 :- Term1),
	assertz(Term3), write("ok"), nl, start.
	
check(Term) :- 
	catch((S = success, Term), C, F = error(C)),
	S == success -> write("yes"), nl, start
	;
	write("unknown"), nl, start.
	
endchat(S) :-
	nth0(0, S, One),
	One == "stop".

	