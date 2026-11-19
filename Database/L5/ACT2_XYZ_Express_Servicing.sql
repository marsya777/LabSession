USE XYZ_Express_Servicing;

-- Q1
SELECT d.DriverNo, d.DriverName, d.JoinedDate
FROM Driver d JOIN Branch b ON d.BranchNo = b.BranchNo
WHERE b.BranchName = 'Kuala Terengganu';

-- Q2.1
SELECT j.Description, fd.ChargeAmount
FROM Job j, FleetDetails fd
WHERE j.JobId = fd.JobId AND fd.FleetNo = 9000003;

-- Q2.2
SELECT j.Description, fd.ChargeAmount
FROM Job j INNER JOIN FleetDetails fd ON j.JobId = fd.JobId
WHERE fd.FleetNo = 9000003;

-- Q3
SELECT d.DriverNo, d.DriverName, f.FleetNo, f.FleetStatus, v.PlatNumber
FROM Fleet f
JOIN Driver d  ON f.DriverNo  = d.DriverNo
JOIN Vehicle v ON f.VehicleNo = v.VehicleNo
WHERE f.FleetDate = '2016-01-15';

-- Q4
SELECT f.FleetNo, d.DriverName, fd.JobId
FROM Fleet f
JOIN Driver d        ON f.DriverNo = d.DriverNo
JOIN Branch b        ON d.BranchNo = b.BranchNo
JOIN FleetDetails fd ON f.FleetNo  = fd.FleetNo
WHERE f.FleetType = '02' AND b.BranchName = 'Besut';
