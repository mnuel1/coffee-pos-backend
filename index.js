const express = require('express');
const app = express();
const cors = require('cors');
const morgan = require('morgan');


const router = require("./src/routes/route")

require('dotenv').config();

app.use(morgan('tiny'));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}))
app.use(router)



app.listen(process.env.PORT, () => {
    console.log(`Server is running on http://localhost:${process.env.PORT}`);
});