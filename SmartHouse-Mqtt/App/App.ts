var net = require('net')
import { port } from '../config';
const aedes = require('aedes')();
export class App {

    isJson(str: string) {
        try {
            JSON.parse(str);
        } catch (e) {
            console.error(e);
            return false;
        }
        return true;
    }

    constructor(private server?: any) {

        // listen on port 1883
        server = net.createServer(aedes.handle)

        server.listen(port, function () {
            console.log('server listening on port', port)
        });
        aedes.authorizeSubscribe = (client: any, packet: any, callback: any) => {
            // console.log(client); 
            if (!this.isJson(client.id)) {
                return callback(new Error(`Invalid device -> ${client.id}`));
            } else {
                console.log('\x1b[33m%s', `Client ${client.id} subscribed to channel ${packet.topic}`);

                switch (packet.topic) {
                    case 'response':
                        return callback(null, packet);
                    case 'SensorsDataChannel':

                        return callback(null, packet);

                    case 'SensorsStatusChannel':
                        return callback(null, packet);
                    case 'SensorsConfigChannel':

                        return callback(null, packet);
                    case 'SensorsSettingsChannel': // only sensors 
                        const data = { client: client ? client.id : client, status: 'online' };
                        const payload = {
                            cmd: 'publish',
                            topic: 'SensorsStatusChannel',
                            payload: new Buffer(JSON.stringify(data)),
                        }
                        aedes.publish(payload);
                        return callback(null, packet);
                    default:
                        console.log('\x1b[31m%s', `Client ${client.id} subscribed rej to channel ${packet.topic}`);
                        return callback(new Error('Wrong topic'));
                }
            }
            

        };
        aedes.on('unsubscribe', (subscriptions: any, client: any) => {
            console.log('unsubscribe', subscriptions);
            console.log('unsubscribe',client.id);
            if(this.isJson(client.id) && JSON.parse(client.id).account){
                console.log('MQTT device \x1b[32m' + (client ? client.id : client) +
                '\x1b[0m unsubscribed to topics: ' + subscriptions.join('\n'), 'from broker', aedes.id);
                
                if(subscriptions[0] == 'SensorsSettingsChannel') {
                    console.log('status changed');
                    const data = { client: client ? client.id : client, status: 'offline' };
                    const payload = {
                        cmd: 'publish',
                        topic: 'SensorsStatusChannel', 
                        payload: new Buffer(JSON.stringify(data)),
                    }
                    aedes.publish(payload);
                }
                
            } else {
                console.log('MQTT hub/user \x1b[32m' + (client ? client.id : client) +
                '\x1b[0m unsubscribed to topics: ' + subscriptions.join('\n'), 'from broker', aedes.id)
            }
            
        });
        aedes.authorizePublish = (client: any, packet: any, callback: any) =>{
            // if (!this.isJson(packet.payload.toString())){
            //     console.error(`Invalid packet was sent from client -> ${client.id}`);
            //     callback(new Error('Invalid packet'));
            // } else {
                switch (packet.topic) {
                    case 'response':
                    case 'SensorsConfigChannel':
                    case 'SensorsDataChannel':
                    case 'SensorsStatusChannel':
                    case 'SensorsSettingsChannel':
                        return callback(null);
                    default:
                        return callback(new Error('Wrong topic'));
                }
            // }
            
        };
        aedes.authorizeForward =  (client: any, packet: any) => {
            console.log('authorizeForward ' + client.id);
            console.log('authorizeForward topic ' + packet.topic);
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                    if (this.isJson(client.id)) {
                        console.log('SensorsDataChannel ' + client.id.toString());
                        if (JSON.parse(client.id.toString()).name === JSON.parse(packet.payload.toString()).account || JSON.parse(client.id.toString()).name === 'Hub')
                            return packet;
                    }
                    return null;
                case 'SensorsStatusChannel':
                    // return client.id === "Hub" ? packet : null;
                    
                    if (this.isJson(client.id)) {
                        console.log('SensorsStatusChannel ' + client.id.toString());
                        console.log('SensorsStatusChannel payload ' + packet.payload.toString());
                        let obj = JSON.parse(packet.payload.toString());
                        if (JSON.parse(client.id.toString()).name === JSON.parse(obj.client).account || JSON.parse(client.id.toString()).name === 'Hub')
                            return packet;
                    }
                    return null;
                case 'SensorsSettingsChannel':
                    if (this.isJson(packet.payload.toString())) {
                        let obj = JSON.parse(packet.payload.toString());
                        console.log('objjjj', obj);
                        console.log('client iddddd', JSON.parse(client.id.toString()));
                        return JSON.parse(client.id.toString()).name === obj.macAddress.toUpperCase() ? packet : null; 
                    } return null;

                default:
                    return null;
            }
        };
        aedes.authenticate = function (client: any, username: any, password: any, callback: any) {

            callback(null, true, true);
        };
        console.log(`MQTT server running on port ${port}!`);
    }
    
}
