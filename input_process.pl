:- use_module(library(strings)).
:- use_module(library(random)).
:- [db].

imp :- write("User: "),read_line_to_codes(user_input, Ascii_imp),string_codes(X, Ascii_imp), read_split(X). % pega imput do usuario

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

compare_album(X,Y) :- album(_,Y,_,_,_),split_string(Y, "\s", "\s", [Yn|_]) ,string_lower(Yn, Y2), Y2 == X.

compare_music2(X,Y) :- music(_,Y,_,_,_),split_string(Y, "\s", "\s", [_, Yn|_]) ,string_lower(Yn, Y2), Y2 == X.
compare_music(X,Y) :- music(_,Y,_,_,_),split_string(Y, "\s", "\s", [Yn|_]) ,string_lower(Yn, Y2), Y2 == X.

caracter_especial('.').
caracter_especial(',').
caracter_especial('!').
caracter_especial('?').
caracter_especial(';').
caracter_especial(':').

remover_caracter_especial([], []).
remover_caracter_especial([X|Resto], NovoResto) :-
    caracter_especial(X),
    remover_caracter_especial(Resto, NovoResto).
remover_caracter_especial([X|Resto], [X|NovoResto]) :-
    \+ caracter_especial(X),
    remover_caracter_especial(Resto, NovoResto).

remover_caracteres_especiais(Imps, Outs) :-
    string_chars(Imps, Listachar),
    remover_caracter_especial(Listachar, Listachar_2),
    string_chars(Outs, Listachar_2).

adicionar_espaco([], []).
adicionar_espaco([X|Resto], [X2|NovoResto]) :-
    string_concat(X, " ", X2),
    adicionar_espaco(Resto, NovoResto).

process_Words([], []).
process_Words([H|T], [H2|T2]) :-
    translate(H, H2),
    process_Words(T, T2).


read_split("stop") :- !.
read_split(X) :- remover_caracteres_especiais(X, Outs), string_lower(Outs, OutsL),split_string(OutsL, "\s", "\s", Out),temp(Out), imp. % transforma o input em uma lista de palavras separadas por espaços

temp(X) :- process_pattern(X,Y),adicionar_espaco(Y,Z),atomics_to_string(Z, O), write(O),write("\n").

translate(X, X). % catch-all clause for all words not to be translated


