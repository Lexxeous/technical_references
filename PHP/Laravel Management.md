<!-- Laravel Coding Reference.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Laravel Management: <img src="../.pics/Laravel/laravel_logo.png" width="100"/>

> For a nice video tutorial series on **Laravel**, see this [Learn Laravel from Scratch](https://www.youtube.com/playlist?list=PLriKzYyLb28mtqooR44LgfSxwJb6eJnUi) playlist by Alessandro Castellani.

> For details about **Laravel**, see the [open source code hosted on Github](https://github.com/laravel/framework), the [official **Laravel** homepage](https://laravel.com), or the [**Laravel** documentation](https://laravel.com/docs/5.8).

# ANY TIME THAT YOU CHANGE THE .ENV FILE YOU MUST RESTART THE LARAVEL SERVER USING PHP ARTISAN SERVE FOR THE ENVIRONMENT CHANGES TO TAKE PLACE
# LARAVEL PATHS ARE PREPENDED AT THE /PUBLIC DIRECTORY BY DEFAULT ; THATS THE ONLY PLACE THAT USERS ARE ALLOWED TO ACCESS
# ANY TIME YOU CHANGE FRONT END CONFIGURATIONS (STYLING, FONTS, ETC...) EXECUTE "NPM RUN DEV" TO RECOMPILE ALL OF THE ASSETS FOR THE APPLICATION TO TAKE THE CHANGES BUT YOU DONT HAVETO RESTART THE SERVER
# BECAUSE LARAVEL IS A MVC FRAMEWORK ALL PHP LOGIC AND DATA MANIPULATION SHOULD BE DONE WITH THE CONTROLLERS, VIEWS ONLY PLACE DATA WHERE IT NEEDS TO BE, AND MODELS MODEL A ROW IN THE DATABASE
# dd() (DUMP AND DIE) is a very powerful function for LARAVEL that can replace PHP's var_dump() ; it displays the info passed to it and returns/kills halting any following sequential statements

### What is Laravel?
**Laravel** is a free, open-source, PHP web framework, created by Taylor Otwell and intended for the development of web applications following the Model–View–Controller (MVC) architectural pattern and based on Symfony. Some of the features of **Laravel** are a modular packaging system with a dedicated dependency manager, different ways for accessing relational databases, utilities that aid in application deployment and maintenance, with OOP (Object Oriented Programming).

install nvm and npm and composer and node

add composers bin folder to PATH

laravel command should give details in terminal

laravel new <proj_name>


#### What is Artisan?
Artisan is a _____ that ships with Laravel...

php artisan to see list of available commands, by root directory and by namespace.

php artisan serve starts the server @ https://<ip_addr>:<port> ; http://127.0.0.1:8000 by default

php artisan make:auth makes an authention scaffold

npm install installs node.js directories and dependencies for your application

npm run dev compiles the node modules (front end assets) for your application into /public/css/app.css and /public/js/app.js

you cannot register any users until there is a database setup ; create a database file /database/<db_file_name>.<db_ext> ; sql or sqlite for example

change DB_CONNECTION to the <db_ext> that you are using and run php artisan migrate to initiate the database migration

php artisan tinker allows you to enter your application from the terminal (backdoor) and view any & all data with commands like User::all();
	$var->save() will save changes directly for that variable, not for any changes that may have occured with its direct relationships
	$var->push() will save and push changes for that variable and any changes that may have occured for its direct relationships :)


# for local database storage you can request('<req_data>')->store('uploads', 'public') this will create a directory "storage/app/public/uploads". But this directory is not accessable from outside the public root project directory (like for viewing via localhost:8000/storage/uploads/<req_data>). If you run php artisan storage:link the "storage/app/public/uploads" directory will be "linked" with the accessable "/public/storage/uploads" directory on the root. The artisan commands need only be run one time during the lifetime of the project for this functionality to stay in effect.

#Laravel has a security feature that automatically passes a 419 Page Expired error upon submitting forms that cannot be verified. The error stems from CSRF and it usually solved by passing an encyption token from the home server to stop malicious users from cURLing invalid form data from outside of the actual form page. @csrf as the next line inside of a HTML form object is all you need to fix this issue.

# Laravel comes with a default __construct function that requires user authentication before any other actionable functions can be used. Just put the following at the top of your desired Controller class:
```php
public function __construct()
{
  $this->middleware('auth');
}
```
