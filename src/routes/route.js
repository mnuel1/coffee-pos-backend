const { Login } = require("../controllers/Authentication/auth")

const express = require('express');
const router = express.Router();


router.post("/login", Login);



module.exports = router