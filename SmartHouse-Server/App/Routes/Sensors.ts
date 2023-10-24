import mqttConnection from './../Utils/Mqtt';
import { executeQuery } from '../Utils/db';
import * as query from './../Routes/routes.query';


class Sensors {
    constructor() { }
    async sendEventToSensor(ctx: any) {
        const payload = {
            macAddress: ctx.request.body.macAddress,
            event: ctx.request.body.event,
            config: ctx.request.body.config
        }
        console.log('aaaa', JSON.stringify(payload));
        await mqttConnection.mqttConnection.publish("SensorsSettingsChannel", JSON.stringify(payload));

        ctx.body = { message: "event sent successfully" };


    }
    async getSensorLastState(ctx: any) {
        console.log('query', ctx.request.query);
        if (ctx.request.query.macAddress) {
            const data = await executeQuery(query.getSensorLastState(ctx.request.query));
            console.log(data);
            ctx.status = 200;
            ctx.body = data[0].row_to_json;
        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }
    }
    async getDevicesByType(ctx: any) {
        console.log('query', ctx.request.query);
        if (ctx.request.query.type && ctx.request.query.houseId) {
            const data = await executeQuery(query.getSensorsByType(ctx.request.query.type, ctx.request.query.houseId));
            console.log('data');
            console.log(data);

            ctx.status = 200;
            ctx.body = data;
        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }
    } async getUnassignedDevices(ctx: any) {
        console.log('query', ctx.request.query);
        if (ctx.request.query.houseId) {
            const data = await executeQuery(query.getUnassignedDevices(ctx.request.query.houseId));
            ctx.status = 200;
            ctx.body = data;
        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }
    }
    async addSensor(ctx: any) {

        let obj = ctx.request.body;
        console.log(obj);

        if (obj.macAddress
        ) {

            const data = await executeQuery(query.updateSensorRoom(obj.roomId, obj.macAddress));
            console.log(data);
            if (data[0]) {

                ctx.body = {
                    id: data[0].id,
                    roomId: data[0].roomId,
                    houseId: data[0].houseId,
                    macAddress: data[0].macAddress,
                    readingFrequency: data[0].readingFrequency,
                    ip: data[0].ip,
                    name: data[0].name,
                    isOnline: data[0].networkStatus == 'online',
                    type: data[0].sensorType,
                };
                ctx.status = 200;
            } else {
                ctx.body = { error: "Room doesn\'t exist" };
                ctx.status = 500;
            }



        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }

    }

    async deleteDevice(ctx: any) {

        let obj = ctx.request.body;
        console.log(obj);

        if (obj.macAddress) {

            try {

                await mqttConnection.mqttConnection.publish("SensorsSettingsChannel", JSON.stringify({
                    event: 'reset',
                    macAddress: obj.macAddress,
                }));


                const data = await executeQuery(query.deleteDevice(obj.macAddress));
                console.log(data);


                ctx.body = {
                    message: 'Device deleted successfully'
                };
                ctx.status = 200;
            }

            catch (e) {
                ctx.body = { error: "Room doesn\'t exist" };
                ctx.status = 500;
            }



        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }

    }

    async devicesToRoom(ctx: any) {

        let obj = ctx.request.body;
        console.log(obj);
        ctx.status = 200;
        if (
            obj.macAddresses && obj.roomId) {
            let devices = []
            for (let macAddress of obj.macAddresses) {
                console.log(macAddress);
                const data = await executeQuery(query.updateSensorRoom(obj.roomId, macAddress));
                devices.push({
                    id: data[0].id,
                    roomId: data[0].roomId,
                    houseId: data[0].houseId,
                    macAddress: data[0].macAddress,
                    readingFrequency: data[0].readingFrequency,
                    ip: data[0].ip,
                    name: data[0].name,
                    isOnline: data[0].networkStatus == 'online',
                    type: data[0].sensorType,
                })
            }


            ctx.body = devices;
            ctx.status = 200;

        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }

    }
    async removeSensorFromRoom(ctx: any) {

        let obj = ctx.request.body;
        console.log(obj);

        if (obj.macAddress) {
            const data = await executeQuery(query.removeSensorFromRoom(obj.macAddress));
            console.log(data);
            if (data[0].RemoveSensorFromRoom) {
                if ('response' in data[0].RemoveSensorFromRoom) {
                    ctx.body = {
                        success: data[0].RemoveSensorFromRoom.response == true ?
                            'Device removed successfully' : 'Device cannot be removed',
                    };
                    ctx.status = 200;
                } else if (data[0].RemoveSensorFromRoom.error) {
                    ctx.body = {
                        error: data[0].RemoveSensorFromRoom.error,
                    };
                    ctx.status = 200;
                } else {
                    ctx.body = {
                        error: "Unexpected error",
                    };
                    ctx.status = 500;
                }
            } else {
                ctx.body = { error: 'Database error' };
                ctx.status = 500;
            }

        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }

    }
}
export default new Sensors();