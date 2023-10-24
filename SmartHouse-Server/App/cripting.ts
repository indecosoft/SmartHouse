import crypto from 'crypto';

import { cryptoKey } from './../config';

export function encrypt(text: string, secret: string = cryptoKey) {
    const iv = crypto.randomBytes(16);
    let cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(secret.substring(0, 32)), iv);
    let encrypted = cipher.update(text);

    encrypted = Buffer.concat([encrypted, cipher.final()]);

    return iv.toString('hex') + ':' + encrypted.toString('hex');
}

export function decrypt(text: string, secret: string = cryptoKey) {
    let textParts = text.split(':');
    let iv = Buffer.from(textParts[0], 'hex');
    let encryptedText = Buffer.from(textParts[1], 'hex');

    let decipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(secret.substring(0, 32)), iv);
    let decrypted = decipher.update(encryptedText);
    decrypted = Buffer.concat([decrypted, decipher.final()]);
    return decrypted.toString();
}

export function fromHex(hex: any) {
    let str: any;
    try {
        str = decodeURIComponent(hex.replace(/(..)/g, '%$1'));
    }
    catch (e) {
        str = hex;
        console.log('invalid hex input: ' + hex)
    }
    return str;
}
export function toHex(str: any) {
    let hex: any;
    try {
        hex = unescape(encodeURIComponent(str))
            .split('').map(function (v) {
                return v.charCodeAt(0).toString(16);
            }).join('') as any;
    }
    catch (e) {
        hex = str;
        console.log('invalid text input: ' + str);
    }
    return hex;
}