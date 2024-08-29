const db = require("../../database/db")

// const bcrypt = requre("bcrypt")
// const jwt = require("jsonwebtoken")

const Login = async (req, res) => {

    const {username, password} = req.body

    const [result] = await db.query(
        "SELECT * FROM admin WHERE username = ? AND password = ?", [username, password]
    )

    if (!result) {
        return res.status(401).json({ title: "Wrong Credentials", message: "Wrong username and password" });
    }
    
    return res.status(200).json({ 
        title: "Login Successful", 
        message: "Whats up tanga", 
        adminID: result[0].admin_id,
        username: result[0].username,
        name: result[0].name
    });
}

module.exports = { 
    Login

};