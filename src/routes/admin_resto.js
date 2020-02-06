require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const multer = require('multer')
const storage = multer.diskStorage(
    {destination : function(req, file, cb){
        cb(null, './storage/image')
    },
    filename : function(req, file, cb){
        cb(null, file.originalname)
    }
})
var upload = multer({storage:storage})
const {auth, role_adminResto} = require('../middleware') 

/* login for admin restaurant */
router.post('/loginresto', (req, res)=>{
    const {username, password} = req.body
    const user = `SELECT * FROM admin_resto WHERE username = ?`
    mysql.execute(user, [username], (err, result, field)=>{
        const roles= result[0].id_role
        if(result.length > 0){
            if(bcrypt.compareSync(password, result[0].password)){
                const auth = jwt.sign({username}, process.env.APP_KEY)
                created_on = new Date()
                updated_on = new Date()
                const token = auth
                const is_revoked = 0
                const priv = `insert into revoked_token (token, is_revoked, created_on, updated_on) values (?,?,?,?)`

                mysql.execute(priv, [token, is_revoked, created_on, updated_on], (err, result, field)=>
                {
                res.send({
                    success: true,
                    auth,
                    data : roles
                })
            })
            } else {
                res.send({
                    success: false,
                    msg: 'Incorrect Password'
                })
            }
        } else {
            res.send({
                success: false,
                msg: 'Username not Found'
            })
        }
    })
})

router.put('/forgotpassword', (req, res) => {
    const {username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const sql = `UPDATE admin_resto SET password = ? where username = ?`
    mysql.execute(sql, [enc_pass, username], (err, result, field) => {
        res.send({succcess: true, data: result})
    })
})

/* ------------------------------------------------------------------------------------------*/

/* input item_data */
router.post('/input_itemdata', auth, role_adminResto, upload.single('image'), (req, res)=>{
    const image = (req.file.originalname)
    const {id_categories, id_resto, name, price, descriptions} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO item_data (id_categories, id_resto, name, price, descriptions, image, created_on, updated_on) VALUES (?,?,?,?,?,?,?,?)`

    mysql.execute(sql, [id_categories, id_resto, name, price, descriptions, image, created_on, updated_on], 
        (err, result, field)=>{
            res.send(result)
        })
})

/* ------------------------------------------------------------------------------------------*/

/* select item data */
router.get('/itemdata/', auth, role_adminResto, (req, res)=>{
    const {id_resto} = req.body
    mysql.execute(`SELECT * FROM item_data WHERE id_resto = ?`, [id_resto], (err, result, field)=>{  
        res.send(result) 
    })
})

/* select Restaurant Data */ 
router.get('/restaurantdata/', auth, role_adminResto, (req, res)=>{ 
    const {id_resto} = req.body
    mysql.execute('SELECT * FROM restaurant_data WHERE id_resto = ?', [id_resto], (err, result, field)=>{ 
        res.send(result)
    }) 
}) 

/* ------------------------------------------------------------------------------------------*/

/* update account admin_resto */
router.put('/update_admin/:id', auth, role_adminResto, (req,res)=> {   
    const id_resto = req.params.id
    const {username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const updated_on = new Date()
    const sql = `UPDATE admin_resto SET username = ?, password = ?, updated_on = ? WHERE id_resto = ?`

        mysql.execute(sql, [username, enc_pass, updated_on, id_resto], (err, result, field)=>{
            res.send(result)
                })
            }) 
            
            /* update item data */
router.put('/update_item/:id', auth, role_adminResto, upload.single('image'), (req,res)=> {
    const id_item = req.params.id
    const image = (req.file.originalname) 
    const {id_categories, id_resto, name, price, descriptions} = req.body
    const updated_on = new Date()
    const sql = `UPDATE item_data SET id_categories = ?, id_resto = ?, name = ?, price = ?, descriptions = ?, image  = ?, updated_on = ? 
                WHERE id_item = ?`
        mysql.execute(sql, [id_categories, id_resto, name, price, descriptions, image, updated_on, id_item], (err, result, field)=>{
            res.send(result)
                })
    }) 
 
    /* update restaurant data */
router.put('/update_restaurant/:id', auth, role_adminResto, upload.single('logo'), (req,res)=> {
    const logo = (req.file.originalname) 
    const id_resto = req.params.id
    const {name_resto, longitude, latitude, descriptions} = req.body
    const updated_on = new Date()
    const sql = `UPDATE restaurant_data SET name_resto = ?, logo = ?, longitude = ?, latitude = ?, descriptions = ?, updated_on = ? 
                WHERE id_resto = ?`

        mysql.execute(sql, [name_resto, logo, longitude, latitude, descriptions, updated_on, id_resto], (err, result, field)=>{
            res.send(result)
            
                })
    }) 

/* ------------------------------------------------------------------------------------------*/

/* delete item_data */
router.delete('/item/:id', auth, role_adminResto, (req, res)=>{
    const id_item = req.params.id
    const sql = `DELETE from item_data WHERE id_item = ?`

    mysql.execute(sql, [id_item], (err, result, field)=>{
        res.send(result)
    })
})

router.put('/logout', auth, (req, res)=>{
    const token = req.headers.auth_token
    const is_revoked = 1
    const sql = `UPDATE revoked_token set is_revoked = ? WHERE token = ?`
    mysql.execute(sql, [is_revoked,token], (err, result, field)=>{
        res.send({result,
                  msg : req.headers.auth_token})
       
    })
})

module.exports = router