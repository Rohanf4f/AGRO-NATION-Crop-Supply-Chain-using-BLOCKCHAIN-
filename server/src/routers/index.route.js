import { Router } from 'express';
import cropRouter from './crop.router';
import rawMaterialRouter from './raw-material.router';
import transactionRouter from './transaction.router';

const router = Router();

router.use('/crop', cropRouter);
router.use('/raw-material', rawMaterialRouter);
router.use('/transaction', transactionRouter);

export default router;