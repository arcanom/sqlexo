--Requêtes SQL simples
-- tous les students
SELECT * FROM `student`;

--tous les projects
SELECT * FROM `project`;

--le student dont l'id est 2
SELECT * FROM `student` WHERE student.id=2;

--les students dont l'id n'est pas 2
SELECT * FROM `student` WHERE student.id!=2;

--le project dont l'id est 3
SELECT * FROM `project` WHERE project.id=3;

--les projects dont l'id n'est pas 3
SELECT * FROM `project` WHERE project.id!=3;

-- les students avec un email contenant .uk
SELECT * FROM `student`WHERE student.email LIKE ('%.uk%');

--les students dont la date de création est antérieure au 01/07/2018 exclus
SELECT * FROM `student` WHERE student.creation_date < "2018/07/01";

--les projets dont la description ne contient pas la chaîne de caractères another
SELECT * FROM `project` WHERE project.client_name NOT LIKE ('%another%');

--les projets dont la date de création est postérieure au 01/04/2018 inclus
SELECT * FROM `project` WHERE project.start_date >= "2018/04/01";

--les students ayant un projet
SELECT * FROM `student` WHERE project_id IS NOT NULL

--les students n'ayant pas de projet
SELECT * FROM `student` WHERE project_id IS NULL


--Requêtes SQL avec critères multiples
--les students :
--dont l'email contient la chaîne de caractères .com OU dont la date de création est antérieure au 01/07/2018 exclus
SELECT * FROM `student` WHERE student.email LIKE ("%.com%") OR student.creation_date < "2018/07/01";

--les students :
--dont l'email contient la chaîne de caractères .com ET dont la date de création est antérieure au 01/07/2018 exclus
SELECT * FROM `student` WHERE student.email LIKE ("%.com%") AND student.creation_date < "2018/07/01";

--les students :
--dont la date de création est postérieure au 01/01/2018 exclus ET dont la date de création est antérieure au 01/07/2018 exclus
SELECT * FROM `student` WHERE creation_date > "2018/01/01" AND creation_date < "2018/07/01";

--les projets :
--dont la description ne contient pas la chaîne de caractères another OU dont la date de création est postérieure au 01/04/2018 inclus
SELECT * FROM `project` WHERE project.client_name NOT LIKE ('%another%') OR project.start_date >= "2018/04/01";

--les projets :
--dont la description ne contient pas la chaîne de caractères another ET dont la date de création est postérieure au 01/04/2018 inclus
SELECT * FROM `project` WHERE project.client_name NOT LIKE ('%another%') AND project.start_date >= "2018/04/01";

--les projets :
--dont la date de création est postérieure au 01/01/2018 inclus ET dont la date de création est antérieure au 01/03/2018 exclus
SELECT * FROM `project` WHERE project.start_date >= "2018/01/01" AND  project.start_date < "2018/03/01";

--les students :
--dont l'email contient la chaîne de caractères .com ET la date de création est antérieure au 01/07/2018 exclus OU ayant un projet
SELECT * FROM `student` WHERE student.email LIKE ("%.com%") AND student.creation_date < "2018/07/01" OR student.project_id IS NOT NULL;

--les students :
--dont l'email contient la chaîne de caractères .comET la date de création est antérieure au 01/07/2018 exclus ET n'ayant pas de projet
SELECT * FROM `student` WHERE student.email LIKE ("%.com%") AND student.creation_date < "2018/07/01" AND student.project_id IS NULL;


--Requêtes SQL avec jointure « many to one »
--tous les students avec leurs projets
SELECT * FROM `student`, `project` WHERE student.project_id = project.id;

--le student dont l'id est 2 avec son projet
SELECT * FROM `student`, `project` WHERE student.project_id = project.id AND student.id = 2;


--Requêtes SQL avec jointure « one to many »
--tous les projects avec leurs students
SELECT * FROM `project`, `student` WHERE project.id = student.project_id;

--le project dont l'id est 3 avec ses students
SELECT * FROM `project`, `student` WHERE project.id = student.project_id AND project.id = 3;


--Requêtes SQL avec jointure « many to many »
--tous les students avec leurs tags
SELECT * FROM `student`, `student_tag`, `tag` WHERE student.id = student_tag.student_id AND student_tag.tag_id =tag.id;

--tous les tags avec leurs students
SELECT * FROM `student`, `student_tag`, `tag` WHERE tag.id = student_tag.tag_id AND student_tag.student_id = student.id;

--le student dont l'id est 2 avec ses tags
SELECT * FROM `student`, `student_tag`, `tag` WHERE student.id= 2 AND student.id = student_tag.student_id AND student_tag.tag_id =tag.id;

--le tag dont l'id est 2 avec ses students
SELECT * FROM `student`, `student_tag`, `tag` WHERE tag.id= 2 AND student.id = student_tag.student_id AND student_tag.tag_id =tag.id;