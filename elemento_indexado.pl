%caso base, indice 0.
indice([0,[H|_],H).
indice(N, [_|T], Elemento) :-
    N > 0,
    N1 is N - 1,
    indice(N1, T, Elemento).

       
% ?- indice(2, [a, b, c, d], Resultado).
%
% --- ITERAÇÃO 1 ---
% Consulta: indice(2, [a, b, c, d], Resultado)
% Testa Caso Base indice(0, ...): FALHOU (N = 2, que é diferente de 0)
% Entra na Regra:
%   N = 2 (N > 0)
%   N1 is 2 - 1 -> N1 = 1
%   _ = a (descartado)
%   T = [b, c, d]
% Chamada: indice(1, [b, c, d], Resultado)
%
% --- ITERAÇÃO 2 ---
% Consulta: indice(1, [b, c, d], Resultado)
% Testa Caso Base indice(0, ...): FALHOU (N = 1, que é diferente de 0)
% Entra na Regra:
%   N = 1 (N > 0)
%   N1 is 1 - 1 -> N1 = 0
%   _ = b (descartado)
%   T = [c, d]
% Chamada: indice(0, [c, d], Resultado)
%
% --- ITERAÇÃO 3 (Caso Base: N = 0) ---
% Consulta: indice(0, [c, d], Resultado)
% Testa Caso Base indice(0, [H|_], H): DEU MATCH!
%   H = c
%   Resultado = c
%
% --- DESEMPILHANDO (Retorno) ---
% Retorno final retornado pela consulta: Resultado = c       