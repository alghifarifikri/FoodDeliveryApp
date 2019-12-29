require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const {auth, role_user} = require('../middleware') 

/* login for user */
router.post('/login', (req, res)=>{
    const {username, password} = req.body
    const user = `SELECT * FROM user WHERE username = ?`
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

/* register account for user */
router.post('/register', (req, res)=>{ 
    const {username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `SELECT username from user WHERE username = ?`
    mysql.execute(sql, [username], 
        (err, resuld, field)=>{  
            if(resuld == ''){
                const sql1 = `INSERT INTO user (id_role, username, password, created_on, updated_on) VALUES (?,?,?,?,?)`
                mysql.execute(sql1, ['3', username, enc_pass, created_on, updated_on], (err, result, field)=>{
                    res.send({
                        success : true,
                        msg : 'Register Success'
                    })
                })
            }  else {
                res.send({
                    success : false,
                    msg : 'Username Does Exist'
                })
            }              
        })
})

/* input item into carts */
router.post('/selectitem', auth, role_user, (req, res)=>{ 
    const {username, id_item, name, name_resto, price, quantity} = req.body
    const total = price*quantity
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO cart (username, id_item, name, name_resto, price, quantity, total, created_on, updated_on) VALUES (?,?,?,?,?,?,?,?,?)`

    mysql.execute(sql, [username, id_item, name, name_resto, price, quantity, total, created_on, updated_on], 
        (err, result, field)=>{
            console.log(err)
            res.send(result)      
    })
})

/* input review */
router.post('/inputreview', auth, role_user, (req, res)=>{ 
    const {rating, review, name, id_item, id_user} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO review (rating, review, name, id_item, id_user, created_on, updated_on) VALUES (?,?,?,?,?,?,?)`
    mysql.execute(sql, [rating, review, name, id_item, id_user, created_on, updated_on], (err, resuld, field)=>{
        if(err == null){
            const sql = `SELECT AVG(rating) AS rate from review WHERE id_item = ${id_item}`
            mysql.execute(sql, [], (err, result, field)=>{
                var rating = result[0].rate
                if(err == null){
                    const sql = `UPDATE item_data set rating = ${result[0].rate} WHERE id_item = ${id_item} `
                    mysql.execute(sql, [rating], (err, result, field)=>{
                        console.log(id_item)
                        res.send(result)
                    })
                }
            })
        }
            res.send(resuld)     
    })
})
/* ------------------------------------------------------------------------------------------*/

/* select info profile */
router.get('/profile', auth, role_user, (req, res)=>{
    const {username} = req.body
    mysql.execute('SELECT * FROM user WHERE username = ?', [username], (err, result, field)=>{ 
        res.send(result)
    })
})

router.get('/menu', auth, role_user, (req, res)=>{
    const{name_resto} = req.body
    mysql.execute(`SELECT name_resto, id_item, name, price, item_data.descriptions, image FROM restaurant_data 
                   INNER JOIN item_data on item_data.id_resto = restaurant_data.id_resto 
                   WHERE name_resto = ?`, [name_resto], (err, result, field)=>{
                        res.send(result)
                    })
})

// /* select checkout */
// router.get('/checkout', auth, role_user, (req, res)=>{  
//     const {username} = req.body
//     mysql.execute(`SELECT username, SUM (total) from user
//                    INNER JOIN cart on cart.id_user = user.id_user WHERE username = ?`, [username], (err, result, field)=>{ 
//         res.send(result)
//     })
// })

// /* select cart */
// router.get('/cart/:id', auth, role_user, (req, res)=>{
//     const id_user = req.params.id
//     mysql.execute(`SELECT id_cart, name, name_resto, price, quantity, total FROM cart WHERE id_user = ?`, [id_user], (err, result, field)=>{ 
//         res.send(result)
//     })
// })

/* select cart */
router.get('/cart/', auth, role_user, (req, res)=>{
    const {username} = req.body
    mysql.execute(`SELECT username, name, name_resto, price, quantity, total FROM cart WHERE username = ?`, [username], (err, result, field)=>{ 
        res.send(result)
    })
})

/* select checkout */
router.get('/checkout', auth, role_user, (req, res)=>{
    const {username} = req.body
    mysql.execute(`SELECT username, id_item, name, name_resto, price, quantity, total FROM cart WHERE username = ?`, [username], (err, result, field)=>{ 
        mysql.execute(`SELECT SUM (total) as Checkout from cart WHERE username = ?`, [username], (err, result1, field)=>{
        res.send({success : true, Your_cart : result, Payment : result1})
    })
})
/* ------------------------------------------------------------------------------------------*/

router.put('/cart/update/:id_item/:id_user', auth, role_user, (req, res)=>{
    const {id_item, id_user} = req.params
    const {quantity} = req.body
    const sql = `UPDATE cart SET quantity = ? WHERE id_item = ? AND id_user = ?`
    mysql.execute(sql, [quantity, id_item, id_user], (err, result, field)=>{
                const sql1 = 'SELECT quantity FROM cart WHERE id_item = ?'
                mysql.execute(sql1, [id_item], (err, result1, field)=>{
                    const qty = result1[0].quantity
                    const sql2 = `SELECT price from cart where id_item = ?`
                    mysql.execute(sql2, [id_item], (err, result2, field)=>{
                        const prc = result2[0].price
                        const tot = qty * prc
                        console.log(tot, id_item, id_user)
                        mysql.execute(`UPDATE cart SET total = ? WHERE id_item = ? AND id_user = ?`, [tot, id_item, id_user], (err, result3, field)=>{
                            res.send({success : true, data : result3})
                        })
                    })
                 })
             
        })
    })      

/* update account user */
router.put('/update/:id', auth, role_user, (req,res)=> { 
    const id_user = req.params.id
    const {username, password} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const updated_on = new Date()
    const sql = `UPDATE user SET username = ?, password = ?, updated_on = ? WHERE id_user = ?`

        mysql.execute(sql, [username, enc_pass, updated_on, id_user], (err, result, field)=>{
            res.send(result)
                })
    })
})

    /* ------------------------------------------------------------------------------------------*/

    /* delete cart */
router.delete('/deletecart/:id', auth, role_user, (req, res)=>{
    const id_user = req.params.id
    const sql = `DELETE from cart WHERE id_user = ?`

    mysql.execute(sql, [id_user], (err, result, field)=>{
        res.send(result)
    })
})

/* delete item */
router.delete('/deleteitem/:id', auth, role_user, (req, res)=>{
    const id_item = req.params.id
    const sql = `DELETE from cart WHERE id_item = ?`

    mysql.execute(sql, [id_item], (err, result, field)=>{
        res.send(result)
    })
})

/* ------------------------------------------------------------------------------------------*/

router.put('/logout', auth, (req, res)=>{
    const token = req.headers.auth_token
    const is_revoked = 1
    const sql = `UPDATE revoked_token set is_revoked = ? WHERE token = ?`
    mysql.execute(sql, [is_revoked,token], (err, result, field)=>{
        res.send({result,
                  msg : req.headers.auth_token})
        
    })
})

// router.get('/review', auth, role_user, (req, res)=>{

//     const sql = `SELECT * FROM review`
//     mysql.execute(sql, [], (err, result, field)=>{
//         res.send(result)
//     })
// }) 
 
// router.get('/rating/:name', auth, role_user, (req, res)=>{
//     const name= req.params.id
//     const sql = `SELECT name, AVG(rating) from review`
//     mysql.execute(sql, [], (err, result, field)=>{ 
//         res.send(result)
// })
// })

/* ------------------------------------------------------------------------------------------*/

// router.get('/page', (req, res)=>{
//     const {page, limit} = req.query
//     if (page == 1){
//         const initial = page - 1
//         const sql = 'SELECT * FROM item_data ORDER BY name ASC LIMIT ${intial}, ${limit}'
//         mysql.execute(sql, [], (err, result, field)=>{
//             res.send(resuld)
//         })
//     } else if (page >= 2){
//         const initial = page * limit - limit
//         const sql = 'SELECT * FROM item_data ORDER BY name ASC LIMIT ${intial}, ${limit}'
//         mysql.execute(sql, [], (err, result, field)=>{
//             res.send(resuld)
//         }) 
//     }
// })

// /* select item */
// router.get('/item', auth, role_user, (req, res)=>{  
//     const {name, price, description, image, name_resto} = req.params
//     const sql = 'SELECT name, price, description, image, name_resto from item_data INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto '
//     mysql.execute(sql, [name, price, description, image, name_resto], (err, result, field)=>{
//         res.send(result)
//     })
// })

//     /* update cart */
// router.put('/updatecart/:id', auth, role_user, (req,res)=> { 
//     const id_cart = req.params.id
//     const {id_user, id_item, name, price, quantity} = req.body
//     const total = price * quantity
//     const updated_on = new Date()
//     const sql = `UPDATE cart SET id_user = ?, id_item = ?, name = ?, price = ?, quantity = ?, total = ? WHERE id_cart = ?`

//         mysql.execute(sql, [id_user, id_item, name, price, quantity, total, updated_on], (err, result, field)=>{
//             res.send(result)
//                 })
//     }) 

    /* update review */
// router.put('/updatereview/:name', auth, role_user, (req, res)=>{
//     const {name} = req.params
//     const {rating, review, updated_on} = req.body
//     updated_on = new Date()
//     const sql = `UPDATE review set rating = ?, review = ? WHERE name = ?`

    
// })

module.exports = router