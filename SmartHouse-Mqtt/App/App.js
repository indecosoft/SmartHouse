"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var net = require('net');
var config_1 = require("../config");
var aedes = require('aedes')();
var App = /** @class */ (function () {
    function App(server) {
        this.server = server;
        // listen on port 1883
        server = net.createServer(aedes.handle);
        server.listen(config_1.port, function () {
            console.log('server listening on port', config_1.port);
        });
        aedes.authorizeSubscribe = function (client, packet, callback) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                case 'SensorsSettingsChannel':
                    console.log('\x1b[33m%s', "Client " + client.id + " subscribed to channel " + packet.topic);
                    return callback(null, packet);
                default:
                    console.log('\x1b[31m%s', "Client " + client.id + " subscribed rej to channel " + packet.topic);
                    return callback(new Error('Wrong topic'));
            }
        };
        aedes.authorizePublish = function (client, packet, callback) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                case 'SensorsSettingsChannel':
                    return callback(null);
                default:
                    return callback(new Error('Wrong topic'));
            }
        };
        aedes.authorizeForward = function (client, packet) {
            switch (packet.topic) {
                case 'response':
                case 'SensorsConfigChannel':
                case 'SensorsDataChannel':
                    return client.id === "Hub" ? packet : null;
                case 'SensorsSettingsChannel':
                    var obj = JSON.parse(packet.payload.toString());
                    return client.id === obj.macAddress.toUpperCase() ? packet : null;
                default:
                    return null;
            }
        };
        aedes.authenticate = function (client, username, password, callback) {
            callback(null, true, true);
        };
        console.log("MQTT server running on port " + config_1.port + "!");
    }
    return App;
}());
exports.App = App;
