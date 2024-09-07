const db = require("../../database/db")

// const bcrypt = requre("bcrypt")
const jwt = require("jsonwebtoken")
require('dotenv').config();

const Login = async (req, res) => {

    const {username, password} = req.body

    const [result] = await db.query(
        "SELECT * FROM admin WHERE username = ? AND password = ?", [username, password]
    )

    if (!result) {
        return res.status(401).json({ title: "Wrong Credentials", message: "Wrong username and password" });
    }

    const token = jwt.sign(
        {username: username},
        process.env.JWT_TOKEN,
        {expiresIn: '1d'}
    )
    
    return res.status(200).json({ 
        title: "Success", 
        msg: "Login Successful!",
        adminID: result[0].admin_id,
        username: result[0].username,
        name: result[0].name,
        token: token
    });
}

module.exports = { 
    Login

};