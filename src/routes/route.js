const { Login } = require("../controllers/Authentication/auth")
const { CreateOrder,
        UpdateOrder,
        DeleteOrder,
        GetOrder,
        GetOrders } = require("../controllers/Orders/order")
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
router.post("/order/void/:order_id", DeleteOrder)
router.get("/order/:order_id", GetOrder)
router.get("/orders", GetOrders)



module.exports = router