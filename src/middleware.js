const jwt = require('jsonwebtoken')
const mysql = require('./dbconfig')

const auth = (req, res, next)=>{
    if(
        req.headers['authorization'] &&
        req.headers['authorization'].startsWith('Bearer')
    ){
        const jwt_token = req.headers['authorization'].substr(7)
        req.headers.auth_token = jwt_token
        mysql.execute('SELECT token from revoked_token WHERE token = ? and is_revoked = 1', [jwt_token], (err, result, field)=>{
            if(err){
                res.send({
                    success : false,
                    msg : err
                })
            } else {
                if (result.length > 0) {
                    res.send({
                        success : false, 
                        msg : 'session expired '
                    })
                } else {
                    try{
                        const user = jwt.verify(jwt_token, process.env.APP_KEY)
                        next()
                    } catch (e) {
                        res.send({
                            success: false,
                            msg: e
                        })
                    }        
                }
             }
        })
             } else {
        res.send({
            success: false,
            msg: 'You must be login first !'
        })
    }
}

const role_adminApp = (req, res, next)=>{
    const {id_role} = req.headers
       if(id_role == 1) {
           next()
       } else {
           res.send({
               success : false,
               msg : 'access denied !'
           })
       }
   }

   const role_adminResto = (req, res, next)=>{
    const {id_role} = req.headers
       if(id_role == 2 || id_role == 1) {
           next()
       } else {
           res.send({
               success : false,
               msg : 'access denied !'
           })
       }
   }

const role_user = (req, res, next)=>{
 const {id_role} = req.headers
    if(id_role == 3 || id_role == 1) {
        next()
    } else {
        res.send({
            success : false,
            msg : 'access denied !'
        })
    }
}


module.exports = {auth, role_user, role_adminApp, role_adminResto}