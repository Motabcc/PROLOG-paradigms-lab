%caso base/condição de parada.
ultimo([X],X).
ultimo([_|T],ULTIMO):-
    ultimo(T,ULTIMO).

% ?- ultimo([10, 20, 30], Resultado).
% --- ITERAÇÃO 1 ---
% Lista de entrada: [10, 20, 30]
% Testa Caso Base [X]: FALHOU (lista tem 3 elementos, precisa ter 1)
% Entra no Caso Recursivo [_|T]:
%   _ = 10 (cabeça descartada)
%   T = [20, 30]
% Chamada: ultimo([20, 30], Resultado)
%
% --- ITERAÇÃO 2 ---
% Lista de entrada: [20, 30]
% Testa Caso Base [X]: FALHOU (lista tem 2 elementos, precisa ter 1)
% Entra no Caso Recursivo [_|T]:
%   _ = 20 (cabeça descartada)
%   T = [30]
% Chamada: ultimo([30], Resultado)
%
% --- ITERAÇÃO 3 (Caso Base) ---
% Lista de entrada: [30]
% Testa Caso Base [X]: DEU MATCH!
%   X = 30
% Retorno direto: Resultado = 30
%
% --- DESEMPILHANDO (Retorno da Recursão) ---
% A Iteração 2 recebe Resultado = 30 e repassa para cima
% A Iteração 1 recebe Resultado = 30 e repassa para cima
% Resultado final retornado pela consulta: Resultado = 30

