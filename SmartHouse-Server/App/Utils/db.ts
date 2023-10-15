import { Pool, PoolClient } from 'pg';
import { db } from '../../config';
import { IQuery } from './models';

const pool = new Pool(db);

export function executeQuery(query: IQuery): any {
    return new Promise((res, rej) => {
        try {
            pool.connect(async (err: Error | null, client: PoolClient, release: () => any) => {
                if (err) {
                    console.log(`Error connecting db: ${err.message || err}!`);
                    rej(err);
                }
                res(await clientQuery(client, query, release));
            });
        } catch (error: any) {
            console.log(`Db error: ${error.message || error}!`);
            rej(error);
        }
    });
}

function clientQuery(client: PoolClient, query: IQuery, release: () => any) {
    return new Promise((res, rej) => {
        client.query(query.text, query.values, (error: Error | null, result: any) => {
            release();
            if (error) {
                console.log(`Error querying db: ${query.text} -> ${error.message || error}!`);
                rej(error);
            }
            res(result ? result.rows : []);
        });
    })
}