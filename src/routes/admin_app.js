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
const {auth, role_adminApp} = require('../middleware')  

/* login for admin */
router.post('/loginadmin', (req, res)=>{
    const {username, password} = req.body
    const user = `SELECT * FROM admin_app WHERE username = ?`
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

/* ------------------------------------------------------------------------------------------*/

/* register account for admin */
router.post('/registeradmin', (req, res)=>{
    const {id_role, username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO admin_app (id_role, username, password, created_on, updated_on) VALUES (1,?,?,?,?)`

    mysql.execute(sql, [username, enc_pass, created_on, updated_on], 
        (err, result, field)=>{
            res.send(result)            
        })
}) 

/* register account for admin resto */
router.post('/registeradminresto', auth, role_adminApp, (req, res)=>{
    const {id_role, username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO admin_resto (id_role, username, password, created_on, updated_on) VALUES (2,?,?,?,?)`

    mysql.execute(sql, [username, enc_pass, created_on, updated_on], 
        (err, result, field)=>{
            res.send(result)            
        })
})

/* input restaurant_data */
router.post('/input_restaurantdata', auth, role_adminApp, upload.single('logo'), (req, res)=>{  
    const logo = (req.file.originalname)
    const {name_resto, longitude, latitude, descriptions} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO restaurant_data (name_resto, logo, longitude, latitude, descriptions, created_on, updated_on) VALUES (?,?,?,?,?,?,?)`
    mysql.execute(sql, [name_resto, logo, longitude, latitude, descriptions, created_on, updated_on], 
        (err, result, field)=>{
            res.send(result)
        })
})

/* input role */
router.post('/role', auth, role_adminApp, (req, res)=>{
    const {name} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO roles (name) VALUES (?)`

    mysql.execute(sql, [name], 
        (err, result, field)=>{
            console.log(err)
            res.send(result)
        })
})

/* input categories */
router.post('/categories', auth, role_adminApp, (req, res)=>{
    const {category} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO categories (category, created_on, updated_on) VALUES (?,?,?)`

    mysql.execute(sql, [category, created_on, updated_on], 
        (err, result, field)=>{
            res.send(result)
        })
})

/* ------------------------------------------------------------------------------------------*/

/* select account admin */
router.get('/infoadmin', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT id_admin, username FROM admin_app', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select account user */
router.get('/infouser', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT * FROM user', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select admin_resto */
router.get('/infoadminresto', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT * FROM admin_resto', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select Restaurant Data */
router.get('/restaurantdata', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT * FROM restaurant_data', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select role */
router.get('/inforole', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT * FROM roles', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select categories */
router.get('/infocategories', auth, role_adminApp, (req, res)=>{
    mysql.execute('SELECT * FROM categories', [], (err, result, field)=>{ 
        res.send(result)
    })
})

/* ------------------------------------------------------------------------------------------*/

/* update account admin */
router.put('/update_admin/:id', auth, role_adminApp, (req,res)=> { 
    const id_admin = req.params.id
    const {username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const updated_on = new Date()
    const sql = `UPDATE admin_app SET username = ?, password = ?, updated_on = ? WHERE id_admin = ?`

        mysql.execute(sql, [username, enc_pass, updated_on, id_admin], (err, result, field)=>{
            res.send(result)
                })
    }) 

    /* update restaurant data */
router.put('/update_restaurant/:id', auth, role_adminApp, upload.single('logo'), (req,res)=> { 
    const id_resto = req.params.id
    const logo = (req.file.originalname)
    const {name_resto, longitude, latitude, descriptions} = req.body
    const updated_on = new Date()
    const sql = `UPDATE restaurant_data SET name_resto = ?, logo = ?, longitude = ?, latitude = ?, descriptions = ?, updated_on = ? 
                WHERE id_resto = ?`

        mysql.execute(sql, [name_resto, logo, longitude, latitude, descriptions, updated_on, id_resto], (err, result, field)=>{
            res.send(result)
                })
    }) 

     /* update role */
 router.put('/update_role/:id', auth, role_adminApp, (req,res)=> { 
    const id_role = req.params.id
    const {name} = req.body
    const sql = `UPDATE roles SET name = ? WHERE id_role = ?`
    
         mysql.execute(sql, [name, id_role], (err, result, field)=>{
            res.send(result)
                 })
     }) 

     /* update categories */
 router.put('/update_categories/:id', auth, role_adminApp, (req,res)=> { 
    const id_categories = req.params.id
    const {category} = req.body
    const updated_on = new Date()
    const sql = `UPDATE categories SET category = ?, updated_on = ? WHERE id_categories = ?`
         mysql.execute(sql, [category, updated_on, id_categories], (err, result, field)=>{
             console.log(err)
            res.send(result)
                 })
     }) 

/* ------------------------------------------------------------------------------------------*/

/* delete account admin */
router.delete('/accountadmin/:id', auth, role_adminApp, (req, res)=>{
    const id_admin = req.params.id
    const sql = `DELETE from admin_app WHERE id_admin = ?`

    mysql.execute(sql, [id_admin], (err, result, field)=>{
        res.send(result)
    })
})

/* delete account user */
router.delete('/accountuser/:id', auth, role_adminApp, (req, res)=>{
    const id_user = req.params.id
    const sql = `DELETE from user WHERE id_user = ?`

    mysql.execute(sql, [id_user], (err, result, field)=>{
        res.send(result)
    })
})

/* delete account admin_resto */
router.delete('/accountadminresto/:id', auth, role_adminApp, (req, res)=>{
    const id_resto = req.params.id
    const sql = `DELETE from admin_resto WHERE id_resto = ?`

    mysql.execute(sql, [id_resto], (err, result, field)=>{
        res.send(result)
    })
})

/* delete restaurant data */
router.delete('/restaurantdata/:id', auth, role_adminApp, (req, res)=>{
    const id_resto = req.params.id
    const sql = `DELETE from restaurant_data WHERE id_resto = ?`

    mysql.execute(sql, [id_resto], (err, result, field)=>{
        res.send(result)
    })
})

/* delete role */
router.delete('/role/:id', auth, role_adminApp, (req, res)=>{
    const id_role = req.params.id
    const sql = `DELETE from roles WHERE id_role = ?`

    mysql.execute(sql, [id_role], (err, result, field)=>{
        res.send(result)
    })
})

/* delete categories */
router.delete('/categories/:id', auth, role_adminApp, (req, res)=>{
    const id_categories = req.params.id
    const sql = `DELETE from categories WHERE id_categories = ?`

    mysql.execute(sql, [id_categories], (err, result, field)=>{
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

/* ------------------------------------------------------------------------------------------*/

// router.get('/review', auth, role_adminApp, (req, res)=>{
//         const sql = `SELECT * FROM review`
//         mysql.execute(sql, [], (err, result, field)=>{
//             res.send(result)
//         })
//     }) 

// /* input item_data */
// router.post('/input_itemdata', auth, role_adminApp, upload.single('image'), (req, res)=>{
//     const image = (req.file.originalname)
//     const {id_categories, id_resto, name, price, descriptions} = req.body
//     const created_on = new Date()
//     const updated_on = new Date()
//     const sql = `INSERT INTO item_data (id_categories, id_resto, name, price, descriptions, image, created_on, updated_on) VALUES (?,?,?,?,?,?,?,?)`

//     mysql.execute(sql, [id_categories, id_resto, name, price, descriptions, image, created_on, updated_on], 
//         (err, result, field)=>{
//             console.log(err)
//             res.send(result)
//         })
// })

// /* select item_data */
// router.get('/itemdata', auth, role_adminApp, (req, res)=>{
//     mysql.execute('SELECT * FROM item_data', [], (err, result, field)=>{ 
//         res.send(result)
//     })
// })

// /* update item data */
// router.put('/update_item/:id', auth, role_adminApp, upload.single('image'), (req,res)=> { 
//     const id_item = req.params.id
//     const image = (req.file.originalname)
//     const {id_categories, id_resto, name, price, descriptions} = req.body
//     const updated_on = new Date()
//     const sql = `UPDATE item_data SET id_categories = ?, id_resto = ?, name = ?, price = ?, descriptions = ?, image  = ?, updated_on = ? 
//                 WHERE id_item = ?`

//         mysql.execute(sql, [id_categories, id_resto, name, price, descriptions, image, updated_on, id_item], (err, result, field)=>{
//             res.send(result)
//                 })
//     }) 

// /* delete item_data */
// router.delete('/item/:id', auth, role_adminApp, (req, res)=>{
//     const id_item = req.params.id
//     const sql = `DELETE from item_data WHERE id_item = ?`

//     mysql.execute(sql, [id_item], (err, result, field)=>{
//         res.send(result)
//     })
// })



module.exports = router