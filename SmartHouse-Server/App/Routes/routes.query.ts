export function getAllSensors() {
    return {
        text: `SELECT * FROM "Sensors"`,
        values: []
    }
}
export function insertSensor(sensorName: string, macAddress: string, sensorType: string, readingFrequency: number, defaultHouseId: number, ip: string) {
    return {
        text: `INSERT INTO "Sensors"("name", "macAddress", "sensorType", "readingFrequency", "houseId", "ip") VALUES ($1, $2, $3, $4, $5, $6)`,
        values: [sensorName, macAddress, sensorType, readingFrequency, defaultHouseId, ip]
    }
}
export function updateSensor(macAddress: string, networkStatus: string, ip: string) {
    return {
        text: `UPDATE "Sensors" SET "networkStatus" = $1, "ip"=$2 WHERE "macAddress" = $3`,
        values: [networkStatus, ip, macAddress]
    }
}
export function updateSensorStatus(macAddress: string, networkStatus: string) {
    return {
        text: `UPDATE "Sensors" SET "networkStatus" = $1  WHERE "macAddress" = $2`,
        values: [networkStatus, macAddress]
    }
}
export function getSensorName(macAddress: string) {
    return {
        text: `SELECT name FROM  "Sensors" WHERE "macAddress" = $1`,
        values: [macAddress]
    }
}
export function searchSensor(macAddress: string) {
    return {
        text: `SELECT count(*) FROM "Sensors" WHERE "macAddress" = $1`,
        values: [macAddress]
    }
}
export function recordSensorData(sensorId: number, data: any, date: any) {
    return {
        text: `INSERT INTO "SensorsData"("sensorId", data, "timestamp") VALUES ($1, $2, $3)`,
        values: [sensorId, data, date]
    }
}
export function sensorId(macAddress: string) {
    return {
        text: `SELECT id FROM "Sensors" WHERE "macAddress" = $1`,
        values: [macAddress]
    }
}

export function registerUser(user: User) {
    return {
        text: `INSERT INTO "Users" (email, password, salt, "firstName", "lastName") VALUES ($1, $2, $3, $4, $5) RETURNING id, "defaultHouseId", email, "firstName", "lastName";`,
        values: [user.email, user.password, user.salt, user.firstName, user.lastName]
    }
}
export function checkemail(email: any) {
    return {
        text: `SELECT count(*) FROM "Users" WHERE "email" = $1`,
        values: [email]
    }
}
export function loginUser(email: string, password: string) {
    return {
        text: `SELECT id, "firstName", "lastName", "defaultHouseId" FROM "Users" where email=$1 AND password= $2;`,
        values: [email, password]
    }
}

export function getHouseById(houseId: number) {
    return {
        text: `SELECT h.id, h."name", h."address",
        CASE WHEN COUNT(R.*) = 0 THEN '[]'::json
             ELSE json_agg(R.*)
        END as rooms
        FROM "Houses" as h
        LEFT JOIN "Rooms" R ON h.id = R."houseId"
        WHERE h.id = $1
        GROUP BY h.id, h."name", h."address";`,
        values: [houseId]
    }
}
export function getHousesExceptDefault(userId: number) {
    return {
        text: `SELECT h.id, h."name", h."address"
        FROM "Houses" as h
        right outer join "Users" u ON u.id  = ANY(h."userIds")
        WHERE u.id = $1 AND h.id != u."defaultHouseId"
        GROUP BY h.id, h."name", h."address";`,
        values: [userId]
    }
}

export function getUserSalt(email: string) {
    return {
        text: `SELECT salt FROM "Users" where email=$1;`,
        values: [email]
    }
}
export function getUserIdByEmail(email: string) {
    return {
        text: `SELECT id FROM "Users" where email=$1;`,
        values: [email]
    }
}

export function getDefaultHouseIdByEmail(email: string) {
    return {
        text: `SELECT "defaultHouseId" FROM "Users" where email=$1;`,
        values: [email]
    }
}

export function addHouse(userId: number, houseData: any) {
    return {
        text: `INSERT INTO "Houses" (name, "userIds", address) VALUES ($1, $2, $3) RETURNING *;`,
        values: [houseData.houseName,
        [userId],
        `${houseData.country}, ${houseData.county}, ${houseData.locality}, ${houseData.street}, ${houseData.number}`,]
    }
}

export function updateDefaultHouse(houseId: number, userId: number) {
    return {
        text: `UPDATE "Users" SET "defaultHouseId" = $1 WHERE id = $2 RETURNING "defaultHouseId";`,
        values: [houseId, userId]
    }
}

export function updateSensorRoom(roomId: number, macAddress: string) {
    return {
        text: `UPDATE "Sensors" SET "roomId" = $1 WHERE "macAddress" = $2 RETURNING *;`,
        values: [roomId, macAddress]
    }
}
export function deleteDevice(macAddress: string) {
    return {
        text: `DELETE FROM "Sensors"  WHERE "macAddress" = $1;`,
        values: [macAddress]
    }
}

export function addSensorWithoutRoom(sensorData: any) {
    return {
        text: `SELECT "AddSensorWithoutRoom"($1, $2, $3, $4, $5);`,
        values: [sensorData.sensorName,
        sensorData.sensorType, sensorData.macAddress, sensorData.readingFrequency, sensorData.userEmail]
    }
}
export function removeSensorFromRoom(macAddress: any) {
    // return {
    //     text: `Update "Sensors" set "idRoom" = null WHERE "macAddress" = $1;
    //     SELECT ("idRoom" IS NULL) AS RESPONSE FROM "Sensors" WHERE "macAddress" = $1;`,
    //     values: [macAddress]
    // }
    return {
        text: `SELECT "RemoveSensorFromRoom"($1);`,
        values: [macAddress]
    }
}
export function addRoom(houseId: number, typeId: number, roomName: string) {
    return {
        text: `INSERT INTO "Rooms"("houseId", "typeId", name) VALUES ($1, $2, $3) RETURNING *;`,
        values: [houseId, typeId, roomName]
    }
}

export function getRoomTypes() {
    return {
        text: `SELECT json_agg(rt.*) as "roomTypes" FROM "RoomTypes" as rt;`,
        values: []
    }
}

export function removeRoom(roomId: any) {
    return {
        text: `DELETE FROM "Rooms" WHERE id = $1;`,
        values: [roomId]
    }
}
export function updateRoom(roomName: string, roomId: number) {
    return {
        text: `UPDATE "Rooms" SET name = $1 WHERE id = $2;`,
        values: [roomName, roomId]
    }
}

export function getSensorLastState(sensorData: any) {
    return {
        text: `SELECT row_to_json(res)
        FROM (SELECT s.name, s."houseId",
                     CASE WHEN s."networkStatus" = 'online' THEN true ELSE false END as "isOnline",
                     CASE WHEN SD.data IS NOT NULL THEN SD.data ELSE '{"status": 0}'::json END as "state",
                     CASE WHEN sd."timestamp" IS NOT NULL THEN SD.timestamp END as "timestamp"
              FROM "Sensors" S
                       LEFT JOIN "SensorsData" SD on S.id = SD."sensorId"
              WHERE s."macAddress" = $1
              ORDER BY SD."timestamp" DESC
              LIMIT 1) res`,
        values: [sensorData.macAddress,]
    }
}

export function getSensorsByType(sensorType: number, houseId: number) {
    return {
        text: `SELECT id,"roomId", name,"houseId", CASE WHEN "networkStatus" = 'online' THEN true ELSE false END as "isOnline", "sensorType" as type, "macAddress", ip, "readingFrequency" FROM  "Sensors"  WHERE "sensorType" = $1 AND "houseId" = $2;`,
        values: [sensorType, houseId]
    }
}
export function getUnassignedDevices(houseId: number) {
    return {
        text: `SELECT id, name, "roomId", "houseId", CASE WHEN "networkStatus" = 'online' THEN true ELSE false END as "isOnline", "sensorType" as type, "macAddress", ip, "readingFrequency" FROM  "Sensors"  WHERE "houseId" = $1;`,
        values: [houseId]
    }
}

export function addSensorsToRoom(data: any) {
    return {
        text: `SELECT "AddSensorsToRoom"($1, $2);`,
        values: [data.roomId || null, data.devices]
    }
}

