import { generateToken } from "../../../Token";
import { executeQuery } from "../../../Utils/db";
import * as query from '../../routes.query';
var crypto = require('crypto');
import { v4 as uuidv4 } from 'uuid';

class Register {
    constructor() { }
    async registerUser(ctx: any) {
        if (ctx.request.body.firstName &&
            ctx.request.body.lastName &&
            ctx.request.body.email &&
            ctx.request.body.password) {
            if ((await executeQuery(query.checkemail(ctx.request.body.email)))[0].count > 0) {
                ctx.body = { error: "An account with this email already exist" };
                ctx.status = 409;
            } else {
                var hash = crypto.createHash('sha512');
                const userSalt = uuidv4();
                console.log(ctx.request.body.password);
                console.log(userSalt);
                console.log(ctx.request.body.password + userSalt);
                const user = (await executeQuery(query.registerUser({
                    firstName: ctx.request.body.firstName,
                    lastName: ctx.request.body.lastName,
                    email: ctx.request.body.email,
                    password: hash.update(ctx.request.body.password + userSalt, 'utf-8').digest('hex'),
                    salt: userSalt,
                })))[0]
                if (user) {
                    ctx.body = {
                        token: await generateToken({ userId: user.id, email: user.email }),
                        user: { id: user.id, firstName: user.firstName, lastName: user.lastName, email: user.email, },
                        defaultHouse: (await executeQuery(query.getHouseById(user.defaultHouseId)))[0]
                    };
                    ctx.status = 201;
                } else {
                    ctx.body = { error: "Error creating account" };
                    ctx.status = 500;
                }

            }

        } else {
            ctx.body = { error: 'Missing required fields' }
            ctx.status = 400;
        }
    }
    async checkEmail(ctx: any) {

        if (ctx.request.query.email) {
            // if ((await executeQuery(query.checkemail(ctx.request.query.email)))[0].count > 0) {
            //     ctx.body = { error: "An account with this email already exist" };
            //     ctx.status = 500;
            // } else {
            ctx.body = { error: "Email doesn't exist" };
            ctx.status = 200;
            // }

        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 401;
        }
    }
}
export default new Register();