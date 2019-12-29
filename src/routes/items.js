require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const url = require('url')
const mysql = require('../dbconfig')
const {auth, role_adminApp, role_adminResto, role_user} = require('../middleware') 

/* select item */
router.get('/', (req, res)=>{   
    const sql = `SELECT name, price, image, item_data.descriptions, name_resto from item_data 
    INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto`
    mysql.execute(sql, [], (err, result, field)=>{
        res.send(result)
    })
})

/* see the review */
router.get('/review/:name', (req, res)=>{
    const {name} = req.params
    const sql = `SELECT name, rating, review FROM review WHERE name = ?`
    mysql.execute(sql, [name], (err, result, field)=>{
        res.send(result)
    })
})

/* item detail */
router.get('/details/:name/:name_resto', (req, res)=>{
    const {name, name_resto} = req.params
    const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                 INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                 INNER JOIN categories on categories.id_categories = item_data.id_categories 
                 WHERE (name = ? AND name_resto = ? )`
    mysql.execute(sql, [name, name_resto], (err, resuld, field)=>{
        const categories = resuld[0].category
        const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                     INNER JOIN categories on categories.id_categories = item_data.id_categories where category LIKE ? LIMIT 5`
        mysql.execute(sql,['%'+categories+'%'], (err, result, field)=>{
            res.send({success : true,
                      data : resuld,
                      Suggest : result})
        })
        
    })
})

/* ======================================================================================================  */

/* category */
router.get('/category/:category', (req,res)=>{
    const {category} = req.params
    const sql = `SELECT name, price, image, category from item_data INNER JOIN
                 categories on categories.id_categories = item_data.id_categories WHERE category = ?`
    mysql.execute(sql, [category], (err, result, field)=>{
        res.send(result)
    })
})

/* ===================================================================================================== */

router.get('/page', (req, res)=>{
    const {page, limits} = req.query
    if (page == 1){
        const initial = page - 1
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto
                     ORDER BY name ASC LIMIT ${initial}, ${limits}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
            console.log(err)  
        })
    } else if (page >= 2){
        const initial = page * limits - limits
        const sql = `SELECT name, price, item_data.descriptions, image, rating name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                     ORDER BY name ASC LIMIT ${initial}, ${limits}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)  
        }) 
    } 
})  

/* ====================================================================================================== */

router.get('/search/asc', (req, res)=>{
    const {name, price, rating, page, limits} = req.query
    if (name){
        if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2) {
            const initial = page * limits - limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result) 
       })
    }
     } else if (price){
         if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE price = ${price} ORDER BY price ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page * limits - limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE price = ${price} ORDER BY price ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        }
    } else if (rating){
        if(page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page - limits * limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating ASC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        } 
    } else {
        res.send({
            success: false,
            msg : 'nothing to display :('
        })
    }
})

router.get('/search/desc', (req, res)=>{
    const {name, price, rating, page, limits} = req.query
    if (name){
        if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2) {
            const initial = page * limits - limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result) 
       })
    }
     } else if (price){
         if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE price = ${price} ORDER BY price DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page * limits - limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE price = ${price} ORDER BY price DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        }
    } else if (rating){
        if(page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page - limits * limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating DESC LIMIT ${initial}, ${limits}`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        } 
    } else {
        res.send({
            success: false,
            msg : 'nothing to display :('
        })
    }
})

/* ========================================================================================================== */

router.get('/sort/asc', (req,res)=>{
    const {name, price, rating, updated_on} = req.query
    if(name){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY name ASC`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if(price){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY price ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if (rating){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY rating ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    }  else if (updated_on){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY updated_on ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    }  else {
        res.send({
            success : false,
            msg : 'nothing to display'
        })
    }
})

router.get('/sort/desc', (req,res)=>{
    const {name, price, rating, updated_on} = req.query
    if(name){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY name desc`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if(price){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY price desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if (rating){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY rating desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if (updated_on){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY updated_on desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else {
        res.send({
            success : false,
            msg : 'nothing to display'
        })
    }
})

/* ===================================================================================================================== */

router.get('/search', (req, res)=>{
    const {name, price, rating} = req.query
    if (name){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto WHERE name LIKE '%${name}%'`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if (price){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto WHERE price = ${price}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else if (rating){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto WHERE rating = ${rating}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send(result)
        })
    } else {
        res.send({
            success: false,
            msg : 'nothing to display :('
        })
    }
})

module.exports = router  