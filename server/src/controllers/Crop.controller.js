import crop from '../models/crop.model';

const savecropDetails = async (req, res) => {
    let crop = new crop(req.body.cropAddress, req.body.description, req.body.quantity, req.body.rawMaterialAddress);
    let returnValue = await crop.save();
    if (returnValue) {
        res.status(201).send({
            'message': 'Saved!',
            'error': false
        });
    } else {
        res.status(201).send({
            'message': 'Saved!',
            'error': true
        });
    }
}

export { savecropDetails };