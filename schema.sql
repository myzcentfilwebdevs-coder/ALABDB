DROP TABLE IF EXISTS genericreference CASCADE;
CREATE TABLE genericreference (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    details VARCHAR(255) NOT NULL
);

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Gender');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Male');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 1, 'Female');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Role');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Admin');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Coach');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Parent');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 4, 'Player');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Account Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Active');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Inactive');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Pending');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 9, 'Suspended');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Relationship');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Father');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Mother');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Guardian');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 14, 'Relative');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Age Category');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-8');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-10');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-12');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-14');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-16');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 19, 'U-18');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Player Position');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Goalkeeper');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Defender');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Midfielder');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 26, 'Forward');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Attendance Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Present');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Absent');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Late');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 31, 'Excused');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Tournament Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Upcoming');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Ongoing');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Completed');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 36, 'Cancelled');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'SOA Status');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Unpaid');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Partial');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Paid');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 41, 'Overdue');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Payment Method');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'GCash');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Maya');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Bank Transfer');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 46, 'Cash');

INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Fee Type');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Monthly Training Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Registration Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Tournament Fee');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 51, 'Jersey / Kit Fee');

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

DROP TABLE IF EXISTS user_profiles CASCADE;
CREATE TABLE user_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    gender_id INTEGER REFERENCES genericreference(seqnum),
    phone_number VARCHAR(20),
    address TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS players CASCADE;
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    gender_id INTEGER REFERENCES genericreference(seqnum),
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    position_id INTEGER REFERENCES genericreference(seqnum),
    jersey_number INTEGER,
    avatar_url TEXT,
    status_id INTEGER REFERENCES genericreference(seqnum) DEFAULT 10,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS parent_players CASCADE;
CREATE TABLE parent_players (
    id SERIAL PRIMARY KEY,
    parent_user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    player_id INTEGER NOT NULL REFERENCES players(player_id) ON DELETE CASCADE,
    relationship_id INTEGER REFERENCES genericreference(seqnum),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(parent_user_id, player_id)
);

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

DROP TABLE IF EXISTS tournaments CASCADE;
CREATE TABLE tournaments (
    tournament_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    venue VARCHAR(200) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    age_category_id INTEGER REFERENCES genericreference(seqnum),
    age_category_ids TEXT,
    status_id INTEGER REFERENCES genericreference(seqnum),
    registration_fee NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    banner_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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

DROP TABLE IF EXISTS tournament_rosters CASCADE;
CREATE TABLE tournament_rosters (
    roster_id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL REFERENCES tournaments(tournament_id) ON DELETE CASCADE,
    player_id INTEGER NOT NULL REFERENCES players(player_id) ON DELETE CASCADE,
    parent_consent BOOLEAN NOT NULL DEFAULT FALSE,
    remarks TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(tournament_id, player_id)
);

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

DROP TABLE IF EXISTS player_attendance CASCADE;
CREATE TABLE player_attendance (
    attendance_id SERIAL PRIMARY KEY,
    session_id INTEGER NOT NULL REFERENCES training_sessions(session_id) ON DELETE CASCADE,
    player_id INTEGER NOT NULL REFERENCES players(player_id) ON DELETE CASCADE,
    status_id INTEGER REFERENCES genericreference(seqnum),
    check_in_time TIMESTAMPTZ,
    remarks TEXT,
    recorded_by INTEGER REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(session_id, player_id)
);

DROP TABLE IF EXISTS statements_of_account CASCADE;
CREATE TABLE statements_of_account (
    soa_id SERIAL PRIMARY KEY,
    soa_number VARCHAR(50) UNIQUE NOT NULL,
    player_id INTEGER NOT NULL REFERENCES players(player_id) ON DELETE CASCADE,
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

DROP TABLE IF EXISTS soa_items CASCADE;
CREATE TABLE soa_items (
    item_id SERIAL PRIMARY KEY,
    soa_id INTEGER NOT NULL REFERENCES statements_of_account(soa_id) ON DELETE CASCADE,
    fee_type_id INTEGER REFERENCES genericreference(seqnum),
    description VARCHAR(200) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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

DROP TABLE IF EXISTS app_modules CASCADE;
CREATE TABLE app_modules (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    access VARCHAR(150) NOT NULL,
    accessType VARCHAR(50) NOT NULL,
    routePath VARCHAR(150)
);

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Dashboard', 'Module', '/dashboard');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Tournaments', 'Module', '/tournaments');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'View Upcoming Tournaments', 'Action', '/tournaments');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Create Tournament', 'Action', '/tournaments/create');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Edit Tournament', 'Action', '/tournaments/edit');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Delete Tournament', 'Action', '/tournaments/delete');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Manage Tournament Roster', 'SubModule', '/tournaments/roster');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Approve Parent Consent', 'Action', '/tournaments/consent');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Attendance', 'Module', '/attendance');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'View Training Sessions', 'SubModule', '/attendance/sessions');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Create Training Session', 'Action', '/attendance/sessions/create');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Manage Training Session', 'Action', '/attendance/sessions/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'View Player Attendance', 'SubModule', '/attendance/records');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Record Player Attendance', 'Action', '/attendance/record');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'SOA & Billing', 'Module', '/soa');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'View SOA', 'SubModule', '/soa');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Create / Edit SOA', 'Action', '/soa/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Delete SOA', 'Action', '/soa/delete');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Submit Payment', 'Action', '/soa/pay');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Verify Payment', 'Action', '/soa/verify');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Players', 'Module', '/players');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'View Players', 'SubModule', '/players');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'Add / Edit Player', 'Action', '/players/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'Link Parent to Player', 'Action', '/parents/link');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'User Management', 'Module', '/users');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'View Users', 'SubModule', '/users');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Users & Roles', 'Action', '/users/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Generic References', 'SubModule', '/settings/references');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Role Access', 'SubModule', '/settings/role-access');

INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Profile', 'Module', '/profile');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 30, 'View Own Profile', 'Action', '/profile');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 30, 'Edit Own Profile', 'Action', '/profile/edit');

DROP TABLE IF EXISTS role_access CASCADE;
CREATE TABLE role_access (
    seqnum SERIAL PRIMARY KEY,
    roleid INTEGER UNIQUE NOT NULL REFERENCES genericreference(seqnum) ON DELETE CASCADE,
    module_ids TEXT NOT NULL
);

INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 5, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 6, '1,2,3,7,9,10,11,12,13,14,21,22,25,26,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 7, '1,2,3,8,9,10,13,15,16,19,21,22,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 8, '1,2,3,9,10,13,21,22,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;