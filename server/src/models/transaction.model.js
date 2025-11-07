import db from '../db/init';

class Transaction {

    constructor(cropAddress, fromAddresses, toAddresses, hash, previousHash, geoPoints, timestamps) {
        this.cropAddress = cropAddress;
        this.fromAddresses = fromAddresses;
        this.toAddresses = toAddresses;
        this.hash = hash;
        this.previousHash = previousHash;
        this.geoPoints = geoPoints;
        this.timestamps = timestamps;
    }

    async save() {
        return db.collection('transactions').add({
            'cropAddress': this.cropAddress,
            'fromAddresses': this.fromAddresses,
            'toAddresses': this.toAddresses,
            'hash': this.hash,
            'previousHash': this.previousHash,
            'geoPoints': this.geoPoints,
            'timestamps': this.timestamps,
        }).then(() => {
            return new Promise((resolve, reject) => {
                resolve(true)
            })
        }).catch((e) => {
            return new Promise((resolve, reject) => {
                reject(false)
            })
        })
    }
}

export default Transaction;