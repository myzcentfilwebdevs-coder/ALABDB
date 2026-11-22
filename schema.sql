-- 1. Generic Reference Table (ALAB FC Master Lookups)
DROP TABLE IF EXISTS genericreference CASCADE;
CREATE TABLE genericreference (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    details VARCHAR(255) NOT NULL
);

-- Gender (parent_id = 1)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Gender');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Male');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Female');

-- Role (parent_id = 4)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Role');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Admin');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Coach');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Parent');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Player');

-- Account Status (parent_id = 9)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Account Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Active');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Inactive');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Pending');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Suspended');

-- Relationship (parent_id = 14)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Relationship');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Father');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Mother');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Guardian');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Relative');

-- Age Category / Division (parent_id = 19)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Age Category');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-8');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-10');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-12');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-14');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-16');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-18');

-- Player Position (parent_id = 26)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Player Position');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Goalkeeper');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Defender');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Midfielder');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Forward');

-- Attendance Status (parent_id = 31)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Attendance Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Present');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Absent');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Late');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Excused');

-- Tournament Status (parent_id = 36)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Tournament Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Upcoming');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Ongoing');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Completed');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Cancelled');

-- SOA / Billing Status (parent_id = 41)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'SOA Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Unpaid');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Partial');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Paid');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Overdue');

-- Payment Method (parent_id = 46)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Payment Method');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'GCash');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Maya');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Bank Transfer');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Cash');

-- Fee Type (parent_id = 51)
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Fee Type');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Monthly Training Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Registration Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Tournament Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Jersey / Kit Fee');


-- 2. Users Table (Login & Account Auth)
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role_id INTEGER REFERENCES genericreference(seqnum),
    status_id INTEGER REFERENCES genericreference(seqnum),
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    last_login_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3. User Profiles Table (Personal & Player Details)
DROP TABLE IF EXISTS user_profiles CASCADE;
CREATE TABLE user_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    gender_id INTEGER REFERENCES genericreference(seqnum),
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    position_id INTEGER REFERENCES genericreference(seqnum),
    jersey_number INTEGER,
    phone_number VARCHAR(20),
    address TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 4. Parent to Player (Bata) Relationship Table
DROP TABLE IF EXISTS parent_players CASCADE;
CREATE TABLE parent_players (
    id SERIAL PRIMARY KEY,
    parent_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    player_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    relationship_id INTEGER REFERENCES genericreference(seqnum),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(parent_user_id, player_user_id)
);

-- 5. OTP Verifications Table (Email Verification & Forgot Password)
DROP TABLE IF EXISTS otp_verifications CASCADE;
CREATE TABLE otp_verifications (
    otp_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    otp_code VARCHAR(10) NOT NULL,
    purpose VARCHAR(50) NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    used_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 6. Upcoming Tournaments Table
DROP TABLE IF EXISTS tournaments CASCADE;
CREATE TABLE tournaments (
    tournament_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    venue VARCHAR(200) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    status_id INTEGER REFERENCES genericreference(seqnum),
    registration_fee NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    banner_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 7. Tournament Rosters (Mga Batang Kasali sa Tournament)
DROP TABLE IF EXISTS tournament_rosters CASCADE;
CREATE TABLE tournament_rosters (
    roster_id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL REFERENCES tournaments(tournament_id) ON DELETE CASCADE,
    player_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    parent_consent BOOLEAN NOT NULL DEFAULT FALSE,
    remarks TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(tournament_id, player_user_id)
);

-- 8. Training Sessions Table
DROP TABLE IF EXISTS training_sessions CASCADE;
CREATE TABLE training_sessions (
    session_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    venue VARCHAR(200),
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    coach_user_id INTEGER REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 9. Player Attendance Table (Attendance ng Bata)
DROP TABLE IF EXISTS player_attendance CASCADE;
CREATE TABLE player_attendance (
    attendance_id SERIAL PRIMARY KEY,
    session_id INTEGER NOT NULL REFERENCES training_sessions(session_id) ON DELETE CASCADE,
    player_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    status_id INTEGER REFERENCES genericreference(seqnum),
    check_in_time TIMESTAMPTZ,
    remarks TEXT,
    recorded_by INTEGER REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(session_id, player_user_id)
);

-- 10. Statements of Account (SOA para sa mga Magulang)
DROP TABLE IF EXISTS statements_of_account CASCADE;
CREATE TABLE statements_of_account (
    soa_id SERIAL PRIMARY KEY,
    soa_number VARCHAR(50) UNIQUE NOT NULL,
    player_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    parent_user_id INTEGER REFERENCES users(user_id) ON DELETE SET NULL,
    billing_period VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    amount_paid NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    balance NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    status_id INTEGER REFERENCES genericreference(seqnum),
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 11. SOA Breakdown Items
DROP TABLE IF EXISTS soa_items CASCADE;
CREATE TABLE soa_items (
    item_id SERIAL PRIMARY KEY,
    soa_id INTEGER NOT NULL REFERENCES statements_of_account(soa_id) ON DELETE CASCADE,
    fee_type_id INTEGER REFERENCES genericreference(seqnum),
    description VARCHAR(200) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 12. SOA Payments (Bayad ng Magulang)
DROP TABLE IF EXISTS soa_payments CASCADE;
CREATE TABLE soa_payments (
    payment_id SERIAL PRIMARY KEY,
    soa_id INTEGER NOT NULL REFERENCES statements_of_account(soa_id) ON DELETE CASCADE,
    amount_paid NUMERIC(10, 2) NOT NULL,
    payment_method_id INTEGER REFERENCES genericreference(seqnum),
    reference_number VARCHAR(100),
    receipt_url TEXT,
    verified_by INTEGER REFERENCES users(user_id) ON DELETE SET NULL,
    paid_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
