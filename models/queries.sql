-- Which courses are currently included (active) in the program?
SELECT mnemonic, name
FROM courses
WHERE active = TRUE;

-- Which courses were included in the program, but are no longer active?
SELECT mnemonic, name
FROM courses
WHERE active = FALSE;

-- Which instructors are not current employees?
SELECT name
FROM instructors
WHERE active = FALSE;

-- For each course (active and inactive), how many learning outcomes are there?
SELECT c.mnemonic, c.name, COUNT(lo.id) AS learning_outcomes_count
FROM courses c
LEFT JOIN learning_outcomes lo ON c.id = lo.course_id
GROUP BY c.id, c.mnemonic, c.name;

-- Are there any courses with no learning outcomes? If so, provide their mnemonics and names.
SELECT c.mnemonic, c.name
FROM courses c
LEFT JOIN learning_outcomes lo ON c.id = lo.course_id
WHERE lo.id IS NULL;

-- Which courses include SQL as a learning outcome? Include the learning outcome descriptions, course mnemonics, and course names in your solution.
SELECT c.mnemonic, c.name, lo.description
FROM courses c
JOIN learning_outcomes lo ON c.id = lo.course_id
WHERE lo.description LIKE '%SQL%';

-- Who taught course ds5100 in Summer 2021?
SELECT i.name
FROM assignments a
JOIN instructors i ON a.instructor_id = i.id
JOIN courses c ON a.course_id = c.id
WHERE c.mnemonic = 'ds5100' AND a.term = 'SUMMER2021';

-- Which instructors taught in Fall 2021? Order their names alphabetically, making sure the names are unique.
SELECT DISTINCT i.name
FROM assignments a
JOIN instructors i ON a.instructor_id = i.id
WHERE a.term = 'FALL2021'
ORDER BY i.name;

-- How many courses did each instructor teach in each term? Order your results by term and then instructor.
SELECT a.term, i.name, COUNT(a.course_id) AS courses_taught
FROM assignments a
JOIN instructors i ON a.instructor_id = i.id
GROUP BY a.term, i.name
ORDER BY a.term, i.name;

-- Which courses had more than one instructor for the same term? Provide the mnemonic and term for each.
SELECT c.mnemonic, a.term
FROM assignments a
JOIN courses c ON a.course_id = c.id
GROUP BY c.mnemonic, a.term
HAVING COUNT(a.instructor_id) > 1;

-- For courses with multiple sections, provide the term, course mnemonic, and instructor name for each.
WITH multi_instructors AS (
    SELECT c.mnemonic, a.term
    FROM assignments a
    JOIN courses c ON a.course_id = c.id
    GROUP BY c.mnemonic, a.term
    HAVING COUNT(a.instructor_id) > 1
)
SELECT mi.term, mi.mnemonic, i.name
FROM multi_instructors mi
JOIN assignments a ON mi.mnemonic = a.course_id AND mi.term = a.term
JOIN instructors i ON a.instructor_id = i.id;
