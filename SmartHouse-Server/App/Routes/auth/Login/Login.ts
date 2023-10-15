import { generateToken } from "../../../Token";
import { executeQuery } from "../../../Utils/db";
import * as query from '../../routes.query';
var jwt = require('jsonwebtoken');
var crypto = require('crypto');


class Login {
    constructor() { }
    async loginUser(ctx: any) {

        console.log(ctx.request.body);
        if (ctx.request.body.email &&
            ctx.request.body.password) {
            const userSalt = (await executeQuery(query.getUserSalt(ctx.request.body.email)))[0]?.salt;
            console.log(userSalt);
            if (userSalt) {
                var hash = crypto.createHash('sha512');
                console.log(ctx.request.body.password);
                const userPass = hash.update(ctx.request.body.password + userSalt, 'utf-8').digest('hex')
                console.log(userPass);
                const response = (await executeQuery(query.loginUser(ctx.request.body.email, userPass)))[0];

                console.log(response);
                if (response) {
                    ctx.body = {
                        token: await generateToken({ userId: response.id, email: ctx.request.body.email }),
                        user: { id: response.id, firstName: response.firstName, lastName: response.lastName, email: ctx.request.body.email, },
                        defaultHouse: (await executeQuery(query.getHouseById(response.defaultHouseId)))[0],
                        houses: (await executeQuery(query.getHousesExceptDefault(response.id)))
                    };
                    ctx.status = 200;
                } else {
                    ctx.body = { error: "Invalid credentials" };
                    ctx.status = 401;
                }

            } else {
                ctx.body = { error: "User does not exist" };
                ctx.status = 401;
            }

        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 402;
        }
    }
}
export default new Login(); 