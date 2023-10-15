export interface IFarm {
    type: string,
    coordinates: Array<Array<number>>
}

export interface IQuery {
    text: string,
    values: Array<any>
}

export interface Login {
    id?: number,
    email: string,
    password: string
} 

export interface Register {
    user: string,
    telefon?: string,
    adresa?: string,
    email: string,
    parola: string,
    cod?: string
}

export interface PasswordReset {
    email: string,
    parola: string
}

export interface OAuth {
    id: number | string,
    user: string,
    telefon?: string,
    email: string,
    idToken: string,
    cod?: string
}

export const OauthType = {
    google: 'google',
    facebook: 'facebook'
}

export interface ITreatment {
    idProblema: number,
    meds: Array<IMeds>
}

interface IMeds {
    substanta: string,
    cantitate: number
}
