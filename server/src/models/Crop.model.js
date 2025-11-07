import db from '../db/init';

class crop {

    constructor(cropAddress, description, quantity, rawMaterialAddress) {
        this.cropAddress = cropAddress;
        this.description = description;
        this.quantity = quantity;
        this.rawMaterialAddress = rawMaterialAddress;
    }

    async save() {
        return db.collection('crops').add({
            'cropAddress': this.cropAddress,
            'description': this.description,
            'quantity': this.quantity,
            'rawMaterialAddress': this.rawMaterialAddress
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

export default crop;