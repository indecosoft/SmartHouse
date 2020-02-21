var net = require('net')
import { port } from '../config';
const aedes = require('aedes')();
export class App {
    constructor(private server?: any) {

        // listen on port 1883
        server = net.createServer(aedes.handle)

        server.listen(port, function () {
            console.log('server listening on port', port)
        })
        aedes.authorizeSubscribe = function (client: any, packet: any, callback: any) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                case 'SensorsSettingsChannel':
                    console.log('\x1b[33m%s', `Client ${client.id} subscribed to channel ${packet.topic}`);
                    return callback(null, packet);
                default:
                    console.log('\x1b[31m%s', `Client ${client.id} subscribed rej to channel ${packet.topic}`);
                    return callback(new Error('Wrong topic'));
            }
        };
        aedes.authorizePublish = function (client: any, packet: any, callback: any) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                case 'SensorsSettingsChannel':
                    return callback(null);
                default:
                    return callback(new Error('Wrong topic'))
            }
        }
        aedes.authorizeForward = function (client: any, packet: any) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                    return client.id === "Hub" ? packet : null;
                case 'SensorsSettingsChannel':
                    let obj = JSON.parse(packet.payload.toString());
                    return client.id === obj.macAddress.toUpperCase() ? packet : null;
                default:
                    return null;
            }
        }
        aedes.authenticate = function (client: any, username: any, password: any, callback: any) {

            callback(null, true, true);
        }
        console.log(`MQTT server running on port ${port}!`);
    }
}
