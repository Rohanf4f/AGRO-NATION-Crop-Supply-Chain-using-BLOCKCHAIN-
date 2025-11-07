import { Router } from 'express';
import { savecropDetails } from '../controllers/crop.controller'

const cropRouter = Router();

cropRouter.route('/save-details').post(savecropDetails);

export default cropRouter;