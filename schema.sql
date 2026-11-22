DROP TABLE IF EXISTS modules CASCADE;
DROP TABLE IF EXISTS app_modules CASCADE;
CREATE TABLE app_modules (
    seqnum SERIAL PRIMARY KEY,
    parent_id INTEGER NOT NULL DEFAULT 0,
    access VARCHAR(150) NOT NULL,
    accessType VARCHAR(50) NOT NULL,
    routePath VARCHAR(150)
);

-- 1: Dashboard
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Dashboard', 'Module', '/dashboard');

-- 2: Tournaments (parent_id = 2)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Tournaments', 'Module', '/tournaments');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'View Upcoming Tournaments', 'Action', '/tournaments');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Create Tournament', 'Action', '/tournaments/create');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Edit Tournament', 'Action', '/tournaments/edit');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Delete Tournament', 'Action', '/tournaments/delete');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Manage Tournament Roster', 'SubModule', '/tournaments/roster');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 2, 'Approve Parent Consent', 'Action', '/tournaments/consent');

-- 9: Attendance (parent_id = 9)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Attendance', 'Module', '/attendance');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'View Training Sessions', 'SubModule', '/attendance/sessions');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Create Training Session', 'Action', '/attendance/sessions/create');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Manage Training Session', 'Action', '/attendance/sessions/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'View Player Attendance', 'SubModule', '/attendance/records');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 9, 'Record Player Attendance', 'Action', '/attendance/record');

-- 15: SOA & Billing (parent_id = 15)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'SOA & Billing', 'Module', '/soa');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'View SOA', 'SubModule', '/soa');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Create / Edit SOA', 'Action', '/soa/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Delete SOA', 'Action', '/soa/delete');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Submit Payment', 'Action', '/soa/pay');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 15, 'Verify Payment', 'Action', '/soa/verify');

-- 21: Players & Parents (parent_id = 21)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Players', 'Module', '/players');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'View Players', 'SubModule', '/players');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'Add / Edit Player', 'Action', '/players/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 21, 'Link Parent to Player', 'Action', '/parents/link');

-- 25: User Management (parent_id = 25)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'User Management', 'Module', '/users');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'View Users', 'SubModule', '/users');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Users & Roles', 'Action', '/users/manage');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Generic References', 'SubModule', '/settings/references');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 25, 'Manage Role Access', 'SubModule', '/settings/role-access');

-- 30: Profile (parent_id = 30)
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 0, 'Profile', 'Module', '/profile');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 30, 'View Own Profile', 'Action', '/profile');
INSERT INTO app_modules (seqnum, parent_id, access, accessType, routePath) VALUES (DEFAULT, 30, 'Edit Own Profile', 'Action', '/profile/edit');
