-- INSERT OF THE POSSIBLE PROBLEMS
INSERT INTO "possible_problems" ("id","description", "condensation_temperature_status",
"liquid_line_subcooling_status", "evaporator_temperature_status","evaporator_superheat_status","liquid_sight_glass_status" )
VALUES
(1,"frosted or dirty evaporator","low","normal","low","normal","full"),
(2,"Restricted expansion valve","low","normal","low","high","full"),
(3,"Low refrigerant charge","low","low","low","high","bubbles"),
(4,"Compressor valves","low","normal","high","high","full"),
(5,"Restriction after the liquid receiver","low","normal","low","high","full"),
(6,"Restriction before the liquid receiver","high","high","low","high","bubbles"),
(7,"Dirty condenser","high","normal","normal","normal","full"),
(8,"Non-condensables in the system","high","high","normal","normal","full"),
(9,"Refrigerant Overcharge","high","high","normal","normal","full");



-- On this database we only insert into tables of lectures, companies, and contacts.
-- First, it is necesary to insert the values of companies
INSERT INTO "companies" ("id", "company_name", "address") VALUES
(1, 'Livefish', '7382 Autumn Leaf Avenue'),
(2, 'Tavu', '17 Schiller Court'),
(3, 'Bubblebox', '599 Brentwood Drive'),
(4, 'Devpoint', '11 Lotheville Point'),
(5, 'Tambee', '345 1st Pass'),
(6, 'Cogibox', '5679 Walton Terrace'),
(7, 'DabZ', '03 Rusk Street'),
(8, 'Kimia', '1118 Grim Alley'),
(9, 'Trilia', '818 Parkside Trail'),
(10, 'Camido', '1036 Sunbrook Pass'),
(11, 'Feedbug', '9 Dennis Center'),
(12, 'Zazio', '82 Tennessee Pass'),
(13, 'Wordware', '2 Gerald Crossing'),
(14, 'Jetpulse', '88603 Sherman Point'),
(15, 'Shuffletag', '985 Packers Circle'),
(16, 'Myworks', '1 Loeprich Plaza'),
(17, 'Quatz', '529 Tony Court'),
(18, 'Realfire', '4 Kennedy Lane'),
(19, 'Buzzster', '60488 Moland Trail'),
(20, 'Gabtype', '32 Mcguire Center'),
(21, 'Flipopia', '64191 Schiller Avenue'),
(22, 'Camido', '33548 Autumn Leaf Center'),
(23, 'Agimba', '8 Buena Vista Center'),
(24, 'Yodel', '12776 Cascade Circle'),
(25, 'Vipe', '08 Michigan Road'),
(26, 'Jayo', '7750 Melby Hill'),
(27, 'Oyonder', '28734 Lyons Street'),
(28, 'Zoonoodle', '53784 Waywood Court'),
(29, 'Oyondu', '6015 Iowa Pass'),
(30, 'Jaxbean', '0627 Lakewood Drive'),
(31, 'Meedoo', '8 Kipling Junction'),
(32, 'Trupe', '4 Ludington Road'),
(33, 'Jaxbean', '2 Sachs Avenue'),
(34, 'Oyonder', '2 Parkside Parkway'),
(35, 'Mydo', '0 Del Mar Pass'),
(36, 'Skippad', '90 Karstens Circle'),
(37, 'Pixope', '173 Mcguire Alley'),
(38, 'Zoonder', '5 Elka Terrace'),
(39, 'Vipe', '83 Crest Line Junction'),
(40, 'Meeveo', '754 Center Circle'),
(41, 'Thoughtblab', '28296 Lerdahl Pass'),
(42, 'Gigazoom', '322 Messerschmidt Junction'),
(43, 'Jaxbean', '9151 American Pass'),
(44, 'Blognation', '47498 Union Road'),
(45, 'Tagtune', '33037 Clyde Gallagher Center'),
(46, 'Photolist', '48533 Pennsylvania Crossing'),
(47, 'Oyope', '087 Ruskin Point'),
(48, 'Twinder', '54 Crownhardt Circle'),
(49, 'Kare', '2230 Maryland Plaza'),
(50, 'Jetwire', '01 Mifflin Court');

--Now, this are the inserts for the table contacts
INSERT INTO "contacts" ("id", "first_name", "last_name", "company_id", "email", "phone") VALUES
(1, 'John', 'Doe', 1, 'john.doe@company1.com', '+1-555-1001'),
(2, 'Jane', 'Smith', 2, 'jane.smith@company2.com', '+1-555-1002'),
(3, 'Carlos', 'Gonzalez', 3, 'carlos.gonzalez@company3.com', '+1-555-1003'),
(4, 'Emily', 'Johnson', 4, 'emily.johnson@company4.com', '+1-555-1004'),
(5, 'Michael', 'Brown', 5, 'michael.brown@company5.com', '+1-555-1005'),
(6, 'Alice', 'Williams', 6, 'alice.williams@company6.com', '+1-555-1006'),
(7, 'Robert', 'Martinez', 7, 'robert.martinez@company7.com', '+1-555-1007'),
(8, 'David', 'Lopez', 8, 'david.lopez@company8.com', '+1-555-1008'),
(9, 'Sophia', 'Harris', 9, 'sophia.harris@company9.com', '+1-555-1009'),
(10, 'James', 'Clark', 10, 'james.clark@company10.com', '+1-555-1010'),
(11, 'Olivia', 'Rodriguez', 11, 'olivia.rodriguez@company11.com', '+1-555-1011'),
(12, 'William', 'Lewis', 12, 'william.lewis@company12.com', '+1-555-1012'),
(13, 'Charlotte', 'Walker', 13, 'charlotte.walker@company13.com', '+1-555-1013'),
(14, 'Daniel', 'Hall', 14, 'daniel.hall@company14.com', '+1-555-1014'),
(15, 'Amelia', 'Allen', 15, 'amelia.allen@company15.com', '+1-555-1015'),
(16, 'Ethan', 'Young', 16, 'ethan.young@company16.com', '+1-555-1016'),
(17, 'Mia', 'King', 17, 'mia.king@company17.com', '+1-555-1017'),
(18, 'Benjamin', 'Scott', 18, 'benjamin.scott@company18.com', '+1-555-1018'),
(19, 'Harper', 'Green', 19, 'harper.green@company19.com', '+1-555-1019'),
(20, 'Alexander', 'Baker', 20, 'alexander.baker@company20.com', '+1-555-1020'),
(21, 'Evelyn', 'Nelson', 21, 'evelyn.nelson@company21.com', '+1-555-1021'),
(22, 'Matthew', 'Carter', 22, 'matthew.carter@company22.com', '+1-555-1022'),
(23, 'Abigail', 'Mitchell', 23, 'abigail.mitchell@company23.com', '+1-555-1023'),
(24, 'Henry', 'Perez', 24, 'henry.perez@company24.com', '+1-555-1024'),
(25, 'Emily', 'Roberts', 25, 'emily.roberts@company25.com', '+1-555-1025'),
(26, 'Lucas', 'Turner', 26, 'lucas.turner@company26.com', '+1-555-1026'),
(27, 'Elizabeth', 'Phillips', 27, 'elizabeth.phillips@company27.com', '+1-555-1027'),
(28, 'Mason', 'Campbell', 28, 'mason.campbell@company28.com', '+1-555-1028'),
(29, 'Sofia', 'Parker', 29, 'sofia.parker@company29.com', '+1-555-1029'),
(30, 'Logan', 'Evans', 30, 'logan.evans@company30.com', '+1-555-1030'),
(31, 'Avery', 'Edwards', 31, 'avery.edwards@company31.com', '+1-555-1031'),
(32, 'Jack', 'Collins', 32, 'jack.collins@company32.com', '+1-555-1032'),
(33, 'Ella', 'Stewart', 33, 'ella.stewart@company33.com', '+1-555-1033'),
(34, 'Sebastian', 'Morris', 34, 'sebastian.morris@company34.com', '+1-555-1034'),
(35, 'Scarlett', 'Rogers', 35, 'scarlett.rogers@company35.com', '+1-555-1035'),
(36, 'Joseph', 'Reed', 36, 'joseph.reed@company36.com', '+1-555-1036'),
(37, 'Victoria', 'Cook', 37, 'victoria.cook@company37.com', '+1-555-1037'),
(38, 'Liam', 'Morgan', 38, 'liam.morgan@company38.com', '+1-555-1038'),
(39, 'Chloe', 'Bell', 39, 'chloe.bell@company39.com', '+1-555-1039'),
(40, 'Ryan', 'Murphy', 40, 'ryan.murphy@company40.com', '+1-555-1040'),
(41, 'Zoe', 'Bailey', 41, 'zoe.bailey@company41.com', '+1-555-1041'),
(42, 'Nathan', 'Rivera', 42, 'nathan.rivera@company42.com', '+1-555-1042'),
(43, 'Stella', 'Cooper', 43, 'stella.cooper@company43.com', '+1-555-1043'),
(44, 'Owen', 'Richardson', 44, 'owen.richardson@company44.com', '+1-555-1044'),
(45, 'Lily', 'Cox', 45, 'lily.cox@company45.com', '+1-555-1045'),
(46, 'Samuel', 'Howard', 46, 'samuel.howard@company46.com', '+1-555-1046'),
(47, 'Hannah', 'Ward', 47, 'hannah.ward@company47.com', '+1-555-1047'),
(48, 'Dylan', 'Torres', 48, 'dylan.torres@company48.com', '+1-555-1048'),
(49, 'Madison', 'Peterson', 49, 'madison.peterson@company49.com', '+1-555-1049'),
(50, 'Luke', 'Gray', 50, 'luke.gray@company50.com', '+1-555-1050'),
(51, 'Ella', 'Bennett', 1, 'ella.bennett@company1.com', '+1-555-1051'),
(52, 'Noah', 'Sullivan', 2, 'noah.sullivan@company2.com', '+1-555-1052'),
(53, 'Luna', 'Powell', 3, 'luna.powell@company3.com', '+1-555-1053'),
(54, 'Mason', 'Foster', 4, 'mason.foster@company4.com', '+1-555-1054'),
(55, 'Aria', 'Long', 5, 'aria.long@company5.com', '+1-555-1055'),
(56, 'Levi', 'Hughes', 6, 'levi.hughes@company6.com', '+1-555-1056'),
(57, 'Grace', 'Flores', 7, 'grace.flores@company7.com', '+1-555-1057'),
(58, 'Wyatt', 'Perry', 8, 'wyatt.perry@company8.com', '+1-555-1058'),
(59, 'Penelope', 'Butler', 9, 'penelope.butler@company9.com', '+1-555-1059'),
(60, 'Gabriel', 'Barnes', 10, 'gabriel.barnes@company10.com', '+1-555-1060');

-- This are the datas for condensing units as examples
INSERT INTO "condensing_units" ("id", "brand", "model", "serie") VALUES
(1, 'Carrier', '38AKS016', 'SN20240001'),
(2, 'Trane', 'RAUCC60', 'SN20240002'),
(3, 'Daikin', 'RZQSG71LV1', 'SN20240003'),
(4, 'Mitsubishi', 'PUHZ-ZRP200', 'SN20240004'),
(5, 'York', 'YZAL030', 'SN20240005'),
(6, 'Lennox', 'XC25-048', 'SN20240006'),
(7, 'Goodman', 'GSX160361', 'SN20240007'),
(8, 'Rheem', 'RA1636AJ1NA', 'SN20240008'),
(9, 'Samsung', 'DVMS AM120JXVGGH', 'SN20240009'),
(10, 'Fujitsu', 'AOU36RLXFZ', 'SN20240010'),
(11, 'Panasonic', 'CU-5E36QBR', 'SN20240011'),
(12, 'Bosch', 'BOVA36HDN1', 'SN20240012'),
(13, 'Gree', 'GUD100T/A-T(U)', 'SN20240013'),
(14, 'Hitachi', 'RAS-60HYPA', 'SN20240014'),
(15, 'Toshiba', 'RAV-SP1104AT8-UL', 'SN20240015'),
(16, 'LG', 'LSN120HSV5', 'SN20240016'),
(17, 'Haier', 'AB092XCERA', 'SN20240017'),
(18, 'Chigo', 'C1A-36K', 'SN20240018'),
(19, 'Midea', 'MGP50H2AAX', 'SN20240019'),
(20, 'Danfoss', 'HCM068T4LC6', 'SN20240020'),
(21, 'Blue Star', 'FS318AATU', 'SN20240021'),
(22, 'McQuay', 'M5BACX', 'SN20240022'),
(23, 'Friedrich', 'VRP12K', 'SN20240023'),
(24, 'Sharp', 'AY-AP12KR', 'SN20240024'),
(25, 'Samsung', 'DVMS AM080JXVGGH', 'SN20240025'),
(26, 'Trane', 'TTA090A', 'SN20240026'),
(27, 'Carrier', '38AUZ080', 'SN20240027'),
(28, 'York', 'YZAL050', 'SN20240028'),
(29, 'Lennox', 'EL16XC1-030', 'SN20240029'),
(30, 'Gree', 'GUD140T/A-T(U)', 'SN20240030'),
(31, 'Mitsubishi', 'PUHZ-ZRP250', 'SN20240031'),
(32, 'Panasonic', 'CU-4E36QBR', 'SN20240032'),
(33, 'Bosch', 'BOVA60HDN1', 'SN20240033'),
(34, 'Goodman', 'GSX160601', 'SN20240034'),
(35, 'Fujitsu', 'AOU45RLXFZ', 'SN20240035'),
(36, 'Haier', 'AB152XCERA', 'SN20240036'),
(37, 'Danfoss', 'HCM120T4LC6', 'SN20240037'),
(38, 'Toshiba', 'RAV-SP1404AT8-UL', 'SN20240038'),
(39, 'Daikin', 'RZQSG100LV1', 'SN20240039'),
(40, 'Hitachi', 'RAS-80HYPA', 'SN20240040'),
(41, 'Rheem', 'RA1672AJ1NA', 'SN20240041'),
(42, 'Blue Star', 'FS422AATU', 'SN20240042'),
(43, 'McQuay', 'M7BACX', 'SN20240043'),
(44, 'Sharp', 'AY-AP24KR', 'SN20240044'),
(45, 'Midea', 'MGP75H2AAX', 'SN20240045'),
(46, 'LG', 'LSN180HSV5', 'SN20240046'),
(47, 'Chigo', 'C1A-48K', 'SN20240047'),
(48, 'Friedrich', 'VRP24K', 'SN20240048'),
(49, 'York', 'YZAL060', 'SN20240049'),
(50, 'Samsung', 'DVMS AM140JXVGGH', 'SN20240050');


-- This are the examples of compressors data
INSERT INTO "compressors" ("id", "installation_date", "model", "serie", "oil_type") VALUES
(1, '2023-06-15', 'Copeland ZR61KCE', 'CMP20240001', 'POE'),
(2, '2022-09-23', 'Danfoss SH295', 'CMP20240002', 'Mineral'),
(3, '2023-02-11', 'Bitzer CSH8573-140Y', 'CMP20240003', 'POE'),
(4, '2024-01-05', 'Scroll ZP34K5E', 'CMP20240004', 'POE'),
(5, '2021-12-20', 'Copeland ZR48KCE', 'CMP20240005', 'POE'),
(6, '2023-07-08', 'Danfoss MTZ64', 'CMP20240006', 'Mineral'),
(7, '2022-05-14', 'Hitachi XH121A2', 'CMP20240007', 'Alkylbenzene'),
(8, '2023-03-19', 'LG QH018P', 'CMP20240008', 'POE'),
(9, '2021-08-30', 'Mitsubishi KX6A', 'CMP20240009', 'POE'),
(10, '2023-04-10', 'Tecumseh AE4440Y', 'CMP20240010', 'Mineral'),
(11, '2022-07-01', 'Trane CHHP100', 'CMP20240011', 'POE'),
(12, '2023-05-21', 'Copeland ZP54KCE', 'CMP20240012', 'POE'),
(13, '2022-11-09', 'Danfoss NTZ048', 'CMP20240013', 'Alkylbenzene'),
(14, '2023-09-17', 'Bitzer 6FE-50Y', 'CMP20240014', 'POE'),
(15, '2024-02-01', 'Scroll ZB38KQE', 'CMP20240015', 'POE'),
(16, '2021-10-25', 'Copeland CR47KQ', 'CMP20240016', 'Mineral'),
(17, '2022-03-05', 'Danfoss SZ185', 'CMP20240017', 'POE'),
(18, '2023-01-28', 'Hitachi TFA524', 'CMP20240018', 'POE'),
(19, '2022-06-12', 'LG ARNU07GTQA4', 'CMP20240019', 'POE'),
(20, '2023-08-07', 'Mitsubishi PUHZ-RP200', 'CMP20240020', 'POE'),
(21, '2022-12-16', 'Tecumseh AJ5512E', 'CMP20240021', 'Mineral'),
(22, '2023-04-03', 'Trane RTAD115', 'CMP20240022', 'POE'),
(23, '2022-10-14', 'Copeland ZB19KQ', 'CMP20240023', 'POE'),
(24, '2023-06-29', 'Danfoss SH180', 'CMP20240024', 'Mineral'),
(25, '2024-01-10', 'Bitzer CSH6553', 'CMP20240025', 'POE'),
(26, '2022-02-28', 'Scroll ZR81KC', 'CMP20240026', 'POE'),
(27, '2023-07-23', 'Copeland CR42KQ', 'CMP20240027', 'Mineral'),
(28, '2022-04-11', 'Danfoss MT125', 'CMP20240028', 'POE'),
(29, '2023-02-05', 'Hitachi XH281A', 'CMP20240029', 'Alkylbenzene'),
(30, '2022-09-09', 'LG QH036P', 'CMP20240030', 'POE'),
(31, '2023-05-18', 'Mitsubishi KX4A', 'CMP20240031', 'POE'),
(32, '2022-08-22', 'Tecumseh AE5430Y', 'CMP20240032', 'Mineral'),
(33, '2023-10-11', 'Trane CHHP120', 'CMP20240033', 'POE'),
(34, '2022-11-25', 'Copeland ZP91KCE', 'CMP20240034', 'POE'),
(35, '2023-09-30', 'Danfoss NTZ068', 'CMP20240035', 'Alkylbenzene'),
(36, '2024-03-04', 'Bitzer 6GE-34Y', 'CMP20240036', 'POE'),
(37, '2022-05-08', 'Scroll ZB50KQE', 'CMP20240037', 'POE'),
(38, '2023-06-02', 'Copeland CR53KQ', 'CMP20240038', 'Mineral'),
(39, '2022-10-19', 'Danfoss SZ250', 'CMP20240039', 'POE'),
(40, '2023-07-14', 'Hitachi TFA640', 'CMP20240040', 'POE'),
(41, '2022-03-15', 'LG ARNU12GTQA4', 'CMP20240041', 'POE'),
(42, '2023-12-01', 'Mitsubishi PUHZ-RP250', 'CMP20240042', 'POE'),
(43, '2022-08-04', 'Tecumseh AJ6024E', 'CMP20240043', 'Mineral'),
(44, '2023-09-22', 'Trane RTAD135', 'CMP20240044', 'POE'),
(45, '2022-06-27', 'Copeland ZB25KQ', 'CMP20240045', 'POE'),
(46, '2023-04-20', 'Danfoss SH220', 'CMP20240046', 'Mineral'),
(47, '2022-12-05', 'Bitzer CSH7583', 'CMP20240047', 'POE'),
(48, '2024-02-14', 'Scroll ZR94KC', 'CMP20240048', 'POE'),
(49, '2022-09-30', 'Copeland CR60KQ', 'CMP20240049', 'Mineral'),
(50, '2023-08-19', 'Danfoss MT160', 'CMP20240050', 'POE');

-- This are the examples of evaporators data

INSERT INTO "evaporators" ("id", "brand", "model", "serie") VALUES
(1, 'Trenton', 'TSA-220', 'EVP20240001'),
(2, 'Heatcraft', 'LCE-150', 'EVP20240002'),
(3, 'Bohn', 'BEA-200', 'EVP20240003'),
(4, 'Krack', 'KSE-180', 'EVP20240004'),
(5, 'Copeland', 'CVE-250', 'EVP20240005'),
(6, 'Trane', 'TCE-300', 'EVP20240006'),
(7, 'Larkin', 'LVA-120', 'EVP20240007'),
(8, 'Danfoss', 'DEA-140', 'EVP20240008'),
(9, 'Kelvinator', 'KVE-160', 'EVP20240009'),
(10, 'Heatcraft', 'HCE-190', 'EVP20240010'),
(11, 'Bohn', 'BVA-210', 'EVP20240011'),
(12, 'Krack', 'KSE-240', 'EVP20240012'),
(13, 'Copeland', 'CVE-260', 'EVP20240013'),
(14, 'Trane', 'TCE-310', 'EVP20240014'),
(15, 'Larkin', 'LVA-130', 'EVP20240015'),
(16, 'Danfoss', 'DEA-150', 'EVP20240016'),
(17, 'Kelvinator', 'KVE-170', 'EVP20240017'),
(18, 'Heatcraft', 'HCE-200', 'EVP20240018'),
(19, 'Bohn', 'BVA-220', 'EVP20240019'),
(20, 'Krack', 'KSE-250', 'EVP20240020'),
(21, 'Copeland', 'CVE-270', 'EVP20240021'),
(22, 'Trane', 'TCE-320', 'EVP20240022'),
(23, 'Larkin', 'LVA-140', 'EVP20240023'),
(24, 'Danfoss', 'DEA-160', 'EVP20240024'),
(25, 'Kelvinator', 'KVE-180', 'EVP20240025'),
(26, 'Heatcraft', 'HCE-210', 'EVP20240026'),
(27, 'Bohn', 'BVA-230', 'EVP20240027'),
(28, 'Krack', 'KSE-260', 'EVP20240028'),
(29, 'Copeland', 'CVE-280', 'EVP20240029'),
(30, 'Trane', 'TCE-330', 'EVP20240030'),
(31, 'Larkin', 'LVA-150', 'EVP20240031'),
(32, 'Danfoss', 'DEA-170', 'EVP20240032'),
(33, 'Kelvinator', 'KVE-190', 'EVP20240033'),
(34, 'Heatcraft', 'HCE-220', 'EVP20240034'),
(35, 'Bohn', 'BVA-240', 'EVP20240035'),
(36, 'Krack', 'KSE-270', 'EVP20240036'),
(37, 'Copeland', 'CVE-290', 'EVP20240037'),
(38, 'Trane', 'TCE-340', 'EVP20240038'),
(39, 'Larkin', 'LVA-160', 'EVP20240039'),
(40, 'Danfoss', 'DEA-180', 'EVP20240040'),
(41, 'Kelvinator', 'KVE-200', 'EVP20240041'),
(42, 'Heatcraft', 'HCE-230', 'EVP20240042'),
(43, 'Bohn', 'BVA-250', 'EVP20240043'),
(44, 'Krack', 'KSE-280', 'EVP20240044'),
(45, 'Copeland', 'CVE-300', 'EVP20240045'),
(46, 'Trane', 'TCE-350', 'EVP20240046'),
(47, 'Larkin', 'LVA-170', 'EVP20240047'),
(48, 'Danfoss', 'DEA-190', 'EVP20240048'),
(49, 'Kelvinator', 'KVE-210', 'EVP20240049'),
(50, 'Heatcraft', 'HCE-240', 'EVP20240050');

-- this are examples of expansion valves
INSERT INTO "expansion_valves" ("id", "brand", "model", "capacity", "refrigerant_gas", "type_of_thaw", "cut_in", "cut_out") VALUES
(1, 'Danfoss', 'TX2', 2.50, 'R-134a', 'Electric', 35.00, 20.00),
(2, 'Sporlan', 'EEV-1', 3.00, 'R-404A', 'Hot gas', 40.00, 22.50),
(3, 'Alco', 'EX5', 2.75, 'R-22', 'Electric', 37.00, 21.00),
(4, 'Parker', 'SER-AA', 3.20, 'R-410A', 'Hot gas', 42.00, 23.50),
(5, 'Danfoss', 'TX3', 2.90, 'R-407C', 'Electric', 38.00, 20.50),
(6, 'Sporlan', 'EEV-2', 3.50, 'R-134a', 'Hot gas', 45.00, 24.00),
(7, 'Alco', 'EX6', 2.60, 'R-404A', 'Electric', 36.00, 19.50),
(8, 'Parker', 'SER-BB', 3.75, 'R-22', 'Hot gas', 48.00, 26.00),
(9, 'Danfoss', 'TX5', 3.00, 'R-410A', 'Electric', 39.50, 22.00),
(10, 'Sporlan', 'EEV-3', 3.25, 'R-407C', 'Hot gas', 41.00, 23.00),
(11, 'Alco', 'EX7', 2.85, 'R-134a', 'Electric', 37.50, 21.50),
(12, 'Parker', 'SER-CC', 3.90, 'R-404A', 'Hot gas', 46.00, 25.00),
(13, 'Danfoss', 'TX7', 3.15, 'R-22', 'Electric', 38.50, 20.75),
(14, 'Sporlan', 'EEV-4', 3.80, 'R-410A', 'Hot gas', 49.00, 27.00),
(15, 'Alco', 'EX8', 3.00, 'R-407C', 'Electric', 40.00, 22.50),
(16, 'Parker', 'SER-DD', 4.10, 'R-134a', 'Hot gas', 50.00, 28.00),
(17, 'Danfoss', 'TX9', 3.40, 'R-404A', 'Electric', 42.50, 23.75),
(18, 'Sporlan', 'EEV-5', 3.90, 'R-22', 'Hot gas', 47.50, 26.50),
(19, 'Alco', 'EX9', 3.10, 'R-410A', 'Electric', 39.00, 21.00),
(20, 'Parker', 'SER-EE', 4.20, 'R-407C', 'Hot gas', 52.00, 30.00),
(21, 'Danfoss', 'TX11', 3.50, 'R-134a', 'Electric', 41.50, 22.25),
(22, 'Sporlan', 'EEV-6', 4.00, 'R-404A', 'Hot gas', 55.00, 32.00),
(23, 'Alco', 'EX10', 3.20, 'R-22', 'Electric', 40.50, 21.50),
(24, 'Parker', 'SER-FF', 4.50, 'R-410A', 'Hot gas', 53.00, 31.00),
(25, 'Danfoss', 'TX12', 3.60, 'R-407C', 'Electric', 42.00, 22.75),
(26, 'Sporlan', 'EEV-7', 4.10, 'R-134a', 'Hot gas', 57.00, 34.00),
(27, 'Alco', 'EX11', 3.30, 'R-404A', 'Electric', 43.00, 23.00),
(28, 'Parker', 'SER-GG', 4.60, 'R-22', 'Hot gas', 60.00, 36.00),
(29, 'Danfoss', 'TX14', 3.70, 'R-410A', 'Electric', 44.50, 23.50),
(30, 'Sporlan', 'EEV-8', 4.20, 'R-407C', 'Hot gas', 62.00, 38.00),
(31, 'Alco', 'EX12', 3.40, 'R-134a', 'Electric', 45.00, 24.00),
(32, 'Parker', 'SER-HH', 4.75, 'R-404A', 'Hot gas', 64.00, 40.00),
(33, 'Danfoss', 'TX15', 3.80, 'R-22', 'Electric', 46.00, 24.50),
(34, 'Sporlan', 'EEV-9', 4.30, 'R-410A', 'Hot gas', 66.00, 42.00),
(35, 'Alco', 'EX13', 3.50, 'R-407C', 'Electric', 47.50, 25.00),
(36, 'Parker', 'SER-II', 4.80, 'R-134a', 'Hot gas', 68.00, 44.00),
(37, 'Danfoss', 'TX17', 3.90, 'R-404A', 'Electric', 48.50, 25.50),
(38, 'Sporlan', 'EEV-10', 4.50, 'R-22', 'Hot gas', 70.00, 46.00),
(39, 'Alco', 'EX14', 3.60, 'R-410A', 'Electric', 50.00, 26.00),
(40, 'Parker', 'SER-JJ', 5.00, 'R-407C', 'Hot gas', 72.00, 48.00),
(41, 'Danfoss', 'TX18', 4.00, 'R-134a', 'Electric', 51.00, 27.00),
(42, 'Sporlan', 'EEV-11', 4.75, 'R-404A', 'Hot gas', 74.00, 50.00),
(43, 'Alco', 'EX15', 3.70, 'R-22', 'Electric', 52.00, 27.50),
(44, 'Parker', 'SER-KK', 5.10, 'R-410A', 'Hot gas', 76.00, 52.00),
(45, 'Danfoss', 'TX20', 4.10, 'R-407C', 'Electric', 53.50, 28.00),
(46, 'Sporlan', 'EEV-12', 5.00, 'R-134a', 'Hot gas', 78.00, 54.00),
(47, 'Alco', 'EX16', 3.80, 'R-404A', 'Electric', 55.00, 28.50),
(48, 'Parker', 'SER-LL', 5.25, 'R-22', 'Hot gas', 80.00, 56.00),
(49, 'Danfoss', 'TX21', 4.20, 'R-410A', 'Electric', 56.00, 29.00),
(50, 'Sporlan', 'EEV-13', 5.50, 'R-407C', 'Hot gas', 82.00, 58.00);


-- This is the table for the relation ono to one of the cooling_systems and the relation one to many of companies with cooling system
INSERT INTO "cooling_systems" ("id", "condensing_unit_id", "compressor_id", "evaporator_id", "expansion_valve_id", "company_id")
VALUES
    (1, 1, 1, 1, 1, 5),
    (2, 2, 2, 2, 2, 5),
    (3, 3, 3, 3, 3, 5),
    (4, 4, 4, 4, 4, 4),
    (5, 5, 5, 5, 5, 5),
    (6, 6, 6, 6, 6, 4),
    (7, 7, 7, 7, 7, 5),
    (8, 8, 8, 8, 8, 4),
    (9, 9, 9, 9, 9, 4),
    (10, 10, 10, 10, 10, 5),
    (11, 11, 11, 11, 11, 11),
    (12, 12, 12, 12, 12, 10),
    (13, 13, 13, 13, 13, 13),
    (14, 14, 14, 14, 14, 14),
    (15, 15, 15, 15, 15, 15),
    (16, 16, 16, 16, 16, 16),
    (17, 17, 17, 17, 17, 17),
    (18, 18, 18, 18, 18, 10),
    (19, 19, 19, 19, 19, 19),
    (20, 20, 20, 20, 20, 20),
    (21, 21, 21, 21, 21, 21),
    (22, 22, 22, 22, 22, 22),
    (23, 23, 23, 23, 23, 23),
    (24, 24, 24, 24, 24, 10),
    (25, 25, 25, 25, 25, 25),
    (26, 26, 26, 26, 26, 26),
    (27, 27, 27, 27, 27, 27),
    (28, 28, 28, 28, 28, 28),
    (29, 29, 29, 29, 29, 29),
    (30, 30, 30, 30, 30, 40),
    (31, 31, 31, 31, 31, 31),
    (32, 32, 32, 32, 32, 32),
    (33, 33, 33, 33, 33, 33),
    (34, 34, 34, 34, 34, 34),
    (35, 35, 35, 35, 35, 35),
    (36, 36, 36, 36, 36, 36),
    (37, 37, 37, 37, 37, 40),
    (38, 38, 38, 38, 38, 38),
    (39, 39, 39, 39, 39, 39),
    (40, 40, 40, 40, 40, 40),
    (41, 41, 41, 41, 41, 45),
    (42, 42, 42, 42, 42, 45),
    (43, 43, 43, 43, 43, 45),
    (44, 44, 44, 44, 44, 44),
    (45, 45, 45, 45, 45, 45),
    (46, 46, 46, 46, 46, 46),
    (47, 47, 47, 47, 47, 47),
    (48, 48, 48, 48, 48, 48),
    (49, 49, 49, 49, 49, 6),
    (50, 50, 50, 50, 50, 50);


-- this is an exaple of the lectures to generate the fisrt diagnose

INSERT INTO "compressor_lectures" (
    "discharge_pressure",
    "saturation_temperature_at_discharge_pressure",
    "suction_pressure",
    "saturation_temperature_at_suction_pressure",
    "current_suction_temperature",
    "compressor_crankcase_temperature",
    "cut_in_for_low_pressure",
    "cut_out_for_low_pressure",
    "oil_level_in_the_sight_glass",
    "num_phases",
    "voltage_l1",
    "voltage_l2",
    "voltage_l3",
    "amp_l1",
    "amp_l2",
    "amp_l3",
    "coil_resistance_(three-phase)",
    "coil_resistance_(single-phase)_common_start",
    "coil_resistance_(single-phase)_common_run",
    "compressor_id",
    "cooling_system_analysis_id",
    "lecture_datetime")
VALUES
(150.50, 56.45, 40.30, 21.80, 35.60, 65.20, 50.20, 45.10, 'full', 'three phase', 220.00, 225.00, 230.00, 15.00, 16.00, 14.50, 1.10, 1.50, 1.30, 1, 1, '2025-03-01 14:20:10'),
(145.20, 55.00, 42.00, 22.30, 34.50, 63.80, 49.90, 44.00, '3/4', 'single phase', 230.00, 235.00, 240.00, 18.00, 17.50, 16.00, 1.00, 1.40, 1.20, 2, 2, '2025-03-03 15:30:25'),
(155.00, 58.10, 43.50, 23.10, 36.20, 67.00, 52.00, 46.00, '1/2', 'three phase', 240.00, 245.00, 250.00, 20.00, 19.50, 18.00, 1.20, 1.60, 1.50, 3, 3, '2025-03-05 16:40:30'),
(160.40, 59.60, 45.20, 24.00, 37.00, 70.00, 53.30, 48.20, 'full', 'single phase', 210.00, 215.00, 220.00, 22.00, 21.50, 20.00, 1.15, 1.55, 1.35, 4, 4, '2025-03-07 17:50:40'),
(148.90, 54.30, 41.00, 22.00, 33.80, 62.10, 50.70, 43.90, '1/4', 'three phase', 225.00, 230.00, 235.00, 14.00, 15.00, 13.50, 1.05, 1.45, 1.25, 5, 5, '2025-03-09 18:00:15'),
(150.10, 56.00, 44.10, 23.20, 35.50, 64.20, 51.80, 46.40, '3/4', 'single phase', 220.00, 225.00, 230.00, 16.50, 16.00, 15.50, 1.12, 1.50, 1.40, 6, 6, '2025-03-10 19:20:45'),
(153.60, 57.30, 42.50, 23.50, 34.90, 65.10, 52.10, 47.50, 'empty', 'three phase', 210.00, 215.00, 220.00, 17.20, 16.80, 15.90, 1.08, 1.48, 1.28, 7, 7, '2025-03-12 20:35:55'),
(149.80, 55.80, 40.80, 22.80, 36.00, 68.30, 51.60, 45.80, 'full', 'single phase', 230.00, 235.00, 240.00, 19.60, 19.00, 18.20, 1.18, 1.58, 1.38, 8, 8, '2025-03-13 21:45:25'),
(156.00, 59.00, 46.00, 24.50, 37.50, 69.20, 54.50, 49.00, '1/2', 'three phase', 240.00, 245.00, 250.00, 21.80, 20.60, 19.30, 1.22, 1.62, 1.42, 9, 9, '2025-03-14 22:55:35'),
(152.70, 58.20, 43.90, 23.80, 35.80, 66.50, 52.90, 47.30, '1/4', 'single phase', 225.00, 230.00, 235.00, 18.40, 17.80, 16.70, 1.10, 1.50, 1.30, 10, 10,'2025-03-15 23:05:50');

INSERT INTO "expansion_valve_inlet_lectures" (
    "temperature_at_the_filter_dryer_inlet",
    "temperature_at_the_filter_dryer_outlet",
    "liquid_line_pressure",
    "saturated_temperature_at_condensation_pressure",
    "liquid_line_temperature",
    "liquid_sight_glass_condition",
    "expansion_valve_id",
    "cooling_system_analysis_id",
    "lecture_datetime"
)
VALUES
(12.50, 9.00, 150.00, 45.80, 13.00, 'full', 1, 1, '2025-03-01 14:20:10'),
(14.30, 11.50, 160.00, 47.20, 14.50, 'bubbles', 2, 2, '2025-03-03 15:30:25'),
(13.00, 10.80, 145.00, 44.50, 13.80, 'full', 3, 3, '2025-03-05 16:40:30'),
(15.10, 12.70, 155.00, 46.00, 15.20, 'bubbles', 4, 4, '2025-03-07 17:50:40'),
(11.90, 9.40, 140.00, 43.70, 12.30, 'full', 5, 5, '2025-03-09 18:00:15'),
(16.20, 13.00, 165.00, 48.50, 16.00, 'bubbles', 6, 6, '2025-03-10 19:20:45'),
(14.80, 11.90, 150.00, 45.00, 14.00, 'full', 7, 7, '2025-03-12 20:35:55'),
(13.70, 10.60, 148.00, 44.00, 13.60, 'bubbles', 8, 8, '2025-03-13 21:45:25'),
(12.80, 10.20, 155.00, 45.50, 12.90, 'full', 9, 9, '2025-03-14 22:55:35'),
(15.50, 12.90, 160.00, 47.30, 15.50, 'bubbles', 10, 10,'2025-03-15 23:05:50');

INSERT INTO "evaporator_outlet_lectures" (
    "id",
    "suction_pressure",
    "saturated_temperature_at_suction_pressure",
    "current_suction_temperature", "cold_room_temperature",
    "temperature_of_the_air_entering_the_evaporator",
    "evaporator_design_td",
    "evaporator_id",
    "cooling_system_analysis_id",
    "lecture_datetime")
VALUES
(1, 3.65, -5.42, 6.55, -1.25, 4.72, 9.40, 1, 1, '2025-03-01 14:20:10'),
(2, 5.32, 1.22, 7.98, 3.45, 5.14, 7.65, 2, 2, '2025-03-03 15:30:25'),
(3, 2.87, 0.91, 10.25, 4.89, 6.03, 8.50, 3, 3, '2025-03-05 16:40:30'),
(4, 4.21, -2.73, 12.07, 2.98, 7.52, 6.60, 4, 4, '2025-03-07 17:50:40'),
(5, 1.34, 5.60, 11.08, 5.11, 4.67, 9.20, 5, 5, '2025-03-09 18:00:15'),
(6, 6.02, -3.90, 8.60, 3.12, 5.98, 7.45, 6, 6, '2025-03-10 19:20:45'),
(7, 4.79, -1.57, 9.73, 2.40, 6.15, 7.35, 7, 7, '2025-03-12 20:35:55'),
(8, 3.11, 0.87, 8.20, 6.04, 5.89, 6.80, 8, 8, '2025-03-13 21:45:25'),
(9, 5.54, -0.55, 7.87, 3.98, 5.75, 8.10, 9, 9, '2025-03-14 22:55:35'),
(10, 2.90, 2.77, 10.15, 5.33, 6.32, 7.90, 10, 10, '2025-03-15 23:05:50');

INSERT INTO "condensing_unit_lectures"(
    "id",
    "room_temperature",
    "condenser_inlet_air_temperature",
    "condenser_outlet_air_temperature",
    "condensing_unit_id",
    "cooling_system_analysis_id",
    "lecture_datetime")
VALUES
(1, 23.45, 18.32, 25.67, 1, 1, '2025-03-01 14:10:05'),
(2, 24.56, 17.45, 26.12, 2, 2, '2025-03-02 15:20:10'),
(3, 22.89, 19.04, 27.38, 3, 3, '2025-03-03 16:30:15'),
(4, 25.10, 20.02, 28.56, 4, 4, '2025-03-04 17:40:20'),
(5, 23.78, 18.76, 25.98, 5, 5, '2025-03-05 18:50:25'),
(6, 21.99, 19.22, 26.89, 6, 6, '2025-03-06 19:00:30'),
(7, 24.43, 17.58, 27.15, 7, 7, '2025-03-07 20:10:35'),
(8, 23.12, 18.94, 26.47, 8, 8, '2025-03-08 21:20:40'),
(9, 22.56, 20.12, 28.01, 9, 9, '2025-03-09 22:30:45'),
(10, 24.12, 18.65, 27.34, 10, 10, '2025-03-10 23:40:50');

--- FREQUENT QUERIES ---
-- The following questions are answered with the following queries
-- What are the 3 problems that are most likely to affect the Devpoint company's cooling system according to the most recent reading?
-- first we find the id of the company
SELECT "id" FROM "companies" WHERE "company_name" = 'Devpoint';
-- Now we find the cooling systems related to the company Devpoint
SELECT * FROM "cooling_systems" WHERE "company_id" = (
    SELECT "id" FROM "companies"
    WHERE "company_name" = 'Devpoint'
);

-- Now we need to know what are the cooling system analysis ids for this cooling systems and filter the most recent lecture
SELECT "compressor_lectures"."cooling_system_analysis_id" FROM "compressor_lectures"
JOIN "expansion_valve_inlet_lectures" ON "expansion_valve_inlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
JOIN "evaporator_outlet_lectures" ON "evaporator_outlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
JOIN "condensing_unit_lectures" ON "condensing_unit_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
WHERE "condensing_unit_id" IN (
    SELECT "condensing_unit_id"
    FROM "cooling_systems"
    WHERE "company_id" = (
        SELECT "id" FROM "companies"
        WHERE "company_name" = 'Devpoint'
    )
) AND "compressor_id" IN (
    SELECT "compressor_id"
    FROM "cooling_systems"
    WHERE "company_id" = (
        SELECT "id" FROM "companies"
        WHERE "company_name" = 'Devpoint'
    )
) AND "evaporator_id" IN (
    SELECT "evaporator_id"
    FROM "cooling_systems"
    WHERE "company_id" = (
        SELECT "id" FROM "companies"
        WHERE "company_name" = 'Devpoint'
    )
) AND "expansion_valve_id" IN (
    SELECT "expansion_valve_id"
    FROM "cooling_systems"
    WHERE "company_id" = (
        SELECT "id" FROM "companies"
        WHERE "company_name" = 'Devpoint'
    )
) ORDER BY "compressor_lectures"."lecture_datetime" DESC LIMIT 1;

-- Now we need the diagnose for this cooling_system_analysis_id

SELECT "id" FROM "diagnoses"
WHERE "cooling_system_analysis_id" = (
    SELECT "compressor_lectures"."cooling_system_analysis_id" FROM "compressor_lectures"
    JOIN "expansion_valve_inlet_lectures" ON "expansion_valve_inlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
    JOIN "evaporator_outlet_lectures" ON "evaporator_outlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
    JOIN "condensing_unit_lectures" ON "condensing_unit_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
    WHERE "condensing_unit_id" IN (
        SELECT "condensing_unit_id"
        FROM "cooling_systems"
        WHERE "company_id" = (
            SELECT "id" FROM "companies"
            WHERE "company_name" = 'Devpoint'
        )
    ) AND "compressor_id" IN (
        SELECT "compressor_id"
        FROM "cooling_systems"
        WHERE "company_id" = (
            SELECT "id" FROM "companies"
            WHERE "company_name" = 'Devpoint'
        )
    ) AND "evaporator_id" IN (
        SELECT "evaporator_id"
        FROM "cooling_systems"
        WHERE "company_id" = (
            SELECT "id" FROM "companies"
            WHERE "company_name" = 'Devpoint'
        )
    ) AND "expansion_valve_id" IN (
        SELECT "expansion_valve_id"
        FROM "cooling_systems"
        WHERE "company_id" = (
            SELECT "id" FROM "companies"
            WHERE "company_name" = 'Devpoint'
        )
    ) ORDER BY "compressor_lectures"."lecture_datetime" DESC LIMIT 1
);

-- With this id we can look for the problems on problems_probabilities table and ordered by the most probable problems limited to 3
SELECT "description", "probability" FROM "problems_probabilities"
LEFT JOIN "possible_problems" ON "possible_problems"."id" = "problems_probabilities"."problem_id"
WHERE "diagnose_id" = (
    SELECT "id" FROM "diagnoses"
    WHERE "cooling_system_analysis_id" = (
        SELECT "compressor_lectures"."cooling_system_analysis_id" FROM "compressor_lectures"
        JOIN "expansion_valve_inlet_lectures" ON "expansion_valve_inlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
        JOIN "evaporator_outlet_lectures" ON "evaporator_outlet_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
        JOIN "condensing_unit_lectures" ON "condensing_unit_lectures"."cooling_system_analysis_id" = "compressor_lectures"."cooling_system_analysis_id"
        WHERE "condensing_unit_id" IN (
            SELECT "condensing_unit_id"
            FROM "cooling_systems"
            WHERE "company_id" = (
                SELECT "id" FROM "companies"
                WHERE "company_name" = 'Devpoint' --- This would be a variable
            )
        ) AND "compressor_id" IN (
            SELECT "compressor_id"
            FROM "cooling_systems"
            WHERE "company_id" = (
                SELECT "id" FROM "companies"
                WHERE "company_name" = 'Devpoint'
            )
        ) AND "evaporator_id" IN (
            SELECT "evaporator_id"
            FROM "cooling_systems"
            WHERE "company_id" = (
                SELECT "id" FROM "companies"
                WHERE "company_name" = 'Devpoint'
            )
        ) AND "expansion_valve_id" IN (
            SELECT "expansion_valve_id"
            FROM "cooling_systems"
            WHERE "company_id" = (
                SELECT "id" FROM "companies"
                WHERE "company_name" = 'Devpoint'
            )
        ) ORDER BY "compressor_lectures"."lecture_datetime" DESC LIMIT 1
    )
) ORDER BY "probability" DESC LIMIT 3;

-- NEXT QUESTION
-- Which are the companies with problems in their cooling systems?
-- we use the created view
SELECT "company_name" FROM "companies_with_problems";

-- NEXT QUESTION
-- Which company has the most cooling systems?
SELECT "companies"."id","company_name", COUNT("cooling_systems"."id") AS "num_of_cooling_systems" FROM "cooling_systems"
JOIN "companies" ON "companies"."id" = "cooling_systems"."company_id"
GROUP BY "company_id"
ORDER BY "num_of_cooling_systems" DESC LIMIT 1;

