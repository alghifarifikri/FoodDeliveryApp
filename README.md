<h1 align="center">ExpressJS - Food Delivery App RESTful API</h1>



Food Delivery App is a application specially for backend only. Built with NodeJs using the ExpressJs Framework.
Express.js is a web application framework for Node.js. [More about Express](https://en.wikipedia.org/wiki/Express.js)
## Built With
[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.10.16-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements
1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?
1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name food_app, and Import file [food_app_API.sql](food_app_API.sql) to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:4040/notes)
8. You can see all the end point [here](#end-point)

## Set up .env file
Open .env file on your favorite code editor, and copy paste this code below :
```
PORT=4040
HOST=localhost
USER=root // default
PASS= // default
DATABASE=food_app_API
NODE_ENV=development node server.js
```

## End Point
**1. GET**
* `/admin_app/infoadmin`
* `/admin_app/infouser`
* `admin_app/infoadminresto`
* `/admin_app/restaurantdata`
* `/admin_app/inforole`
* `/admin_app/infocategories`
* `/admin_resto/itemdata/`(Get itemdata by id_resto = req.body)
* `/admin_resto/restaurantdata` (Get restaurantdata by id_resto = req.body)
* `/user/profile/:id_user` (Get profile by id_user)
* `/user/menu/:id_resto` (Get menu by id_resto)
* `/user/cart/:id_user` (Get profile by id_user)
* `/user/checkout/:id_user` (Get checkout by id_user)
* `/items/`
* `/items/lisresto`
* `/items/review/:id_item` (Get review by id_item)
* `/items/details/:id_item` (Get review by id_item)
* `/items/category/:id_category` (Get category by id_category)
* `/items/page?page=1&limits=5`
* `/items/search/asc?name=ayam&page=1&limits=5` (ASC or DESC)
* `/items/sort/asc?name=true` (ASC or DESC)
* `/items/search?name=ayam`

**2. POST**
* `/admin_app/loginadmin`
    * ``` { "username": "admin", "password": "admin" } ```

* `/admin_app/registeradmin`
    * ``` { "username": "admin1", "password": "admin" } ``` (Username is uniq)

* `/admin_app/registeradminresto`
    * ``` { "username": "ayampenyetsurabaya", "password": "admin" } ``` (Username is uniq)

* `/admin_app/input_restaurantdata`
    * ``` { "name_resto": "Ayam Penyet Surabaya", "logo": "(upload).jpg", "longitude" : "2222dfds2222asas", "latitude" : "fbisjdjbf", "descriptions" : "blablabla" } ``` 
* `/user/input_image`

* `/admin_app/role`
    * ``` { "name": "admin" } ```

* `/admin_app/categories`
    * ``` { "category": "juice" } ```

* `/admin_resto/loginresto`
    * ``` { "username": "admin", "password": "admin" } ```

* `/admin_resto/input_itemdata`
    * ``` { "id_categories": 1, "id_resto": 1, "name" : "Ayam Bakar", "price" : 10000, "description" : "blablabla", "image" : "(upload).jpg" } ```

* `/user/register`
    * ``` { "username": "alghi", "password": "alghi123" } ``` (Username is uniq)

* `/user/login`
    * ``` { "username": "alghi", "password": "alghi123" } ```

* `/user/selectitem`
    * ``` { "username": "alghi", "id_item": 1, "name" : "ayam penyet", "name_resto" : "ayam penyet surabaya", "price" : 10000, "quantity" : 2 } ``` (See the Menu before)

* `/user/inputreview`
    * ``` { "rating": 5, "review": "delicious", "name" : "ayam penyet", "id_item" : 1, "id_user" : 1 } ```

**3. PATCH**
* `/admin_app/update_admin/:id` (Update account admin by id)
   * ``` { "username": "admin2", "password": "admin2"} ```

* `/admin_app/update_restaurant/:id` (Update data restaurant by id)
   * ``` { "name_resto": "Ayam Penyet Surabaya", "logo": "(upload).jpg", "longitude" : "2222dfds2222asas", "latitude" : "fbisjdjbf", "descriptions" : "blablabla" } ```

* `/admin_app/update_role/:id` (Update role by id)
   * ``` { "name": "DBA" } ```

* `/admin_app/update_categories/:id` (Update category by id)
   * ``` { "category": "Juice" } ```

* `/admin_resto/update_item/:id` (Update item by id)
   * ``` { "id_categories": 1, "id_resto": 1, "name" : "Ayam Bakar", "price" : 10000, "description" : "blablabla", "image" : "(upload).jpg" } ```

* `/admin_resto/update_restaurant/:id` (Update data restaurant by id)
   * ``` { "name_resto": "Ayam Penyet Surabaya", "logo": "(upload).jpg", "longitude" : "2222dfds2222asas", "latitude" : "fbisjdjbf", "descriptions" : "blablabla" } ``` 

* `/admin_resto/update_admin/:id` (Update admin resto account by id)
    * ``` { "username": "ayampenyetsurabaya", "password": "admin" } ```

* `/admin_app/forgotpassword`
    * ``` { "username": "admin", "password": "admin" } ```

* `/admin_resto/forgotpassword`
    * ``` { "username": "ayampenyetsurabaya", "password": "admin" } ```

* `/username/forgotpassword` 
    * ``` { "username": "fikri", "password": "admin" } ```

* `/admin_app/logout`

* `/admin_resto/logout`

* `/user/logout`

* `/cart/update/:id_item/:id_user` (Update cart by id_item and id_user)
    * ``` { "quantity": 3 } ```


**4. DELETE**
* `/admin_app/accountadmin/:id` (Delete account admin by id)
* `/admin_app/accountuser/:id` (Delete account user by id)
* `/admin_app/accountadminresto/:id` (Delete account admin resto by id)
* `/admin_app/restaurantdata/:id` (Delete  data restaurant by id)
* `/admin_app/role/:id` (Delete role by id)
* `/admin_app/categories/:id` (Delete categories by id)
* `/admin_resto/item/:id` (Delete item by id)
* `/user/deleteitem/` (Delete item by id_item and id_user = req.body)
