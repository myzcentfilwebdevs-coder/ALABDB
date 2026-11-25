
ALTER TABLE tournaments ADD COLUMN IF NOT EXISTS age_category_ids TEXT;

DROP TABLE IF EXISTS tournament_matches CASCADE;
CREATE TABLE tournament_matches (
    match_id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL REFERENCES tournaments(tournament_id) ON DELETE CASCADE,
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    game_label VARCHAR(50) NOT NULL,
    opponent VARCHAR(150) NOT NULL,
    match_date DATE NOT NULL,
    match_time TIME,
    pitch VARCHAR(100),
    alab_score INTEGER,
    opponent_score INTEGER,
    status_id INTEGER REFERENCES genericreference(seqnum) DEFAULT 37,
    remarks TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);