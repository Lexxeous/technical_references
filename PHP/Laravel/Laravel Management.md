<!-- Laravel Coding Reference.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Laravel Management: <img src="../.pics/Laravel/laravel_logo.png" width="100"/>

> For more details about Laravel, see the [open source code hosted on Github](https://github.com/laravel/framework), the [official Laravel homepage](https://laravel.com), or the [Laravel documentation](https://laravel.com/docs/5.8).

> For a nice video tutorial series on Laravel, see this [Learn Laravel from Scratch](https://www.youtube.com/playlist?list=PLriKzYyLb28mtqooR44LgfSxwJb6eJnUi) playlist by **Alessandro Castellani**.

> For an in-depth, detailed example project using PHP, HTML, Laravel, Vue, Markdown for the MVC framework with OOP, see this [Laravel PHP Framework Tutorial](https://www.youtube.com/watch?v=ImtZ5yENzgE) course by **freeCodeCamp.org**.

> For the purposes of this Laravel Management Markdown page, the terms *function* and *method* will be used interchangably.

### What is Laravel?
**Laravel** is a free, open-source, PHP web framework, created by Taylor Otwell and intended for the development of web applications following the Model–View–Controller (MVC) architectural pattern and based on Symfony. Some of the features of **Laravel** are a modular packaging system with a dedicated dependency manager, different ways for accessing relational databases, utilities that aid in application deployment and maintenance, with OOP (Object Oriented Programming).

PHP and Laravel work as an intermediary interpreter for web servers, databses, and HTML renderings, as depicted below: <br>
<div style="text-align:center"><img src="../.pics/Laravel/interpreter.png" width="400px"/></div>

To start using Laravel:

1. Install Node Version Manager (NVM), Node Package Manager (NPM), Composer **globally**, and `node.js` for your OS.
2. Run `nvm`, `npm`, `composer` and `node` to esure that they return use details and/or version numbers.
3. Add Composer's `/bin` directory to your PATH.
	- `export PATH=$PATH:$HOME/.composer/vendor/bin` for macOS users.
4. Run `composer global require laravel/installer`.
5. Run `laravel` to ensure that it returns details and/or a version number.
6. Navigate to your desired directory and run `laravel new <proj_name>` to create a new Laravel application, house inside a folder called `<proj_name>`.


### What is Artisan?
Artisan is a command line tool and MVC framework manager that ships with Laravel, making development much easier. It can create scaffolds for authentication, make migration tables, controller templates, and loads of other convenient things.

1. Run `php artisan` to see a full list of available Artisan commands, organized by namespace.
2. If you want help or more information about a specific command, use `php artisan -h <namespace>:<command>` to get valuable details about the Artisan command in question.
3. One of the most useful Artisan commands is `php artisan make:auth`. This command creates an entire authentication scaffold for your application, equipped with login and register controllers, models, routes, view templates, among other things. This command is essential for any application that requires handling or manipulating users.
4. `php artisan serve` starts the server at `https://<ip_addr>:<port>`. Laravel uses `http://127.0.0.1:8000` by default.


### NPM with Laravel
1. After NPM is successfully installed and available within your Laravel application use `npm install` to install `node.js` directories, dependencies, and node modules for your application.
2. Using `npm run dev` compiles the node modules for your application into `/public/css/app.css` and `/public/js/app.js`. This command should be run anytime you change any front-end assets (styling, fonts, etc...); *you do not have to restart the server*. If everything compiled successfully you should see something like this:
```bash
 DONE  Compiled successfully in <num>ms

       Asset      Size   Chunks             Chunk Names
/css/app.css   <sz> KiB  /js/app  [emitted]  /js/app
  /js/app.js   <sz> MiB  /js/app  [emitted]  /js/app
```

  3. NPM has other useful functionality:
    - Use `npm run watch` to constantly watch for any front-end CSS or JS assests that change, this will automatically recompile the node modules without manual intervention.
    - The `package.json` file contains many other NPM scripts that you can use for your application using `npm run <script_name>`.


### Laravel Databases
> A full list of accepted database column datatypes and modifiers is available in the [Laravel Database Documentation](https://laravel.com/docs/5.7/migrations#columns).
> Database table column names should **always** be plural and lowercase.

  1. You cannot register any users until a database has been setup for your application.
    - Create a database file `/database/<db_file_name>.<db_ext>`
      - Use a `<db_ext>` like `sql` or `sqlite`, for example.
  2. Change `DB_CONNECTION` (inside the `.env` file) to the `<db_ext>` that you are using and `run php artisan migrate` to initiate the database migration.
    - Other useful `php artisan migrate:<command>` options are also available like: `fresh`, `rollback`, and `status`.

#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Database Seeders

>> Make sure to run `composer dump-autoload` after every creation of a new database seeder.
This will force Composer to dump and re-index all the project's auto-loading files. *Optionally*, you can also run `php artisan migrate:fresh` to wipe your database clean of any prior data, so that the seeder data are the only available entries.

  - Create a database seeder with `php artisan make:seeder <class_name>TableSeeder`.

  - Make sure to include `use Illuminate\Support\Facades\DB;` inside your database table seeder file(s) if you wish to take advantage of the `DB` methods.

  - Inside specific database table seeder files, the `run()` function should have somthing like the following:
```php
// Inside "database/seeds/<class_name>TableSeeder.php"
DB::table('<table_name>')->insert([ // parent array around data arrays
['<key1>' => 'value1', '<key2>' => 'value2'],
['<key3>' => 'value3', '<key4>' => 'value4'],
...
['<key5>' => 'value5', '<keyN>' => 'valueN'],]);
```

  - Inside the main table seeder file `DatabaseSeeder.php`, the `run()` function should have something like the following:
```php
// Inside "database/seeds/DatabaseSeeder.php"
$this->call(<class_name>TableSeeder::class); // for single table database seeding


$this->call([<class_name1>TableSeeder::class, // for multi-table database seeding
          <class_name2>TableSeeder::class,
          ...
          <class_nameN>TableSeeder::class,]);
```

  - After your database seeders are appropriately created, run `php artisan db:seed` to seed your database with all your manually entered data.

  - If you want to rollback & re-install migrations while simulatneously seeding your database, run `php artisan migrate:refresh --seed`.
 

#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Local Storage

  - For local database storage you can `request('<req_data>')->store('<directory>', 'public')`. This will create or store the `<req_data>` inside of `storage/app/public/<directory>`. But this directory is not immediately accessable from outside the root project directory (like for viewing via `localhost:8000/storage/<directory>/<req_data>`). If you run `php artisan storage:link` the `storage/app/public/*` directories will be *linked* with the accessable `/public/storage/*` directories on the root. The artisan command need only be run one time during the lifetime of the project for this functionality to stay in effect.

### PHP Artisan Tinker
  - Another very useful tool for Laravel exists, called Tinker. Using `php artisan tinker` allows you to "get inside" your application through a backdoor and view or manipulate any & all data with PHP commands like `User::all();`
    - `$var->save();` will save changes directly for that variable, not for any changes that may have occured with its direct model relationships.
    - `$var->push();` will save and push changes for that variable and any changes that may have occured for all its direct model relationships.
    - `<class>::truncate();` will delete all of the current database instances of `<class>`.


### What is Composer?
Composer is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. It helps to install/update various requirements/components for an applications that use Laravel framework, Doctrine, lodash etc.

  - Just use `composer require <library>`
    - With Laravel package auto-discovery, many times you won't need to reconfigure your application to use required packages. In those cases, Laravel and Composer will handle all of the dependencies and installation requirements so that you don't have to do any more work to start using the `<library>`.

  - Open `vendor/composer/autoload_classmap.php` if you want to find the vendor file definitions of a specific package like `Illuminate`, `Intervention`, etc. 



### What is Blade?
Blade is a template engine inside of Laravel that is used as an extension on PHP views.

  - "Handlbar/mustache" syntax (double curly brackets: `{{ }}`) allows the display of data passed to the Blade view or to echo the results of any embedded PHP. Blade `{{ }}` statements are also automatically sent through PHP's `htmlspecialchars()` function to prevent XSS attacks.

  - Blade templates do not require a semicolon for an endline character.

  - The Blade directive `@include(/path/to/partial/view)` is similar to a layout `yield` and avoids the use of repeated view code.

  - You can also use:
```php
// Inside external Blade view
@component('<partial/view/path>')
	<dynamic_text>
@endcomponent

// Inside <partial/view/path> Blade view
<html_component class="<html_class>">
	{{$slot}}
</html_component>
```
to render dynamic text across Blade template views (wrapped in the same `<html_class>` styling), without having to repeat the `<html_component>`.


### Laravel Telescope
Telescope is a very powerful Laravel tool that assists with analyzing/monitoring events that occur within your application. You can view, requests, commands, queries, exceptions, logs, Redis server status, among other things to help debug/monitor you application from a GUI.

  1. Run `composer require laravel/telescope` to grab the Telescope package
  2. Run `php artisan telescope:install` to install the Telescope scaffold into your application
  3. Run `php artisan migrate` to create the Telescope entries table inside of the database
  4. Located at `<ip_addr>:<port>/telescope` is the URL/GUI for developers to see what is going on inside thier application behind the scenes.


### Laravel Routes
Blade and Laravel also give us a very useful function pair that allow for dynamnic routing.

  - Inside any Blade template view, if you type: `{{route('<route_name>')}}` in accordance with a route in `web.php` like:
```php
// Inside "web.php"
Route::<action>('<route/path>', function() {
	return view('<view/path>')
})->name('<route_name>');
```
then any change to the route path (which effects the absolute or relative URL) will not break links inside your application, because they are specified by thier `<route_name>` inside the Blade template view.

  - You can also specify middleware authentication for individual routes by chaining the `middleware()` method onto the and of a route in `web.php` like: `Route::<action>('<route_path>', <controller_name>Controller@<method>)->name('<route_name>')->middleware('auth');`

  - **Routes take sequential priority and can be conflicting**, causing `404` errors. As a general rule of thumb, place routes that have variables in them towards the bottom of each route group so that they are the last resort, after the static routes

Below is a snapshot taken directly from the Laravel documentation for the available route verbs, paths, actions, and names: <br>
<div style="text-align:center"><img src="../.pics/Laravel/route_verbs.png" width="500px"/></div>


### CSS Styling with Laravel
  - Use `<link rel="stylesheet" href="{{mix('/path/to/stylesheet')}}>"` (the `href` will most likely be the main stylesheet included with Larvel `/sass/app.scss`) in a Blade view to reference the stylesheet that you want to use for that view.

  - Inside the main stylesheet `/resources/sass/app.scss`, you can also import stylesheet partials for increased abstration and organization using `@import '<partial_name>'` where the stylesheet partial name is `_<partial_name>.scss`.


### Laravel Layouts
If you want to dispay the same view structure without replicating HTML code, then layouts are the perfect tool. Laravel ships with Blade directives that allows direct connections between pairs of views.

```php
// Inside the primary Blade view <primary>.blade.php
@yield('<keyword>') // It is common to use the keyword 'content'

// Inside the secondary Blade view <secondary>.blade.php
@extends('<path/to/primary/view>') // most likely layouts/<view_name>

@section('<keyword>')
	// yielded view components
@endsection
```

### Laravel Models
> Laravel model names should **always** be singular and uppercase.

  - To create a model run `php artisan make:model <model_name>`.

  - With *many-to-many* relationships for models, we do not need to create a seperate model to connect the two. Instead we create a *pivot table* migration where the two models in question (to be connected) are in alphabetical order after the create flag separated by an underscore: `php artisan make:migration creates_<classA>_<classB>_pivot_table --create <classA>_<classB>`.


### Laravel Views
  - There is a consistent variable that exists in the Laravel Blade template views `$errors`. This means that we dont have to deal with much error handling like determining what the error is, parsing the error message, passing the error to/from a controller, etc. Laravel takes care of it for us and provides a convenient variable that we can compare with `count()`, a value like `400`, `404`, `500`, etc., or just `{{dd($errors)}}` for debugging.

  - The `@can` and `@cannot` keywords are other Blade directives that will produce a true or false boolean that you can wrap around certain HTML to enable or disable component rendering. You can pass an <action> and a <class> that will call a policy function (in `app/policies`) to check if the current <class> instance is validated to perform the <action>.
```php
// Inside "<view>.blade.php"
@can('<action>', <class>)
  <html_component></html_component>
@endcan

@cannot('<action>', <class>)
  <html_component></html_component>
@endcan

// Inside "<model>Policy.php"
/**
     * Determine whether the <class> can update the <class>.
     *
     * @param  \App\<model_name1>  $<model_param1>
     * @param  \App\<model_name2>  $<model_param2>
     * @return mixed
     */
    public function <action>(<model_name1> $<model_param1>, <model_name2> $<model_param2>)
    {
    	return $<model_param1>->id == $<model_param2>->id;
    }
```


### Laravel Controllers
  - By default, Composer comes with a package called `Illuminate` that specifies many different classes. One of these classes comes from `Illuminate\Http\Request` and specifies that every Laravel controller call passes an implicit `Request $request` class-variable pair containing lots of information about the route-controller request. You can use this request to parse data for different views with conditionals or whatever you like. 

  - If you use the default `__construct()` function, all other public functions that are inside `<controller_name>Controller.php` will require user authentication before execution. Laravel will raise an error if the current user is not permitted to take the action requested within the controller.
```php
// Inside "app/Http/Controllers/<controller_name>Controller"
public function __construct()
{
  $this->middleware('auth');
}
```

  - Another feature that Laravel provides by default is the ability to perform route-model binding. For route-model binding, when passing a variable from a route to a controller that have the same naming convention as a model, you can preprend `\App\<class>` to a function parameter for Laravel to automagically find the model resource that you are referencing (by `$id` or otherwise). It also automagically provides `findOrFail()` functionality for data integrity. UNfortunately, the route-model binding has a property that will produce integers in the *URL* instead of readable names. If you want to override this route-model binding property, modify the model with a function called `getRouteKeyName()` and simply return a string that **exactly** matches a desired column in your database.
```php
public function show(\App\<class> <$class_param>)
{
	// code
}
```

  - Using `$this->authorize(<action>, <other_params>)` inside of a controller will call the `<model_name>Policy` for `$this` class to authorize the current `<action>` being taken before it is blindly executed.


### Connecting Laravel's MVC Framework

> Because Laravel is an `MVC` framework, all PHP logic and data manipulation should be done with controllers, views should only place passed data where it needs to be, and models denote a row inside of a database.

  - One common way to connect a model, controller, and database column for dynamic filtering of route data is to incorporate a `slug` database column that matches the path name associated with a particular route. With the `$slug` variable already equal to the request path in the controller, compare it with the first result that the model that with the `slug` batabase column, you can forward/return a `compact` version of a specific model instance, to any view (without having to filter with `if` statements), just based on the route call that was passed to the controller. 
```php
// Inside the "web.php" file
Route::get('/{slug}', <controller_name>@<func_name>)

// Inside a controller function
public function <func_name>(Request $request, $slug)
{
	$<model_var> = <model_name>::where('slug', $slug)->first();
	return view('<path/to/view>', compact('<model_var>'));
}
```


### Laravel Service Providers
By default, Laravel also organizes the services providers into 3 sections:

  1. Laravel Framework Service Providers,
  2. Package Service Providers, &
  3. Custom Application Service Providers
    - These group consists of the exact same providers that exist in `app/Providers/<provider_name>`.
    - This is where your custom application service provider will exist.

  * To create a service provider in Laravel use `php artisan make:provider <cust_name>ServiceProvider`.

  * A list of registered providers in `config/app.php` are included like `<namespace\path>\<provider_name>Provider::class`.
    - Include the reference to your custom service provider inside the array to use it in your application.

  - In the service provider boot method, you could specify what content you want to pass to the view:
```php
// Inside "app/Providers/<cust_name>ServiceProvider"
public function boot()
{
	view()->composer('<view_name>', function($view) { // <view_name> can be a specific view or just '*' to tap all of them
		$<model_vars> = <model>::all();
		return $view->with('<model_vars>', <model_vars>);
	});
}
```
Now in the view, you can accept dynamic databasedata from the database in a looping fashion:
```php
// Inside <view_name>.blade.php
@foreach ($<model_vars> as <model_var>) {
	<html_component> {{ $<model_var>->slug }} </html_component>
	<html_component> {{ $<model_var>-><data> }} </html_component>
	...
}
```

### Laravel Authentication

  - Creating a public function called `redirectTo()` will have priority over the default `protected $redirectTo = '<path>'` variable defined in the authentication controllers.

  - There is a useful quirk that exists for Laravel that could be annoying or maliciously exploited within the context of redirects. The authentication controllers (`LoginController.php`, `RegisterController.php`, `middleware/RedirectIfAuthenticated.php`etc...) maintain a protected redirect variable (or priority taking method) and a reference to `Illuminate\Foundation\Auth\AuthenticatesUsers`. Composer keeps the definitions of these package files in the `vendor` directory.

  - Inside `vendor/laravel/framework/src/Illuminate/Foundation/Auth/AuthenticatesUsers.php`, there exists a function called `sendLoginResponse()`. When this function returns, it either returns the *unchanged* authenticated request, or the *intended* authenticated request. Since no code exists in the `authenticated()` function that is being called, the ternary operator `?:` always defaults to the *intended* authenticated request. Laravel suggests **never** to change any functionality that exists within any of the `vendor` files, but rather to copy and paste methods that you wish to override into an appropriate controller. In this case, to override the *intended* authenticated request, you should copy:
```php
// Inside "vendor/laravel/framework/src/Illuminate/Foundation/Auth/AuthenticatesUsers.php"
/**
* The user has been authenticated.
*
* @param  \Illuminate\Http\Request  $request
* @param  mixed  $user
* @return mixed
*/
protected function authenticated(Request $request, $user)
{
  //
}
```
and paste it inside `LoginController.php` and modify it as desired.


#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; csrf
  - Laravel has a security feature that automatically passes a `419 Page Expired` error upon submitting forms that cannot be verified. The error stems from `CSRF` and it is usually solved by passing an encyption token from the home server to stop malicious users from `cURLing` invalid form data from outside of the actual form page. The directive `@csrf` as the next line, inside of a HTML form object, is all you need to fix this issue. This ensures that `API` calls for the application are validated from Laravel and not an outside source.

  - The `@csrf` directive generates an HTML component like `<input type="hidden" name="_token" value="<session_key>">`. Laravel will check the front-end distributed `<session_key>` with the back-end `<session_key>` to ensure that they match. The `<session_key>` will also persist until the amount of minutes specified by the environment variable `SESSION_LIFETIME`, editable in the `.env` file.


### Laravel Mailers
Laravel comes with an easy to use, out of the box, email system using mailtrap.io. Get an account, open an inbox, and copy and paste your username and password into the `.env` file provided in your Laravel application. You can initiate a new mailable class and associated Markdown view with `php artisan make:mail <MailClassName> -m <md_path_to_view_file>`. The path prepends the `/resources/views/` path by default.


### Misc.

  * For support of Laravel 5.7, the `or` Blade operator has been replaced with the PHP-5 default `??` operator for defaulting away from `null` or `false` data.

  * Any time that you change the `.env` file, you must also restart the Laravel server for the environment changes to take place.

  * Laravel paths start at the `public/` directory by default simply by prepending any path with `/` like `/path/to/asset/<asset>.ext`. The public directory is the only directory that normal users are allowed to access within your application.

  * The function `dd()` (Dump and Die) is a very powerful function for Laravel that can replace PHP's default `var_dump()` function. It displays any information passed to it then returns and kills program execution, halting any following sequential statements



