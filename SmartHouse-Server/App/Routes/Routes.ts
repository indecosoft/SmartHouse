import KoaRouter from 'koa-router';
import Sensors from './Sensors';
import { verifyToken } from './../Token';
import Register from './auth/Register/Register';
import Login from './auth/Login/Login';
import House from './Add/House/House';
import Room from './Add/Room/Room';



const router = new KoaRouter({ prefix: '/api' });
export { router };


router
    .post("/sendEventToSensor", Sensors.sendEventToSensor)
    .post("/register", Register.registerUser)
    .post("/login", Login.loginUser)
    .get('/checkEmail', Register.checkEmail)
    .use(verifyToken)
    .post('/add/house', House.addHouse)
    .post('/set/defaultHouse', House.setDefaultHouse)
    .post('/add/room', Room.addRoom)
    .get('/get/roomTypes', Room.getRoomTypes)
    .post('/remove/room', Room.removeRoom)
    .post('/update/room', Room.updateRoom)
    .post('/add/deviceToRoom', Sensors.addSensor)
    .post('/remove/device', Sensors.deleteDevice)
    .get('/get/devicesByType', Sensors.getDevicesByType)
    .get('/get/unassignedDevices', Sensors.getUnassignedDevices)
    .post('/add/devicesToRoom', Sensors.devicesToRoom)
    .post('/remove/sensorFromRoom', Sensors.removeSensorFromRoom)
    .get('/get/device/lastState', Sensors.getSensorLastState)


// .post("/recordSensorData", SensorData.recordSensorData)