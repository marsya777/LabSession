USE XYZ_Express_Servicing;

-- Requirement 1
SELECT j.JobId, j.Description, fd.FleetNo
FROM Job j LEFT JOIN FleetDetails fd ON j.JobId = fd.JobId;

-- Requirement 2
SELECT v.VehicleNo, v.PlatNumber, f.FleetNo
FROM Fleet f RIGHT JOIN Vehicle v
  ON f.VehicleNo = v.VehicleNo AND f.FleetType = '02';
