somaLista([],0).
somaLista([Head|Tail], Soma):-
    somaLista(Tail, SomaTail),
    Soma is Head + SomaTail.