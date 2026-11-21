CREATE TABLE IF NOT EXISTS genericreference (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    details VARCHAR(255) NOT NULL
);

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Gender');




INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Gender');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Male');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Female');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Role');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Admin');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Teacher');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Registrar');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Student');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Active');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Inactive');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Suspended');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Transfer');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'CivilStatus');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Single');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Married');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Widowed');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Divorced');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Student Type');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'New');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'Transferee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'Returning');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Enrollment Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 23, 'Pending');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 23, 'Approved');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 23, 'Rejected');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Year Level');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, 'Grade 11');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, 'Grade 12');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, '1st Year');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, '2nd Year');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, '3rd Year');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 27, '4th Year');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Relationship');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Father');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Mother');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Guardian');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Brother');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Sister');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Uncle');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Aunt');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Grandfather');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 34, 'Grandmother');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'ValidIdType');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'National ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Passport');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Driver''''s License');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'PRC ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'UMID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'SSS');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'PhilHealth ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'TIN ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Postal ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Voter''''s ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Department');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Information Technology');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Senior High School Faculty');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Science & Mathematics');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Administration & Registrar');