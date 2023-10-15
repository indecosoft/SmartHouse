export const db = {
    host: process.env.DB_URL,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    port: Number(process.env.DB_PORT),
    password: process.env.DB_PASSWORD,
    max: 20,
    idleTimeoutMillis: 30000,
    connectionTimeoutMillis: 2000
}
export const mqttServerAddress = process.env.MQTT_URL;
export const mqttOptions = {
    port: Number(process.env.MQTT_PORT),
    host: `mqrr://${process.env.MQTT_URL}`,
    clientId: '{"name" : "Hub"}',
    clean: true,
    encoding: 'utf8',
    username: 'matteo',
    password: '1234'
};

export const port = process.env.PORT || 8000;

export const tokenKey = '401b09eab3c013d4ca5492b0090fb922bb802bec8fd5318192b092b0090fb090fb92b0090fb337592b0090fb992b0090fb1abd3e44453b954592b0090fb55b7a0812e1081c39b740293f765eae731f5a65ed137591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed15f201d8b3727429090fb337591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed1';

export const secretKey = "(kj+-_W7x:zAtu(o3gN4MT2es[=E#|+I:_&y8-tQt2@6Q07ZdBIJmJr4p4WQ8BRHsKKSThVOcgbBYvTwVKkA6D9S14CZUKNFVZtjoWVAD53oopHhW};}}GD565?qD/YZ5lB9=w0?LM-ru[pUfUukH~-c461BF9FE4V=Op<(<ZB,{XPF5B6BEqBrXVcuqqRl6kJvIubouX3FqtHswSpQK58CB9selH!oV5WA<5y;cNEo-Yl.[R~|8]0(4FkveE8VcoEii5AxW9HqWUfs1lBqmtuyXCC3B36BD3E5168841QDFE+^DA}&vR)%Du@R~:5exW{)X[GaNh=Cttk|XQ,@U' ^ 5} +Jcc1ZQ)=24F2E4873CCCE54793FF685ADD9C5F";

export const cryptoKey = '401b09eab3c013d4ca5492b0090fb922bb802bec8fd5318192b092b0090fb090fb92b0090fb337592b0090fb992b0090fb1abd3e44453b954592b0090fb55b7a0812e1081c39b740293f765eae731f5a65ed137591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed15f201d8b3727429090fb338591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed1';

