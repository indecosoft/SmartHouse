import { executeQuery } from "../../../Utils/db";
import * as query from '../../../Routes/routes.query';
import { readToken } from "../../../Token";

class House {
    constructor() { }
    async addHouse(ctx: any) {
        console.log(ctx.request.body);
        const tokenData: any = await readToken(ctx);
        if (ctx.request.body.houseName &&
            ctx.request.body.country &&
            ctx.request.body.county &&
            ctx.request.body.locality &&
            ctx.request.body.street &&
            ctx.request.body.number) {
            const data = await executeQuery(query.addHouse(tokenData.userId, ctx.request.body));
            console.log(data[0]);
            if (data[0]) {
                if (ctx.request.body.isDefault) {
                    await executeQuery(query.updateDefaultHouse(data[0].id, tokenData.userId));
                }
                ctx.body = data[0];

                ctx.status = 200;
            }


        } else {
            ctx.body = { error: 'Unprocessable entity' }
            ctx.status = 422;
        }


    }
    async setDefaultHouse(ctx: any) {

        const tokenData: any = await readToken(ctx);
        if (ctx.request.body.houseId) {
            const data = await executeQuery(query.updateDefaultHouse(ctx.request.body.houseId, tokenData.userId));
            console.log(data);
            if (data[0]?.defaultHouseId) {
                ctx.body = (await executeQuery(query.getHouseById(data[0].defaultHouseId)))[0]
                ctx.status = 200;
            }
            return;

        }
        ctx.body = { error: 'Unprocessable entity' }
        ctx.status = 422;

    }
}
export default new House();