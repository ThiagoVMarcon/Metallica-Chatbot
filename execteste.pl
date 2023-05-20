imp :- write("Escreva sua mensagem(nao esqueca de abrir e fechar aspas) "),read(X), read_split(X). % pega imput do usuario

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

translate("ola", "tchau"):-!.
translate("bem", "mal"):-!.
translate(X, X). % catch-all clause for all words not to be translated

process_Pattern(["what","is","your","name"|_], ["Hey","my","name","is","Robert","I'm","a","chatbot","that","really","loves","Metalica!"]).
process_Pattern(["What","is","your","favorite","album"|_],["idk","lol"]).
process_Pattern(["What","is","your","favorite","album?"|_],["idk","lol"]).
process_Pattern([_|Resto],Y) :- process_Pattern(Resto,Y).
process_Pattern([],["Sorry","couldn't","quite","catch","you","man"]).

read_split("stop") :- !.
read_split(X) :- remover_caracteres_especiais(X, Outs),split_string(Outs, "\s", "\s", Out),temp(Out), imp. % transforma o input em uma lista de palavras separadas por espaços

temp(X) :- process_Pattern(X,Y),adicionar_espaco(Y,Z),atomics_to_string(Z, O), write(O),write("\n").

teste :- write("pao").

testers :- split_string(" computer consists of hardware ", "\s", "\s", L), flatten(L,L2),write(L2).


