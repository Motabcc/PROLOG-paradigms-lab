%fatos
salas([a,b,c]).
horarios([d,e,f]).
cursos([g,h,i]).
professores([j,k,l]).

%criando um vinculo entre professor e curso
% ensina(Professor,Curso)
ensina(j,g).
ensina(k,h).
ensina(l,i).

%predicados
% Busca a lista de cursos e inicia a folha em branco (lista vazia: [])
alocar_todos_cursos(GradeFinal):-
    cursos(ListaCursos),
    alocar_recursivo(ListaCursos,[],GradeFinal).
%-------
%Caso Base Se a lista de cursos estiver vazia, o trabalho acabou.
alocar_recursivo([],GradeAcumulada,GradeAcumulada).

%Caso Recursivo Separa o "CursoAtual" do "RestoCursos"
alocar_recursivo([CursoAtual | RestoCursos], GradeAcumulada, GradeFinal) :-
    % Descobre quem é o professor do curso atual
    ensina(Professor,CursoAtual),
    % Testando opções O Prolog tenta o primeiro de cada lista
    salas(ListaSalas),       member(Sala, ListaSalas),
    horarios(ListaHorarios), member(Horario, ListaHorarios),

    % Pergunta de segurança: "\+" significa "NÃO pode acontecer"
    % Só avança se NÃO houver conflito com o que já foi anotado na GradeAcumulada
    \+ conflito(Professor, Sala, Horario, GradeAcumulada),
    
    % Se não houve conflito, anota a aula na folha e repete para o RestoCursos
    alocar_recursivo(RestoCursos, [aula(CursoAtual, Professor, Sala, Horario) | GradeAcumulada], GradeFinal).

%Essa SALA já está sendo usada nesse HORÁRIO por alguma aula?
conflito(_, Sala, Horario, GradeAcumulada) :-
    member(aula(_, _, Sala, Horario), GradeAcumulada).

% Pergunta B: Esse PROFESSOR já está dando aula nesse HORÁRIO em algum lugar?
conflito(Professor, _, Horario, GradeAcumulada) :-
    member(aula(_, Professor, _, Horario), GradeAcumulada).


