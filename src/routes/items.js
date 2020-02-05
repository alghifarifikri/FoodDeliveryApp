require('dotenv').config()
const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const url = require('url')
const mysql = require('../dbconfig')
const uuidv1 = require('uuid')
const {auth, role_adminApp, role_adminResto, role_user} = require('../middleware') 

/* select item */
router.get('/', (req, res)=>{   
    const sql = `SELECT id_item, name, price, image, item_data.descriptions, name_resto from item_data 
    INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto `
    mysql.execute(sql, [], (err, result, field)=>{
        res.send({data : result})
    })
})

router.get('/listresto', (req, res)=>{   
    const sql = `SELECT * FROM restaurant_data`
    mysql.execute(sql, [], (err, result, field)=>{
        res.send({data : result})
    })
})

/* see the review */
router.get('/review/:id_item', (req, res)=>{
    const {id_item} = req.params
    const sql = `SELECT id_item, rating, review, user.username FROM review INNER JOIN user on user.id_user = review.id_user WHERE id_item = ?`
    mysql.execute(sql, [id_item], (err, result, field)=>{
        res.send({data: result})
    })
})

/* item detail */
router.get('/details/:id_item', (req, res)=>{
    const {id_item} = req.params
    const sql = `SELECT id_item, name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                 INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                 INNER JOIN categories on categories.id_categories = item_data.id_categories 
                 WHERE id_item = ?`
    mysql.execute(sql, [id_item], (err, resuld, field)=>{
        const categories = resuld[0].category
        const sql = `SELECT id_item, name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                     INNER JOIN categories on categories.id_categories = item_data.id_categories where category LIKE ? AND id_item != ? LIMIT 5`
        mysql.execute(sql,['%'+categories+'%', id_item], (err, result, field)=>{
            res.send({success : true,
                      data : resuld,
                      Suggest : result})
        })
        
    })
})

/* ======================================================================================================  */

/* category */
router.get('/category/:id_category', (req,res)=>{
    const {id_category} = req.params
    const sql = `SELECT id_item, name, price, image, rating, name_resto, category, categories.id_categories from item_data 
                 INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                 INNER JOIN categories on categories.id_categories = item_data.id_categories WHERE categories.id_categories = ?`
    mysql.execute(sql, [id_category], (err, result, field)=>{
        res.send({data : result})
    })
})

/* ===================================================================================================== */

router.get('/page', (req, res)=>{
    const {page} = req.query
    const limits = 5
    
    if (page == 1){
        const initial = page - 1
        const pages = page
        const next = parseInt(pages) + 1
        const prev = parseInt(pages) - 1
        const sql = `SELECT id_item, name, price, rating, item_data.descriptions, image, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto
                     ORDER BY name ASC LIMIT ${initial}, 5`
        mysql.execute(sql, [], (err, result, field)=>{
            
            res.send({
                data : result, 
                pages,
                Prev : `http://localhost:4040/items/page?page=${prev}&limits=5`,
                Next : `http://localhost:4040/items/page?page=${next}&limits=5`
                
            }) 
        })
    } else if (page >= 2){
        const initial = page * limits - limits
        const pages = page
        const next = parseInt(pages) + 1
        const prev = parseInt(pages) - 1
        const sql = `SELECT id_item, name, price, rating, item_data.descriptions, image, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                     ORDER BY name ASC LIMIT ${initial}, ${limits}`
        mysql.execute(sql, [], (err, result, field)=>{
            const pages = page
            res.send({
                data : result, 
                pages,
                Prev : `http://localhost:4040/items/page?page=${prev}&limits=5`,
                Next : `http://localhost:4040/items/page?page=${next}&limits=5`
                
            })   
        }) 
    } 
})  

/* ====================================================================================================== */

router.get('/searching', (req, res) => {
    const url ='http://localhost:4040/items/'
    const query = req.query
    let where = ''
    let sort = ''
    let page = 'LIMIT 6 OFFSET 0'
    let full_url = ''

    if (query.search) {
        let count = 1
        where += `WHERE`
        Object.keys(query.search).forEach(key => {
            if (Object.keys(query.search).length === 1) {
                where += ` ${key} LIKE '%${query.search[key]}%'`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            } else if (Object.keys(query.search).length === count) {
                where += ` ${key} LIKE '%${query.search[key]}%'`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            }
            else {
                where += ` ${key} LIKE '%${query.search[key]}%' AND`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            }
        });
    }

    if (query.sort) {
        if (Object.keys(query.sort).length === 1) {
            sort += `ORDER BY`
            Object.keys(query.sort).forEach(key => {
                sort += ` item_data.${key} ${query.sort[key]}`
                full_url += `sort[${key}]=${query.sort[key]}&`
            });
        }
    }

    if (query.page) {
        const offset = (Number(query.page) * 6) - 6
        page = `LIMIT 6 OFFSET ${offset}`
        full_url += `page=${query.page}&`
    } else {
        query.page = 1
    }

    let sql1 = `SELECT COUNT(*) AS result FROM item_data`

    let sql2 = `SELECT * FROM item_data ${where} ${sort} ${page}`


    mysql.execute(sql1, (err, result, field) => {
        if (err) {
            console.log(err)
            res.send({
                // uuid: uuidv1(),
                status: 400,
                msg: err,
            })
        } else if (result.length === 0) {
            res.send({
                // uuid: uuidv1(),
                status: 400,
                msg: "No data retrieved!",
            })
        } else {
            mysql.execute(sql2, (err2, res2, fie2) => {
                if (err2) {
                    console.log(err2)
                    res.send({
                        // uuid: uuidv1(),
                        status: 400,
                        msg: err2,
                    })
                } else if (res2.length === 0) {
                    res.send({
                        // uuid: uuidv1(),
                        status: 400,
                        msg: "No data retrieved!",
                    })
                } else {

                    let prev = ''
                    let next = ''

                    let noPage = full_url.replace(/page=[0-9\.]+&/g, '')

                    Prev = `${url}searching?${noPage}page=${Number(query.page) - 1}`
                    Next = `${url}searching?${noPage}page=${Number(query.page) + 1}`

                    if (Number(query.page) === Math.ceil(Number(result[0].result) / 6)) {
                        Prev = `${url}searching?${noPage}page=${Number(query.page) - 1}`
                        Next = ``
                    } else if (query.page <= 1) {
                        Prev = ``
                        Next = `${url}searching?${noPage}page=${Number(query.page) + 1}`
                    }

                    res.send({
                        // uuid: uuidv1(),
                        status: 200,
                        info: {
                            count: result[0].result,
                            pages: Math.ceil(Number(result[0].result) / 6),
                            current: `${url}searching?${full_url}`,
                            Next: Next,
                            Previous: Prev
                        },
                        data: res2
                    })
                }
            })
        }
    })
});

/* =============================================================================================================== */

router.get('/search/asc', (req, res)=>{
    const {name, category, rating, page} = req.query
    const limits = 5
    if (name){
        if (page == 1){
            const initial = page - 1
            const pages = page
            const next = parseInt(pages) + 1
            const prev = parseInt(pages) - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name ASC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send({
                    data : result, 
                    pages,
                    Prev : `http://localhost:4040/items/search/asc?name=${name}&page=${prev}&limits=5`,
                    Next : `http://localhost:4040/items/search/asc?name=${name}&page=${next}&limits=5`
                    
                }) 
        })
        } else if (page >= 2) {
            const initial = page * limits - limits
            const pages = page
            const next = parseInt(pages) + 1
            const prev = parseInt(pages) - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name ASC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send({
                    data : result, 
                    pages,
                    Prev : `http://localhost:4040/items/search/asc?name=${name}&page=${prev}&limits=5`,
                    Next : `http://localhost:4040/items/search/asc?name=${name}&page=${next}&limits=5`
                    
                })  
       })
    }
     } else if (category){
         if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         INNER JOIN categories on categories.id_categories = item_data.id_categories 
                         WHERE category LIKE '%${category}%' ORDER BY category ASC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                console.log(err)
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page * limits - limits
            const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         INNER JOIN categories on categories.id_categories = item_data.id_categories 
                         WHERE category LIKE '%${category}%' ORDER BY category ASC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        }
    } else if (rating){
        if(page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating ASC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page - limits * limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating ASC LIMIT ${initial}, 5`
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
    const {name, category, rating, page} = req.query
    const limits = 5
    if (name){
        if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name DESC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send({data : result})
        })
        } else if (page >= 2) {
            const initial = page * limits - limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE name LIKE '%${name}%' ORDER BY name DESC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result) 
       })
    }
     } else if (category){
         if (page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         INNER JOIN categories on categories.id_categories = item_data.id_categories 
                         WHERE category = '${category}' ORDER BY category DESC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                console.log(err)
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page * limits - limits
            const sql = `SELECT name, price, rating, item_data.descriptions, image, name_resto, category FROM item_data 
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         INNER JOIN categories on categories.id_categories = item_data.id_categories 
                         WHERE category = '${category}' ORDER BY category DESC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
            })
        }
    } else if (rating){
        if(page == 1){
            const initial = page - 1
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating DESC LIMIT ${initial}, 5`
            mysql.execute(sql, [], (err, result, field)=>{
                res.send(result)
        })
        } else if (page >= 2){
            const initial = page - limits * limits
            const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                         INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto 
                         WHERE rating = ${rating} ORDER BY rating DESC LIMIT ${initial}, 5`
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
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY name ASC`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    } else if(price){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY price ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    } else if (rating){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY rating ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    }  else if (updated_on){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY item_data.updated_on ASC `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
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
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY name desc`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    } else if(price){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY price desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    } else if (rating){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY rating desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
        })
    } else if (updated_on){
        const sql = `SELECT id_item, name, price, item_data.descriptions, image, rating, name_resto from item_data 
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto ORDER BY updated_on desc `
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data : result})
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
            res.send({data: result})
        })
    } else if (price){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto WHERE price = ${price}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data: result})
        })
    } else if (rating){
        const sql = `SELECT name, price, item_data.descriptions, image, rating, name_resto from item_data
                     INNER JOIN restaurant_data on restaurant_data.id_resto = item_data.id_resto WHERE rating = ${rating}`
        mysql.execute(sql, [], (err, result, field)=>{
            res.send({data: result})
        })
    } else {
        res.send({
            success: false,
            msg : 'nothing to display :('
        })
    }
})

module.exports = router  