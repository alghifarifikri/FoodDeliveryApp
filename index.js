require('dotenv').config()

const express = require('express')
const cors = require('cors')
const multer = require('multer')
const redis = require('redis')
const bodyParser = require('body-parser')
const port = process.env.APP_PORT
const admin_app = require('./src/routes/admin_app')
const admin_resto = require('./src/routes/admin_resto')
const user = require('./src/routes/user')
const items = require('./src/routes/items')
const app = express()
const {auth, role_adminApp, role_adminResto, role_user} = require('./src/middleware')

app.use(bodyParser.urlencoded({extended:false})) 
app.use(bodyParser.json()) 
app.use(cors()) 

app.use('/admin_app', admin_app)
app.use('/admin_resto', admin_resto)
app.use('/user', user)
app.use('/items', items)

app.get('/', (req,res)=>{ 
    res.send('Hello World')
})

app.post('/', (req, res)=>{ 
    res.send(req.body)
})

app.listen(port, ()=>{ 
    console.log('app Listen on port 3000')
})
