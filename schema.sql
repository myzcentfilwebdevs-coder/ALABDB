-- 13. Modules Table (Lahat ng Menus & Actions ng ALAB FC)
DROP TABLE IF EXISTS modules CASCADE;
CREATE TABLE modules (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    module_name VARCHAR(150) NOT NULL,
    code VARCHAR(100) UNIQUE NOT NULL
);

-- 1: Dashboard
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'Dashboard', 'dashboard');

-- 2: Tournaments (parent_id = 2)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'Tournaments', 'tournaments');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'View Upcoming Tournaments', 'tournaments.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'Create Tournament', 'tournaments.create');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'Edit Tournament', 'tournaments.edit');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'Delete Tournament', 'tournaments.delete');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'Manage Tournament Roster', 'tournaments.roster');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 2, 'Approve Parent Consent', 'tournaments.consent');

-- 9: Training & Attendance (parent_id = 9)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'Attendance', 'attendance');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 9, 'View Training Sessions', 'sessions.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 9, 'Create Training Session', 'sessions.create');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 9, 'Edit / Delete Training Session', 'sessions.manage');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 9, 'View Player Attendance', 'attendance.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 9, 'Record Player Attendance', 'attendance.record');

-- 15: SOA & Payments (parent_id = 15)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'SOA & Billing', 'soa');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 15, 'View SOA', 'soa.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 15, 'Create / Edit SOA', 'soa.manage');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 15, 'Delete SOA', 'soa.delete');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 15, 'Submit Payment', 'soa.pay');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 15, 'Verify Payment', 'soa.verify_payment');

-- 21: Players & Parents (parent_id = 21)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'Players', 'players');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 21, 'View Players', 'players.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 21, 'Add / Edit Player', 'players.manage');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 21, 'Link Parent to Player', 'parents.link');

-- 25: User Management & RBAC (parent_id = 25)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'User Management', 'users');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 25, 'View Users', 'users.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 25, 'Manage Users & Roles', 'users.manage');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 25, 'Manage Generic References', 'references.manage');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 25, 'Manage Role Access', 'rbac.manage');

-- 30: Profile (parent_id = 30)
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 0, 'Profile', 'profile');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 30, 'View Own Profile', 'profile.view');
INSERT INTO modules (seqnum, parent_id, module_name, code) VALUES (DEFAULT, 30, 'Edit Own Profile', 'profile.edit');


-- 14. Role Access Table (Comma-separated module_ids per Role)
DROP TABLE IF EXISTS role_access CASCADE;
CREATE TABLE role_access (
    seqnum SERIAL PRIMARY KEY,
    roleid INTEGER UNIQUE NOT NULL REFERENCES genericreference(seqnum) ON DELETE CASCADE,
    module_ids TEXT NOT NULL
);

INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 5, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 6, '1,2,3,7,9,10,11,12,13,14,21,22,25,26,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 7, '1,2,3,8,9,10,13,15,16,19,21,22,23,24,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
INSERT INTO role_access (seqnum, roleid, module_ids) VALUES (DEFAULT, 8, '1,2,3,9,10,13,21,22,30,31,32') ON CONFLICT (roleid) DO UPDATE SET module_ids = EXCLUDED.module_ids;
