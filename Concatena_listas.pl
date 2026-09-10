%caso base concatena([],L,L).//condição de parada

concatena([],L,L).
concatena([H|T1],L,[H|T2]):-
    concatena(T1,L,T2).

% ?- concatena([1, 2], [3, 4], Resultado).
%
% --- ITERAÇÃO 1 ---
% [H|T1] = [1, 2]  -> H = 1, T1 = [2]
% L      = [3, 4]
% Regra: [H|T2]   -> Resultado = [1 | T2]
% Chamada: concatena([2], [3, 4], T2)
%
% --- ITERAÇÃO 2 ---
% [H|T1] = [2]     -> H = 2, T1 = []
% L      = [3, 4]
% Regra: [H|T2']  -> T2 = [2 | T2']
% Chamada: concatena([], [3, 4], T2')
%
% --- ITERAÇÃO 3 (Caso Base) ---
% Primeira lista é [] -> casa com concatena([], L, L)
% L = [3, 4]
% Retorno: T2' = [3, 4]
%
% --- DESEMPILHANDO (Reconstrução) ---
% Em T2:        [2 | [3, 4]]     -> T2 = [2, 3, 4]
% Em Resultado: [1 | [2, 3, 4]]  -> Resultado = [1, 2, 3, 4]