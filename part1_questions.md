Part 1: Design Questions

1) (3 PTS) What tables should you build? And 2) (2 PTS) For each table, what field(s) will you use for primary key? And 3) (2 PTS) For each table, what foreign keys will you use? And 4) (2 PTS) Learning outcomes, courses, and instructors need a flag to indicate if they are currently active or not. How will your database support this feature? If a course will be taught again, it will be flagged as active. If the course won’t be taught again, it will be flagged as inactive. It is important to track if an instructor is a current employee or not. Learning outcomes for a course can change. You’ll want to track if a learning outcome is currently active or not.
•	Courses: Course ID (Primary Key), Course Mnemonic, Course Name, Description, Active (Boolean)
•	Instructors: Instructor ID (Primary Key), Instructor Name, Active (Boolean)
•	Learning_Outcomes: Learning Outcome ID (Primary Key), Course ID (Foreign Key), Description, Active (Boolean)
•	Assignments: Assignment ID (Primary Key), Course ID (Foreign Key), Instructor ID (Foreign Key), Term

5) (1 PT) Is there anything to normalize in the database, and if so, how will you normalize it? Recall the desire to eliminate redundancy.
•	Create each table in 2NF(separate tables, atomic values, single dtype) and all the attributes are only dependent on the primary key.

6) (1 PT) Are there indexes that you should build? Explain your reasoning.
•	Course ID, Learning_Outcomes: Outcomes by course.
•	Instructor ID, Assignments: Assignments by instructor.
•	Term in the Assignments Term search.

7) (2 PTS) Are there constraints to enforce? Explain your answer and strategy.
For example, these actions should not be allowed:
- Entering learning objectives for a course not offered by the School of Data Science
- Assigning an invalid instructor to a course
•	Valid dtypes and same-term formats, no nulls and unique primary keys

8) (5 PTS) Draw and submit a Relational Model for your project. For an example, see Beginning Database Design Solutions page 115 Figure 5-28.
•	See part1_relational_model in repo.

9) (2 PTS) Suppose you were asked if your database could also support the UVA SDS Residential MSDS Program. Explain any issues that might arise, changes to the database structure (schema), and new data that might be needed. Note you won’t actually need to support this use case for the project.
•	Issues/schema: Avoid redundancy, new table for new data (maintain integrity of existing tables)
•	New data: Add program details like online vs. residential column or Boolean, class size limits, number of credits
