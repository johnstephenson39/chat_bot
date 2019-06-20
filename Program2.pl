keyword("This is").
family("mother's").
family("mom's").
family("mother").
family("mom").
family("father's").
family("dad's").
family("father").
family("dad").
family("sister's").
family("sister").
family("brother's").
family("brother").
question("Why").
question("What").
question("When").
question("Where").
question("How").

start :-
	write("What is your problem?"), nl, getinput.
	
getinput :-
	read_line_to_codes(current_input, Codes), split_string(Codes, " ", ".?", S), psychiatrist(S).

psychiatrist(S) :- 	
	endchat(S) -> write("done")
	;
	nth0(4, S, Five) -> nth0(0, S, One), nth0(1, S, Two), nth0(2, S, Three), nth0(3, S, Four), nth0(4, S, Five),
	rule5(One, Two, Three, Four, Five)
	;
	nth0(3, S, Four) -> nth0(0, S, One), nth0(1, S, Two), nth0(2, S, Three), nth0(3, S, Four),
	rule4(One, Two, Three, Four)
	;
	nth0(2, S, Three) -> nth0(0, S, One), nth0(1, S, Two), nth0(2, S, Three),
	rule3(One, Two, Three)
	;
	nth0(1, S, Two) -> nth0(0, S, One), nth0(1, S, Two),
	rule2(One, Two)
	;
	nth0(0, S, One) -> nth0(0, S, One),
	rule1(One).
	
rule5(One, Two, Three, Four, Five) :- 

	atomics_to_string([One, Two]," ", X),
	Term1 =.. [keyword, X], 
	catch((S = success, Term1), C, F = error(C)),
	S == success -> atomics_to_string([Three, Four, Five]," ", Y), write("What else do you regard as "), write(Y), write("?"), nl, getinput
	;
	
	Term2 =.. [family, One], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Two], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Three], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Four], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Five], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	
	Term3 =.. [question, One], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(One), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Two], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Two), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Three], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Three), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Four], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Four), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Five], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Five), write(" should you "), write("what?"), nl, getinput
	;
	
	write("I see. Please continue."), nl, getinput.
	
rule4(One, Two, Three, Four) :- 

	atomics_to_string([One, Two]," ", X),
	Term1 =.. [keyword, X], 
	catch((S = success, Term1), C, F = error(C)),
	S == success -> atomics_to_string([Three, Four]," ", Y), write("What else do you regard as "), write(Y), write("?"), nl, getinput
	;
	
	Term2 =.. [family, One], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Two], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Three], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Four], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	
	Term3 =.. [question, One], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(One), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Two], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Two), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Three], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Three), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Four], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Four), write(" should you "), write("what?"), nl, getinput
	;
	
	write("I see. Please continue."), nl, getinput.
	
rule3(One, Two, Three) :-

	atomics_to_string([One, Two]," ", X),
	Term1 =.. [keyword, X], 
	catch((S = success, Term1), C, F = error(C)),
	S == success -> atomics_to_string([Three]," ", Y), write("What else do you regard as "), write(Y), write("?"), nl, getinput
	;
	
	Term2 =.. [family, One], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Two], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Three], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	
	Term3 =.. [question, One], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(One), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Two], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Two), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Three], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Three), write(" should you "), write("what?"), nl, getinput
	;
	
	write("I see. Please continue."), nl, getinput.
	
rule2(One, Two) :-
	
	Term2 =.. [family, One], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	Term2 =.. [family, Two], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	
	Term3 =.. [question, One], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(One), write(" should you "), write("what?"), nl, getinput
	;
	Term3 =.. [question, Two], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(Two), write(" should you "), write("what?"), nl, getinput
	;
	
	write("I see. Please continue."), nl, getinput.
	
rule1(One) :-

	Term2 =.. [family, One], 
	catch((S = success, Term2), C, F = error(C)),
	S == success -> write("Tell me more about your family."), nl, getinput
	;
	
	Term3 =.. [question, One], 
	catch((S = success, Term3), C, F = error(C)),
	S == success -> write(One), write(" should you "), write("what?"), nl, getinput
	;
	
	write("I see. Please continue."), nl, getinput.
	
endchat(S) :-
	nth0(0, S, One),
	One == "stop".