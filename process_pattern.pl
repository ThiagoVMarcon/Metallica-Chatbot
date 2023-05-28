:- [facts].
:- use_module(library(strings)).
:- use_module(library(random)).

% AUXILIAR FUNCTIONS

compare_artist(X, Y) :- artist(Y, _, _), split_string(Y, "\s", "\s", [Yn|_]), string_lower(Yn, Y2), Y2 == X.

compare_album(X, Y) :- album(_, Y, _, _, _), split_string(Y, "\s", "\s", [Yn|_]), string_lower(Yn, Y2), Y2 == X.

compare_music(X, Y) :- music(_, Y, _, _, _),split_string(Y, "\s", "\s", [Yn|_]) ,string_lower(Yn, Y2), Y2 == X.

compare_music2(X, Y) :- music(_, Y, _, _, _),split_string(Y, "\s", "\s", [_, Yn|_]) ,string_lower(Yn, Y2), Y2 == X.

get_age(X,A) :- artist(X, A, _).
get_function(X,A) :- artist(X, _, A).

temp(Out, Num, Memory, Outers) :- process_pattern(Out, Num, Memory, Outers).
temp(X) :- process_pattern(X, Y), is_composed_response(Y, Y2), add_space(Y2, Z), atomics_to_string(Z, O), write("Cliff: "), write(O), write("\n").

is_greeting(X) :- greeting(X).
greeting("hello").
greeting("hi").
greeting("hey").
greeting("heya").
greeting("sup").

is_same_name_of_album(X) :- album_name(X).
album_name("ride").
album_name("master").
album_name("and").
album_name("st").
album_name("hardwired").
album_name("72").

is_composed_response([X, "is pretty cool! Have you ever heard of", Y], R) :- write("Cliff: "), add_space([X, "is pretty cool! Have you ever heard of", Y], Z), atomics_to_string(Z, O), write(O), write("\n"), write("User: "), read_line_to_codes(user_input, Ascii_imp), string_codes(Sla, Ascii_imp), read_split(Sla, 1, Y, R).
is_composed_response(["My name is Cliff, I'm a chatbot that really loves Metallica! How about you, what's your name?"], R) :- write("Cliff: "), add_space(["My name is Cliff, I'm a chatbot that really loves Metallica! How about you, what's your name?"],Z),atomics_to_string(Z, O), write(O),write("\n"), write("User: "),read_line_to_codes(user_input, Ascii_imp),string_codes(Sla, Ascii_imp), read_split(Sla, 2, [], R).
is_composed_response(["I'm doing good, how about you?"], R) :- write("Cliff: "), add_space(["I'm doing good, how about you?"],Z),atomics_to_string(Z, O), write(O),write("\n"), write("User: "),read_line_to_codes(user_input, Ascii_imp),string_codes(Sla, Ascii_imp), read_split(Sla, 3, [], R).
is_composed_response(X,X).

responses(1, X, [X, "is pretty cool! Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(3,8,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(2, X, [X, "is nice! Have you ever heard of", Y]) :- random_between(1,5,R1),random_between(3,8,R2),album(R1,A,_,_,_),music(R2,Y,A,_,_).
responses(3, X, [X, "is great! My favorite song from the album is", Y]) :- random_between(1,8,R), music(R,Y,X,_,_).
responses(4, X, [X, "is good... I would rather listen to", Y, "though."]) :- random_between(1,8,R), album(R,Y,_,_,_).

% PROCESS PATTERNS

process_pattern(["yes"|_], 1, X, ["Cool! I really love", X]).
process_pattern(["no"|_], 1, _, ["You should try it out! It's really good I swear!"]).
process_pattern([X], 2, _ ,["Nice to meet you", X]).
process_pattern(X,_,_,Y) :- process_pattern(X,Y).
process_pattern([X], ["Hey!"]) :- is_greeting(X).
process_pattern(["are","you","called","cliff"], ["Yep!"]).
process_pattern(["is","your","name","cliff"], ["Yes! My name is Cliff, named after Cliff Burton."]).
process_pattern([X, "cliff"],["Hey there!"]) :- is_greeting(X).
process_pattern(["my", "name", "is", X],["Hey", X, "I'm Cliff!"]).
process_pattern(["i'm", X, "what","is","your","name"|_],["Hey", X, "my name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i'm","called", X, "what","is","your","name"|_],["Hey", X, "my name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i","am", X, "what","is","your","name"|_],["Hey", X, "my name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["i","am","called",X, "what","is","your","name"|_],["Hey", X, "my name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_pattern(["how", "are", "you"], ["I'm doing good, how about you?"]).
process_pattern(["are", "you", "good"], ["I'm doing well, and you?"]).
process_pattern(["i", "am", "feeling", "good"], ["Good to hear!"]).
process_pattern(["i", "am", "feeling", "bad"], ["Hope things get better!"]).
process_pattern(["good"], ["Good to hear!"]).
process_pattern(["bad"], ["Hope things get better!"]).
process_pattern(["i", "am", "doing", "well"], ["That's nice!"]).
process_pattern(["i", "am", "doing", "badly"], ["Get better, dude!"]).
process_pattern(["the", "song"], ["It is a nice song!"]).
process_pattern(["the", "album"], ["It is a great album!"]).
process_pattern(["like", X|_],["Do you mean the album or the song? Either case I think they are both pretty great!"]) :- is_same_name_of_album(X).
process_pattern(["like", "the", X|_],Y) :- compare_music2(X,X2),random_between(1,2,R), responses(R, X2, Y).
process_pattern(["like", X|_],Y) :- compare_music(X,X2),random_between(1,2,R), responses(R, X2, Y).
process_pattern(["like", X|_],Y) :- compare_album(X,X2),random_between(3,4,R), responses(R, X2, Y).
process_pattern(["what","is","your","name"|_], ["My name is Cliff, I'm a chatbot that really loves Metallica! How about you, what's your name?"]).
process_pattern(["what","year",_,"metallica"|_], ["Metallica was created in 1981, in Los Angeles."]).
process_pattern(["what","year",_,"the","band"|_], ["Metallica was formed in 1981, in Los Angeles."]).
process_pattern(["what","is","your","favorite","album"|_],["My favorite album is Master of Puppets but I really like", X, "too!"]) :- random_between(1,2,A), album(A,X,_,_,_). % albus favoritos
process_pattern(["what","is","your","favorite", "music"|_], ["My favorite music is Fade to Black but I really like", X , "aswell."]) :- random_between(1,5,R1),random_between(1,7,R2),album(R1,A,_,_,_),music(R2,X,A,_,_).
process_pattern(["how","many", "albums"|_], ["Metallica has released a total of 11 studio albums."]). % quantos albuns
process_pattern(["what","year","is",X|_], [Y,"is","from",Z]) :- compare_album(X,Y), album(_,Y,_,Z,_).% ano de lançamentos do album
process_pattern(["who","is", "the", "vocalist"|_], ["James Hetfield is the current and only vocalist that Metallica has ever had."]). 
process_pattern(["who","is", "the", "drummer"|_], ["Lars Ulrich is the current and only drummer that Metallica has ever had."]).
process_pattern(["who","is", "the", "bassist"|_], ["Robert Trujillo is the current bassist of Metallica."]).
process_pattern(["who","is", "the", "guitarist"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]). 
process_pattern(["who","are", "the", "guitarists"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]).
process_pattern(["who","is",X|_], [Y, "is the", A, "of Metallica."]) :- compare_artist(X,Y), get_function(Y,A).  
process_pattern(["age","of",X|_], [Y, "is", A, "years old."]) :- compare_artist(X,Y), get_age(Y,A).  
process_pattern(["instrumental","songs"|_],  ["Metallica has five instrumental songs. (Anesthesia) - Pulling Teeth, The Call of Ktulu, Orion, To Live Is To Die and Suicide & Redemption."]). 
process_pattern(["what","is","the","length","of",X|_],[X2, "has a total length of", Y, "minutes."]) :- compare_album(X,X2), album(_, X2, _, _, Y).
process_pattern(["what","is","the","size","of",X|_],[X2, "has a total size of", Y, "minutes."]) :- compare_music(X, X2), music(_, X2, _, _, Y).
process_pattern(["what","is","the","year","that",X|_],[X2, "was released in", Y]) :- compare_album(X,X2), album(_, X2, _, Y, _). 
process_pattern(["what","year","was", X|_],[X2, "was released in", Y]) :- compare_album(X,X2), album(_, X2, _, Y, _).
process_pattern(["who","are","the","composers","of",X|_],[Y, "composed this song."]) :- compare_music(X, X2), music(_, X2, _, Y, _).
process_pattern(["what","is","the","shortest","album"|_],["It","is","Ride The Lightning","which","has","Trapped Under Eyes","as","its","shortest","song!"]). 
process_pattern(["what","is","the","shortest","music"|_],["It","is","Motorbreath","which","is","the","third","song","from","Metallicas", "first","album!"]). 
process_pattern(["what","is","the","longest", "music"|_],["It","is","Inamorata","which","is","the","final","song","from","Metallicas", "latest","album!"]).
process_pattern(["what","is","the","shortest","song"|_],["It","is","Motorbreath","which","is","the","third","song","from","Metallicas", "first","album!"]). 
process_pattern(["what","is","the","longest", "song"|_],["It","is","Inamorata","which","is","the","final","song","from","Metallicas", "latest","album!"]).
process_pattern(["what","is","the","longest","album"|_],["It","is","Load","which","has","The Outlaw Torn","as","its","longest","song!"]). 
process_pattern(["what","is","the","longest","album"|_],["It","is","Load","which","has","The Outlaw Torn","as","its","longest","song!"]). 
process_pattern(["what","do","you","think","about","metallica","after","black"|_],["Metallica created a whole genre of music, Thrash Metal, and then walked away from it in 1990 because of greed. Some people say to me get over it  and blah blah blah but music to me is after family and friends. I loath anyone who turns their back on a legion of fans and a genre of music and walk away because of greed. They were not poor when they released the black album, they were just greedy. Sad."]).
process_pattern([], ["Sorry","couldn't","quite","catch","you","man!"]).
process_pattern([_|Resto], Y) :- process_pattern(Resto, Y).

