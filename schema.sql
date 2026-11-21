CREATE TABLE IF NOT EXISTS genericreference (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    details VARCHAR(255) NOT NULL
);

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Gender');
