
import Koa from 'koa';
import jwt from 'jsonwebtoken';
import { encrypt, decrypt } from './cripting';
import { tokenKey } from './../config';

export function generateToken(data: Object) {
    return encrypt(jwt.sign(data, tokenKey));
}

export async function verifyToken(ctx: Koa.Context, next: (ctx: Koa.Context) => Promise<any>) {
    try {
        const bearerHeader: string = ctx.request.headers['authorization'];
        if (bearerHeader) {
            ctx.state.user = await checkToken(decrypt(bearerHeader.split(' ')[1]));
            return await next(ctx);
        }
        ctx.throw(401);
    } catch (error: any) {
        ctx.throw(error.status || 401, error.message || error);
    }
}

export async function readToken(ctx: Koa.Context) {
    return ctx.state.user = await checkToken(decrypt(ctx.request.headers['authorization'].split(' ')[1]));
}

export function checkToken(token: any) {
    return new Promise((res, rej) => {
        jwt.verify(token, tokenKey, (err: any, authData: any) => {
            if (err) {
                rej(err);
            }
            res(authData);
        });
    });
}
