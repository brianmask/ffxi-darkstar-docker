USE dspdb;

UPDATE zone_settings SET zoneip = '{{ZONE_IP}}';

UPDATE zone_settings SET zoneip = '10.10.11.0' WHERE zonetype = '0';
UPDATE zone_settings SET zoneip = '10.10.11.1' WHERE zonetype = '1';
UPDATE zone_settings SET zoneip = '10.10.11.2' WHERE zonetype = '2';
UPDATE zone_settings SET zoneip = '10.10.11.3' WHERE zonetype = '3';
UPDATE zone_settings SET zoneip = '10.10.11.4' WHERE zonetype = '4';
UPDATE zone_settings SET zoneip = '10.10.11.5' WHERE zonetype = '5';
UPDATE zone_settings SET zoneip = '10.10.11.6' WHERE zonetype = '6';

UPDATE zone_settings SET zoneport = '54230' WHERE zonetype = '0';
UPDATE zone_settings SET zoneport = '54231' WHERE zonetype = '1';
UPDATE zone_settings SET zoneport = '54232' WHERE zonetype = '2';
UPDATE zone_settings SET zoneport = '54233' WHERE zonetype = '3';
UPDATE zone_settings SET zoneport = '54234' WHERE zonetype = '4';
UPDATE zone_settings SET zoneport = '54235' WHERE zonetype = '5';
UPDATE zone_settings SET zoneport = '54236' WHERE zonetype = '6';