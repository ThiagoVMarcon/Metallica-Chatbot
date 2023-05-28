:- [process_pattern].
:- use_module(library(strings)).
:- use_module(library(random)).
:- initialization(imp).

title_case(String, TitleCase) :-
    atomic_list_concat(Words, ' ', String),
    maplist(title_case_word, Words, TitleCaseWords),
    atomic_list_concat(TitleCaseWords, ' ', TitleCase).

title_case_word(Word, TitleCaseWord) :-
    atom_chars(Word, [FirstChar | RestChars]),
    char_type(FirstChar, to_lower(FirstLower)),
    char_type(FirstUpper, to_upper(FirstLower)),
    atom_chars(TitleCaseWord, [FirstUpper | RestChars]).

compare_strings_ignore_case(String1, String2, Result) :-
    string_lower(String1, LowercaseString1),
    string_lower(String2, LowercaseString2),
    string_compare(LowercaseString1, LowercaseString2, Result).

especial_caracter('.').
especial_caracter(',').
especial_caracter('!').
especial_caracter('?').
especial_caracter(';').
especial_caracter(':').

remove_especial_caracter([], []).
remove_especial_caracter([X|Resto], NovoResto) :-
    especial_caracter(X),
    remove_especial_caracter(Resto, NovoResto).
remove_especial_caracter([X|Resto], [X|NovoResto]) :-
    \+ especial_caracter(X),
    remove_especial_caracter(Resto, NovoResto).

remove_especial_caracters(Imps, Outs) :-
    string_chars(Imps, Listachar),
    remove_especial_caracter(Listachar, Listachar_2),
    string_chars(Outs, Listachar_2).

add_space([], []).
add_space([X|Resto], [X2|NovoResto]) :-
    string_concat(X, " ", X2),
    add_space(Resto, NovoResto).

process_words([], []).
process_words([H|T], [H2|T2]) :-
    translate(H, H2),
    process_words(T, T2).

translate(X, X).

throw_away_rest_besides_last([X], X).
throw_away_rest_besides_last([_|X], R) :- throw_away_rest_besides_last(X, R).

read_split("stop") :- !.
read_split("bye") :- !.
read_split(X) :- remove_especial_caracters(X, Outs), string_lower(Outs, OutsL),split_string(OutsL, "\s", "\s", Out),temp(Out), imp. 
readsplit("stop",_,_,_) :- !.
readsplit("bye",_,_,_) :- !.
read_split(X, Num, Memory,Y) :- remove_especial_caracters(X, Outs), string_lower(Outs, OutsL),split_string(OutsL, "\s", "\s", Out),temp(Out, Num, Memory,Y). 

imp :- write("User: "),read_line_to_codes(user_input, Ascii_imp),string_codes(X, Ascii_imp), read_split(X). 

