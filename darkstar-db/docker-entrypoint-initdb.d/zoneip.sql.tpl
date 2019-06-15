USE dspdb;
UPDATE zone_settings SET zoneip = '{{ZONE_IP}}';
UPDATE zone_settings SET zoneport = '54230' WHERE zonetype = '0';
UPDATE zone_settings SET zoneport = '54231' WHERE zonetype = '1';
UPDATE zone_settings SET zoneport = '54232' WHERE zonetype = '2';
UPDATE zone_settings SET zoneport = '54233' WHERE zonetype = '3';
UPDATE zone_settings SET zoneport = '54234' WHERE zonetype = '4';
UPDATE zone_settings SET zoneport = '54235' WHERE zonetype = '5';
UPDATE zone_settings SET zoneport = '54236' WHERE zonetype = '6';

ALTER TABLE `zone_settings` ADD `internalip` TINYTEXT NOT NULL AFTER `zoneport`;
UPDATE zone_settings SET internalip = '172.31.0.6' WHERE zonetype = '0';
UPDATE zone_settings SET internalip = '172.31.0.7' WHERE zonetype = '1';
UPDATE zone_settings SET internalip = '172.31.0.8' WHERE zonetype = '2';
UPDATE zone_settings SET internalip = '172.31.0.9' WHERE zonetype = '3';
UPDATE zone_settings SET internalip = '172.31.0.10' WHERE zonetype = '4';
UPDATE zone_settings SET internalip = '172.31.0.11' WHERE zonetype = '5';
UPDATE zone_settings SET internalip = '172.31.0.12' WHERE zonetype = '6';