const { Login } = require("../controllers/Authentication/auth")
const { 
    CreateOrder,
    UpdateOrder,
    DeleteOrder,
    GetOrder,
    GetOrders } = require("../controllers/Orders/order")

const { 
    ProcessPayment,
    RefundPayment,
    GetHistory } = require("../controllers/Payment Process/process")


const VerifyAdmin = require("../middleware/middleware")
const express = require('express');
const router = express.Router();

/* 
 * AUTHENTICATION ROUTE
 * 
 * 
 **/ 

router.post("/login", Login);


/* 
 * ORDER MANAGEMENT ROUTE
 * 
 * 
 **/
router.post("/order", CreateOrder)
router.post("/update/order", UpdateOrder)
router.post("/order/void/:order_id", DeleteOrder)
router.get("/order/:order_id", GetOrder)
router.get("/orders", GetOrders)


/* 
 * PAYMENT-PROCESSING ROUTE
 * 
 * 
 **/

router.post("/payment", ProcessPayment)
router.post("/refund", RefundPayment)
router.get("/payment",  GetHistory)

module.exports = router