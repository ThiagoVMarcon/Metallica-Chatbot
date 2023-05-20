imp :- write("Escreva sua mensagem(nao esqueca de abrir e fechar aspas) "),read(X), read_split(X). % pega input do usuario

adicionar_espaco([], []).     % funcao para adicionar espaços em branco no output
adicionar_espaco([X|Resto], [NovoX|NovoResto]) :-
    string_concat(X, " ", NovoX),
    adicionar_espaco(Resto, NovoResto).

process_Words([], []).  % processamento de palavras, muda uma palavra pre-definida por outra
process_Words([H|T], [H2|T2]) :-
    translate(H, H2),
    process_Words(T, T2).

translate("ola", "tchau"):-!.
translate("bem", "mal"):-!.
translate(X, X). % catch-all clause for all words not to be translated % padroes de mudança

process_Pattern([],[]). % in work
process_Pattern() 

read_split("stop") :- !. 
read_split(X) :- split_string(X, "\s", "\s", Out),temp(Out), imp. % transforma o input em uma lista de palavras separadas por espaços

temp(X) :- process_Words(X,Y),adicionar_espaco(Y,Z),atomics_to_string(Z, O), write(O),write("\n"). % faz o output, a funcao atomics_to_string transforma uma lista de strings em uma string



