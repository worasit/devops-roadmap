1. **First Normal Form (1NF)**:

   Consider a table storing information about students and their courses. In 1NF, each cell should contain a single
   value, and there should be no repeating groups.

   Example Table:
   ```
   StudentID | StudentName | Course1    | Course2    | Course3
   -----------------------------------------------------------
   1         | Alice       | Math       | Science    | English
   2         | Bob         | History    | NULL       | NULL
   3         | Charlie     | Geography  | Physics    | Chemistry
   ```

2. **Second Normal Form (2NF)**:

   In 2NF, all non-key attributes should be fully dependent on the primary key.

   Example Table:
   ```
   StudentID | StudentName | CourseID | CourseName   | Instructor
   --------------------------------------------------------------
   1         | Alice       | 1        | Math         | Mr. Smith
   1         | Alice       | 2        | Science      | Ms. Johnson
   1         | Alice       | 3        | English      | Mr. Brown
   2         | Bob         | 4        | History      | Ms. Wilson
   3         | Charlie     | 5        | Geography    | Mr. Thompson
   3         | Charlie     | 6        | Physics      | Dr. Lee
   3         | Charlie     | 7        | Chemistry    | Ms. Adams
   ```

3. **Third Normal Form (3NF)**:

   In 3NF, there should be no transitive dependencies.

   Example Table:
   ```
   StudentID | StudentName | CourseID | CourseName   | Instructor  | InstructorEmail
   ----------------------------------------------------------------------------
   1         | Alice       | 1        | Math         | Mr. Smith   | smith@example.com
   1         | Alice       | 2        | Science      | Ms. Johnson | johnson@example.com
   1         | Alice       | 3        | English      | Mr. Brown   | brown@example.com
   2         | Bob         | 4        | History      | Ms. Wilson  | wilson@example.com
   3         | Charlie     | 5        | Geography    | Mr. Thompson| thompson@example.com
   3         | Charlie     | 6        | Physics      | Dr. Lee     | lee@example.com
   3         | Charlie     | 7        | Chemistry    | Ms. Adams   | adams@example.com
   ```

These examples demonstrate how tables can be progressively normalized to remove redundancy and ensure data integrity.
Each normalization form eliminates specific types of anomalies and dependencies, resulting in a more efficient and
maintainable database structure.