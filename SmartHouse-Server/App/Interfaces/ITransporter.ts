export default interface ITransporter {
    host: string;
    port: number;
    secure: boolean;
    auth: IAuth
}

interface IAuth {
    user: string;
    pass: string;
}