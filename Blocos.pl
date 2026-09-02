bloco(a).
bloco(b).
bloco(c).

estado_inicial([
	sobre(b,a),
	mesa(a),
	mesa(c)
]).
%
% b
% a  c
%-------


%B maiusculo é variavel, b minusculo é predicado(função)
livre(Bloco, Estado) :- 
    bloco(Bloco),
    /*\+ negação, member() é uma regra do prolog está procurando 
     * essa informormção dentro da lista de estados _ tanto faz, bloco;
     * não importa a primeira afirmação ou seja quem está sobre o a*/
  \+ member(sobre(_,Bloco), Estado).

na_mesa(Bloco, Estado) :-
    member(mesa(Bloco), Estado).

mover(Bloco, Origem, Destino, EstadoAtual, NovoEstado) :-
    member(sobre(Bloco , Origem), EstadoAtual) ,
    livre(Bloco, EstadoAtual) ,
    livre(Destino, EstadoAtual) ,
    /*Select() Retorna todas os valores q não são aquela coisa*/
    select(
        sobre(Bloco,Origem),% O que eu to procurando
        EstadoAtual,		% Onde eu to procurando
        EstadoSemBloco		% Onde eu armazeno a busca
        ) ,
    NovoEstado = [
		sobre(Bloco,Destino) 
		| EstadoSemBloco % Concatenação de listas
                 ].

mover_da_mesa(Bloco,Destino,EstadoAtual,NovoEstado) :-
    member(mesa(Bloco),EstadoAtual),
    livre(Bloco, EstadoAtual),
    livre(Destino, EstadoAtual),
    select(
        mesa(Bloco),
        EstadoAtual,
        EstadoSemBloco
        ),
    
    NovoEstado= [
                sobre(Bloco,Destino)
         |EstadoSemBloco
    ].


mover_para_mesa(Bloco,Destino,EstadoAtual,NovoEstado) :-
    member(sobre(Bloco,Origem), EstadoAtual) ,
    livre(Bloco,EstadoAtual),
    select(
        sobre(Bloco,Origem),
        EstadoAtual,
        EstadoSemBloco
        ),
    	NovoEstado = [
			mesa(Bloco)
			| EstadoSemBloco
		].
%acao_possivel(Ação,,EstadoAtual,NovoEstado)

acao_possivel(mover(B,A,C),EstadoAtual,NovoEstado):-
    mover(B,A,C,EstadoAtual,NovoEstado).
acao_possivel(mover_da_mesa(B,C), EstadoAtual, NovoEstado) :-
    mover_da_mesa(B,C, EstadoAtual,NovoEstado).
acao_possivel(mover_para_mesa(B,A), EstadoAtual, NovoEstado) :-
    mover_para_mesa(B,A, EstadoAtual,NovoEstado).

executar([], Estado , Estado).

executar([Acao | Resto], EstadoAtual, EstadoFinal) :-
    acao_possivel(Acao,EstadoAtual,EstadoFinal),
    executar(Resto,EstadoAtual,EstadoFinal),
    

    

    