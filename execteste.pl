:- [db].
:- use_module(library(random)).
:- use_module(library(strings)).

imp :- write("Write your message: "),read_line_to_codes(user_input, Ascii_imp),string_codes(X, Ascii_imp), read_split(X). % pega imput do usuario

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

compare_album([X|Resto1],[X|Resto2],). 
comapare_album(_,_) :- !

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

process_Pattern(["what","is","your","name"|_], ["My name is Cliff, I'm a chatbot that really loves Metallica!"]).
process_Pattern(["what","year",_,"metallica"|_], ["Metallica was created in 1981, in Los Angeles."]).
process_Pattern(["what","year",_,"the","band"|_], ["Metallica was formed in 1981, in Los Angeles."]).
process_Pattern(["what","is","your","favorite","album"|_],["My favorite album is Master of Puppets but I really like", X, "too"]) :- random_between(1,2,A), album(A,X,_,_,_). % albus favoritos
process_Pattern(["what","is","your","favorite", "music"|_], ["My favorite music is Fade to Black but I really like", X , "aswell"]) :- random_between(1,5,R1),random_between(1,7,R2),album(R1,A,_,_,_),music(R2,X,A,_,_).
process_Pattern(["how","many", "albums"|_], ["Metallica has released a total of 11 studio albums."]). % quantos albuns
%%%%% process_Pattern(["what","is", "the",  "albums"|_], ["Metallica has released a total of 11 studio albums."]). de qual ano é X album
% % % % process_Pattern(["what","year","is",X|_], [[X|Resto],"is","from",Y,"!"]) :- album(_,[A|Resto],_,Y,_).% ano de lançamentos do album
% % % % quem sao os membros atuais
process_Pattern(["who","is", "the", "vocalist"|_], ["James Hetfield is the current and only vocalist that Metallica has ever had."]). % vocalista
process_Pattern(["who","is", "the", "drummer"|_], ["Lars Ulrich is the current and only drummer that Metallica has ever had."]). % baterista
process_Pattern(["who","is", "the", "bassist"|_], ["Robert Trujillo is the current bassist of Metallica."]). % baixista
process_Pattern(["who","is", "the", "guitarist"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]). % guitar
process_Pattern(["who","are", "the", "guitarists"|_], ["Metallica has two guitarists, James Hetfield (rhythm) and Kirk Hammett (lead)."]). % guitar
% linha de bateria
% ||  || guitarra
% ||  || baixo
% vocalista  
% quem eh Dave Mustaine 
% oque voce acha dos ultimos albuns do metalica 
% opiniao sobre sobre todos os membro
% adicionar idades dos integrantes
% quais são todos os albuns
% tamanho de todos os albuns
% ano de todos os albuns
process_Pattern(["what","is","the","shortest","album"|_],["It","is","Ride The Lightning","which","has","Trapped Under Eyes","as","its","shortest","song"]). % album mais curto
process_Pattern(["what","is","the","shortest","music"|_],["It","is","Motorbreath","which","is","the","third","song","from","Metallicas", "first","album!"]). % musica mais curta
process_Pattern(["what","is","the","longest", "music"|_],["It","is","Inamorata","which","is","the","final","song","from","Metallicas", "latest","album!"]).% musicas mais longas
process_Pattern(["what","is","the","longest","album"|_],["It","is","Load","which","has","The Outlaw Torn","as","its","longest","song"]).% albuns mais longos
% musicas instrumentais
process_Pattern(["what","do","you","think","about","metallica", "after","black"|_],["Metallica created a whole genre of music, Thrash Metal, and then walked away from it in 1990 because of greed. Some ppl say to me get over it blah blah blah but music to me is after family and friends. I loath anyone who turns their back on a legion of fans and a genre of music and walk away because of greed. They were not poor when they released the black album, they were just greedy. Sad."]). % voce acha que o metalica se vendeu no black album, oque voce acha do black album

process_Pattern([_|Resto],Y) :- process_Pattern(Resto,Y).
process_Pattern([],["Sorry","couldn't","quite","catch","you","man"]).

read_split("stop") :- !.
read_split(X) :- remover_caracteres_especiais(X, Outs), string_lower(Outs, OutsL),split_string(OutsL, "\s", "\s", Out),temp(Out), imp. % transforma o input em uma lista de palavras separadas por espaços

temp(X) :- process_Pattern(X,Y),adicionar_espaco(Y,Z),atomics_to_string(Z, O), write(O),write("\n").

teste :- write("pao").

testers :- split_string(" computer consists of hardware ", "\s", "\s", L), flatten(L,L2),write(L2).

