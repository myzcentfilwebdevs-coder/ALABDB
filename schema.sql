CREATE TABLE IF NOT EXISTS genericreference (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    details VARCHAR(255) NOT NULL
);

TRUNCATE TABLE genericreference RESTART IDENTITY CASCADE;

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
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Driver''s License');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'PRC ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'UMID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'SSS');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'PhilHealth ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'TIN ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Postal ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 44, 'Voter''s ID');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 0, 'Department');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Information Technology');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Senior High School Faculty');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Science & Mathematics');
INSERT INTO genericreference (seqnum, parent_id, details) VALUES (DEFAULT, 55, 'Administration & Registrar');

-- 2. Users Table (Login & Account Auth)
CREATE TABLE IF NOT EXISTS users (
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

-- 3. User Profiles Table (Registration Details)
CREATE TABLE IF NOT EXISTS user_profiles (
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

-- 4. OTP Verifications Table (Email Verification & Forgot Password)
CREATE TABLE IF NOT EXISTS otp_verifications (
    otp_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    otp_code VARCHAR(10) NOT NULL,
    purpose VARCHAR(50) NOT NULL, -- 'REGISTER', 'RESET_PASSWORD'
    expires_at TIMESTAMPTZ NOT NULL,
    used_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
