-- Consultas Obrigatórias:

-- 1. Selecionar a quantidade total de estudantes cadastrados no banco.

SELECT COUNT(*) AS Total_de_Alunos FROM aluno; --checkfinal--


-- 2. Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados.

SELECT aluno.nome AS Alunos, curso.nome As Cursos --checkfinal--
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
ORDER BY aluno.nome;


-- 3. Selecionar quais pessoas facilitadoras atuam em mais de uma turma.

SELECT DISTINCT facilitador.nome AS Facilitadores --checkfinal--
FROM facilitador
RIGHT JOIN modulo_facilitador
ON facilitador.id_facilitador = modulo_facilitador.id_facilitador
RIGHT JOIN modulo
ON modulo_facilitador.id_modulo = modulo.id_modulo
RIGHT JOIN curso_modulo
ON modulo.id_modulo = curso_modulo.id_modulo
RIGHT JOIN curso
ON curso_modulo.id_curso = curso.id_curso
GROUP BY facilitador.nome
HAVING COUNT(curso.id_curso) >1;





-- Consultas Estratégicas:

-- 1. Retorne os nomes dos alunos com frequencia igual ou superior a 95% no curso e a carga horária
-- dos respectivos módulos;

SELECT aluno.nome AS Alunos, modulo.cargahoraria AS Carga_Horária_Módulo --checkfinal--
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
INNER JOIN curso_modulo
ON curso.id_curso = curso_modulo.id_curso
INNER JOIN modulo
ON curso_modulo.id_modulo = modulo.id_modulo
WHERE aluno_curso.frequencia_porcent >=95;


-- 2. Retorne os nomes dos alunos que realizaram as entregas de todos os projetos requeridos e
-- os nomes dos respectivos cursos desses projetos;

SELECT aluno.nome AS Alunos, modulo.proj_ind1 AS Projeto_Individual_1, --checkfinal--
modulo.proj_ind2 AS Projeto_Individual_2, modulo.proj_grup AS Projeto_Grupo, curso.nome AS Turma
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
INNER JOIN curso_modulo
ON curso.id_curso = curso_modulo.id_curso
INNER JOIN modulo
ON curso_modulo.id_modulo = modulo.id_modulo
WHERE modulo.proj_ind1='SIM' AND modulo.proj_ind2='SIM' AND modulo.proj_grup='SIM';


-- 3. Retorne o nome dos facilitadores alocados no departamento pedagógico que não
-- são coordenadores. Diga, também, quais os setores ligados a esses facilitadores.

SELECT facilitador.nome AS Facilitadores, departamento.nome AS Departamento, departamento.setor AS Setores --checkfinal--
FROM facilitador
LEFT JOIN departamento
ON facilitador.id_departamento = departamento.id_departamento
WHERE facilitador.id_departamento=111 OR facilitador.id_departamento=112;



