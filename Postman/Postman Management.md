<!-- Postman Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Postman Management: <img src="../.pics/Postman/postman_logo.png" width="100px"/>

## I. Summary

**Postman** is a quick and powerful way to test custom and 3rd-party back-end APIs without the need for a front-end interface. As long as the back-end API runs with HTTP RESTful actions, **Postman** is a great pick (however, there are options to run **Postman** requests with legacy API systems).

For more information, please see the [official **Postman** documentation](https://learning.postman.com/docs/getting-started/introduction/).

## II. Installation:

  * [Web Application](https://www.postman.com/) - (*Easiest*)
  * [Standalone Desktop Application](https://www.postman.com/downloads/) - (*Recommended*)
  * [Google Chrome Extension](https://chrome.google.com/webstore/detail/postman-interceptor/aicmkgpgakddgnaphhhpliifpcfhicfo) - (*Deprecated*)

## III. GUI Sections:

### III.i. [Request Builder](https://learning.postman.com/docs/sending-requests/requests/):

<img src="../.pics/Postman/section_request_builder.png" width="100%" style="border: 5px solid orange;"/>

> Click on the <img src="../.pics/Postman/section_request_builder_eye.png" width="40px"/> button (in the top right corner) to get a quick view of the current environment. This includes things like environment/global/collection variable initial/current values.

> Variables in **Postman** can have global, collection, environment, data, or local-level scope.

> A request should follow the following format: `<request_type> <protocol>://<website_name>/<endpoint>`.

#### III.i.a. Builder Request Types: 

| Request    | Description                                                                                  |
|:----------:|:---------------------------------------------------------------------------------------------|
| GET        | retrieve resource representation/information only; not modify data in any way |
| POST       | create new subordinate resources |
| PUT        | to update an existing resource (if resource doesn't exist, the specific API decides what to do) |
| PATCH      | make a partial update on a resource |
| DELETE     | delete the resources |
| COPY       |  |
| HEAD       |  |
| OPTIONS    |  |
| LINK       |  |
| UNLINK     |  |
| PURGE      |  |
| LOCK       |  |
| UNLOCK     |  |
| PROPFIND   |  |
| VIEW       |  |

#### III.i.b. Request Builder Params:

> Typically prefixed with the `?` character in the URL, assigned with the `=` character, then additional params added with the `&` character. Ex. `https://website.com?param1=1&param2="two`

The variable on the LHS of the equals sign is the *key* and the quantity/string on the RHS of the equals sign is the *value*. These are *key*-*value* pairs that are very similar to JSON and **Python** dictionary notation. You can provide the *key*-*value* pair manually in the request, or you can provide them in the *Query Params* section.

There is a difference between "path parameters" and "query parameters". Path parameters are required in the URL path (the endpoint that is specified with forward slashes `/`.) Query parameters always come after the URL path and the question mark character `?`.

> Optionally, with **Postman** you can include path parameters as "pseudo-variables", dynamically, by prefixing a colon character and the name of the path variable like: `:<path_var_name>:`. Then, **Postman** provides an extra section under *Params* to enter custom values for path variables.


#### III.i.c. Request Builder Authorization:

Authentication with the request builder provides you with the following options:

  * Inherit Auth From Parent
  * No Auth
  * API Key
  * Bearer Token
  * Basic Auth
  * Digest Auth
  * OAuth 1.0
  * OAuth 2.0
  * Hawk Authentication
  * AWS Signature
  * NTLM (New Technology LAN Manager) Authentication
  * Akamai EdgeGrid

#### III.i.d. Request Builder Headers:

#### III.i.e. Request Builder Body:

The *body* allows you to send data to a specified endpoint using the following data formatted options:

  * None
  * Form
  * `x-www-form-urlencoded`
  * Raw
  * Binary
  * GraphQL

and allows the data to be interpreted as the following file formats:

  * Text
  * JavaScript
  * JSON
  * HTML
  * XML

> The *body* section has a "Beautify" button that will lint your inputted data for you.

> Global variables can be referenced in the *body* with string interpolation, using the `"{{<var>}}"` syntax.

#### III.i.f. Request Builder Pre-request Script:

These scripts will run prior to a request actually being sent/executed. However, you cannot write tests/assertions because there is no response to act upon.

An example of some useful pre-request script actions could be:

  * calculating current timestamps
  * generating some random data
  * save data to variable(s) for use in the post-request test(s)
  * setup output logging

#### III.i.g. Request Builder Tests:

*Tests* allow us to run code/scripts to interact with the data that we get from **Postman** requests. Think of this as an alternative to having an interactive front-end already developed for your application. Instead, we can write **Postman** (`pm`) scripts (with **JavaScript**) to do things like:

  * Get/Set Global/Environment variables
  * Check for the value of status code(s)
  * Interpret the value of a JSON string
  * Inspect HTTP headers
  * etc...

> One of the best ways to get started with **Postman** *tests* is to use the provided snippets. The snippets will automatically inject the relevant code for the task you wish to run in the script. Otherwise, you can learn more about writing **Postman** *tests* with [the "Writing tests" documentation](https://learning.postman.com/docs/writing-scripts/test-scripts/).

A single request can have multiple *tests* and they run after the request is completed. Most *tests* are assertion based, asserting that a value or statement is true, false, exists, or doesn't exist. If any of the assertions fail after a request is made, the entire *test* fails.

> Make sure that you write *tests*/assertions that CAN fail.

The code below is an example of a simple **Postman** assertion/*test* that checks the value of the status code for a request's response. This test checks for a status code of `200`. The **Postman** `test()` function, in this case, takes a string and a call-back function as its input arguments.

```js
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

> ! ! !
> IMPORTANT NOTE: Using `.equal()` and `.eql()` do not provide the same functionality. The former function checks that object `<A>` is the exact same object as object `<B>`. This is not typically useful as it is more common to check the values of the properties contained within objects. The latter function exhibits such behavior.
> ! ! !

**Using the Chai Assertion Library for Tests**:

**[Chai](https://www.chaijs.com/api)** is a behavior-driven assertion library that is built into **Postman** that is able to create very human-readable assertion chains.

**Recycling Tests**:

If you want to re-use previously defined tests somewhere else in **Postman**, you can define them inside of an anonymous function, set that function to a variable, declare the variable as an environment string, then evaluate the string, upon retrieval from the environment.

> The `eval()` function can be very dangerous, as it runs any code that is placed inside of it. Only run stringified code inside of `eval()` that you wrote yourself, that you completely understand its implications, and/or that you totally trust.

```js
// Define tests to re-use
let common_tests = () => {
  pm.test("Status code is 200", function() {
    pm.response.to.have.status(200);
  });

  // more tests...
}

// Set tests as string variable in an environment
pm.environment.set("common_tests", common_tests.toString());

// Retrieve and evaluate re-usable tests
eval(pm.environment.get("common_tests"))();
```

#### III.i.h. Request Builder Settings:

#### III.i.j. Request Builder Response:

<img src="../.pics/Postman/section_request_builder_response.png" width="100%" style="border: 5px solid orange;"/>

##### III.i.j.1. Request Builder Response Body:

HTTP REST API responses can come in a variety of formats.

  * JSON - `pm.response.json()` (most common)
  * XML - `xml2Json(pm.response)`
  * HTML - `cheerio(pm.response.text())` ([Cheerio](https://github.com/cheeriojs/cheerio) is a built-in library for **Postman**)
  * Plain-Text - `pm.response.text()`
  * CSV - `csv-parse/lib/sync` ([Sync API](https://csv.js.org/parse/api/sync/)), `Papa.parse(csv)` ([PapaParse](https://www.papaparse.com/))

CSV is the only format for which **Postman** does not have a built-in way to parse, but rather relies on external libraries. Below is an example of how to use the *PapaParse* library to parse CSV data.

First, we can get the most recent version of a *GitHub* library in a minimized format.

```js
// 1. Setup
// GET "https://raw.githubusercontent.com/mholt/PapaParse/master/papaparse.min.js" for latest version of library

pm.globals.set("PapaParseLibrary", response_body);
```

Then we can write a test script for the request that returns CSV data in its response body.

```js
// 2. Using PapaParse in a solution
// GET <request_that_returns_csv_response>

// Put the PapaParse library into a string
eval(pm.globals.get("PapaParseLibrary"));
let Papa = this.Papa;

// Set the header config property to "true" if there is a CSV header to parse
const parserConfig = {
  header: true;
}

// Parse the response body
let parsedBody = Papa.parse(response_body, parserConfig);
console.log(parsedBody);

// Example test to check for values in a CSV response body
pm.test("ABC123 was done properly", function() {
  for(let invoice of parsedBody.data) {
    console.log(invoice);
    if(invoice.code = "ABC123") {
      pm.expect(invoice.value).to.eql("$1000");
    }
  }
});

// Clean up environment
pm.globals.unset("PapaParseLibrary");
```

##### III.i.j.2. Request Builder Response Cookies:

`pm.response.cookies`

##### III.i.j.3. Request Builder Response Headers:

`pm.response.headers`

##### III.i.j.4. Request Builder Response Test Results:

When you write *Tests* with the *Request Builder*, if those tests make assertions or attempt to validate the existance or value of something, then the results of those *Tests* will be displayed in this section.

### III.ii Collections:

*Collections* allow you to store groups of requests that are useful for a particular project, website, etc. This allows greater for greater granularity on organization for projects. *Collections* and their requests can be documented, forked, commented on, watched, organized into folders, & can provide relevant code snippets.

<img src="../.pics/Postman/section_collections.png" width="50%" style="border: 5px solid orange;"/>

> You can also provide custom names to requests and have multiple requests of the same "type" in the same collection.

The *Collections Runner* allows you to run all of the requests in a given collection. You can determine which requests to run, modify their order, specify an amount of iterations, choose optional delay (in milliseconds), among other useful options.

<img src="../.pics/Postman/section_collections_runner.png" width="100%" style="border: 5px solid orange;"/>

> You can share a collection in a variety of ways: inviting collaborators via email, making your collection public and allowing forks, and sending current state URL links to JSON data. Keep in mind that URL links to JSON data are only valid for a single state of the collection. An updated link is required if an update was made to the collection.

#### III.ii.a Authorization:

*Collections* in **Postman** provide all of the same authentication options except for "Inherit Auth From Parent", because *collections* have no parent to inherit from. When setting the authentication method for the *collection*, all child requests that are set to inherit the authentication method from the parent will use the method defined for the *collection*. Otherwise, you can set a different authentication method for each individual request, if desired.

#### III.ii.b Pre-request Script:

*Scripts* defined at the collection level will run before every request in said collection.

#### III.ii.c Tests:

*Tests* defined at the collection level will run after every request in said collection.

#### III.ii.d Variables:

*Variables* defined at the collection level (within the collection's scope) are available only to said collection and can be referenced in a request using the `{{<var}}` interpolation syntax.

The following diagram represents the scope of variables in **Postman**. By default, the variable values will be overwritten by its most narrow scope. For example, if a variable exists in a collection-level scope but also exists in the local-level scope, the local-level scope will take precedence.

<img src="../.pics/Postman/variable_scope.jpg" width="50%" style="border: 5px solid orange;"/>

**Variable scope pros and cons**:

  * Global (`pm.globals`):
    - Good for quick prototyping
    - Can be accessed from anywhere
    - Creates messy/sloppy code
    - Should be avoided and not used in permanent solutions

  * Collection (`pm.collectionVariables`):
    - Tied to a specific collection for values that should not change
    - Can be updated with a script
    - Useful for specific group(s) of API calls, not for whole environment testing
    - Can eliminate duplicate environment variable data

  * Environment (`pm.environment`):
    - Ideal for working with different servers and isolated services
    - Tied to the currently selected **Postman** environment
    - Can pass data to other requests
    - Use for URLs, authentication, etc...

  * Data (`pm.iterationData`):
    - Used when working with external datasets
    - Exist only during the execution of an iteration
    - Import when using collection runner
    - Can only be set from a CSV or JSON file

  * Local (`pm.variables`):
    - Can pass data within a specific request, within a collection, or between Collection Runner and Newman iterations
    - Only created with scripts, no GUI manipulation offered
    - Local variable no longer exists after its request script has been executed
    - Will override all other scopes

> For more information about **Postman** variables and variable scope, see [Demystifying Postman Variables: HOW and WHEN to use Different Variable Scopes](https://medium.com/apis-with-valentine/demystifying-postman-variables-how-and-when-to-use-different-variable-scopes-66ad8dc11200).

<img src="../.pics/Postman/section_collections_variables.png" width="90%" style="border: 5px solid orange;"/>

### III.iii APIs:

### III.iv Environments:

Environments in **Postman** are very similar to system-level and user-level environments for standard operating systems. You should use environments and environment variables when you intend to separate information that is specific to a particular collection or service under test. For example, if you needed to test 2 or more mutually exclusive APIs, but both required an API key, for authentication, you could use environments to specify the same variable, `api-key`, but simply switch environments between said isolated API tests.

> As a forewarning, environment (and global) variables do not persist, during runtime, when using test automation tools like Monitors, **Newman**, and **Jenkins**. You will have to use an alternate method to specify necessary parameters. This can be in the form of collection variables with *Initial Value*s, command line flags/arguments, or setting the desired variables on the server that will be running the automated tests.

### III.v Mock Servers:

A mock server is a fake/dummy API that simulates a server response in an attempt to behave like the "real" API. They can be used to serve canned responses to specific requests.

Mock servers are useful for API design, prototyping, development, and testing. For example, mock servers can be used as an alternative to continued API development, when the "real" server is down. If it is already known what the response for certain requests is supposed to look like, development can continue by hard-coding said responses, then moving the API prototype design to the "real" server later. Another example is to use a mock server that emulates the behavior of an external server entity for testing purposes. If you don't want to send real, sensitive data during testing and know how the "real" external server is supposed to respond, you can separate the sending of test data and sensitive data between the mock and "real" servers, respectively.

> **Postman** provides free integration for mock servers, right within the application.

After clicking the "Mock Servers" and starting the creation process, you should be presented with the following view. Here, you are able to define any arbitrary request method, request URL, response code, and response body that you would like to simulate.

> ! ! !
> IMPORTANT: The mock server creation process will provide you with a unique base-URL by default, there is no reason to specify it during this step or come up with your own.
> ! ! !

<img src="../.pics/Postman/section_create_mock_server_1.png" width="100%" style="border: 5px solid orange;"/>

The next step allows you to name your mock server, create an environment for it, make it public or private, and to specify a certain amount of simulated network delay (in ms).

> The default URL environment variable is set to `{{url}}`.

<img src="../.pics/Postman/section_create_mock_server_2.png" width="100%" style="border: 5px solid orange;"/>

When the mock server is created, **Postman** will provide you with the unique base-URL and will list the new mock server in the "Mock Servers" tab and in the "Collections" tab. From the "Collections" tab, you can drill down to the requests and edit their default behaviors. The format of the custom base-URL that gets generated for you is: `https://<hex_val_1>-<hex_val_2>-<hex_val_3>-<hex_val_4>-<hex_val_5>.mock.pstmn.io`.

<img src="../.pics/Postman/section_create_mock_server_3.png" width="100%" style="border: 5px solid orange;"/>

From the "Collections" tab, you can select a specific request, click on the ellipsis in the top right corner, and add an example that behaves differently than the default behavior.

<img src="../.pics/Postman/section_create_mock_server_4.png" width="100%" style="border: 5px solid orange;"/>

### III.vi Monitors:

Monitors in **Postman** are primarily offered to *Pro* user accounts, but are also available in limited amounts to free accounts (1000 API calls per month).

Monitors allow you to run a set of tests at regular time intervals.

<img src="../.pics/Postman/section_create_monitor.png" width="90%" style="border: 5px solid orange;"/>

Known limitations to **Postman** monitors are:
  * The servers running the tests are not on the same network as you.
  * Monitors cannot import currently existing global variables, only currently existing environment variables.
  * Global & environment variables are not persisted through sequential tests during runtime.
    - May be best to use collection variables instead.

### III.vii Workflows, Flows, & Scenarios:

By default, the **Postman** collection runner will allow you to manually skip over requests, but all of the requests will still execute in order. Furthermore, all of the requests that are made must be within the same collection. With *workflows*, it is possible to change the default execution order of requests within a collection.

There are 4 primary functions that are available that can assist in the *workflow* of collection requests.

  * `postman.setNextRequest("<req_name>")` - Sets which request, in the same collection, will be next to execute.
  * `postman.setNextRequest("<req_id>")` - Sets which request, in the same collection, will be next to execute.
  * `pm.info.requestName()` - Gets the current request name and returns it as a string.
  * `pm.info.requestId()` - Gets the current request ID and returns it as a string.

The placement/location of the aforementioned functions in the request test, or in the pre-request script, is inconsequential. The current request will still execute all of its test and pre-request logic, as normal, then proceed to the appropriate "next request". Additionally, you can halt the execution of all subsequent requests by using `postman.setNextRequest(null)`.

#### III.vii.a: Flows:

Flows are similar to *workflows* in the fact that you can maneuver around requests in a non-sequential manner. However, *flows* allow you to call any request from any collection, with any environment for each unique request. You can also create custom flowchart-type connections for data checks, concatenation, conditionals, data creation, durable data creation, delay, loops, grouping, lists, merging, terminal output, variable creation and assignment, test summaries, and data validation. All of these aforementioned functions are available on a smooth drag-and-drop canvas GUI that can be easily edited and documented via annotations.

<img src="../.pics/Postman/section_create_workflow.png" width="100%" style="border: 5px solid orange;"/>

#### III.vii.b Router Scenarios:

Another way to maneuver between different request "paths", is to create router scenarios. Before using the **Postman** collection runner, you can import a JSON data file that has desired, hard-coded routes. This data file pre-defines a set of orders that you want your requests to be executed in.

```jsonc
// Example routes.json data file. 

// <request_1_name>
// <request_2_name>
// <request_3_name>
// <request_4_name>
// <request_5_name>
// <request_6_name>

[
  {
    "routes": [
      "Request 1", // <request_1_name>
      "Request 2", // <request_2_name>
      "Request 3", // <request_3_name>
      "Request 4" // <request_4_name>
    ]
  },
  {
    "routes": [
      "Request 1", // <request_1_name>
      "Request 3", // <request_3_name>
      "Request 5", // <request_5_name>
      "Request 6" // <request_6_name>
    ]
  },
  {
    // Add any arbitrary amount of pre-defined routes...
  }
]
```

In order for your requests to communicate with the "router", we also need some JS logic to handle the parsing of the `routes.json` data file. Comparatively speaking, this type of communication is similar to how multiple hardware routers in a networking system behave.

```js
// getNextRequest.js
// This script will get called after every request in the collection.

postman.setNextRequest(getNextRequest());

function getNextRequest() {
  let routes;
  if(Array.isArray(pm.globals.get("remainingRoutes")) === true) {
    routes = pm.globals.get("remainingRoutes");
  }
  else {
    routes = pm.iterationData.get("routes"); // get data from JSON file
  }

  const nextRequest = routes.shift();
  pm.globals.set("remainingRoutes", routes);

  if(nextRequest === undefined) {
    pm.globals.clear("remainingRoutes");
    return null;
  }

  return nextRequest;
}
```

There are 2 ways to enable the routing for collection requests:

1. Define an independent request (named "Router") that acts as the router, then use `getNextRequest.js` to handle the routing logic in its test script, while having all requests use `postman.setNextRequest("Router")`, in their test scripts. In this case, you need to include `<request_1_name>` as the first request in all of your JSON `routes` arrays.
2. Remove any independent request that acts as a router, then attach the `getNextRequest.js` script directly to the collection itself as a test. Also remove all references to `postman.setNextRequest("Router")`, in every request. In this way, the collection itself will become its own router and automatically call the JS routing logic after every request.

> See [my public "Router Scenarios" collection](https://www.postman.com/lexxeous/workspace/public-workspace/collection/18131443-1df520ff-5471-4bae-a9ce-df6a17366624?ctx=documentation) as an example.

### III.viii History:

## IV. Misc:

### IV.i. Endpoints:

Endpoints represent different addresses/paths/locations/pages available on the website for the API. Endpoints are typically denoted with a different webpage suffix: `/<path>/[to]/[endpoint]`.

### IV.ii. Variables:

> You can highlight a subset of the request text to initiate a variable helper popup window.
> You can hover over an interpolated variable in the request builder to view its data.

#### IV.ii.a Initial vs. Current Value:

**Current Value**:

  * **Postman** uses this value by default when sending requests.
  * This values is never synced with **Postman** servers.
  * If blank/untouched, this value assumes the initial value.
  * This value will not be shared with collaborators.
  * Use this value to store sensitive data that will not be synced or shared.

**Initial Value**:

  * This value is shared with teams and other collaborating individuals when you share a collection, request, etc...
  * This value is synced with **Postman** servers.
  * Use the initial value to store general/default/template data.

### IV.iii. Importing Complex Requests from a Web Browser:

Anytime you do something on a webpage, there is probably at least one HTTP request being served in the background. If you want to capture the HTTP request of a specific action:

  * Inspect your current page
  * Go to the "Network" tab
  * Check the "Preserve log" box (optional)
  * Use the filers and options available to find the request you want
  * Right click on the request and copy as `cURL (Bash)`
  * *Import* the `cURL (Bash)` request as "Raw Text" into **Postman**

<img src="../.pics/Postman/amazon_ferrari_458_search_request.png" width="100%" style="border: 5px solid orange;"/>

### IV.iv. Test Automation Tools:

Using automation can reduce repetitive manual work, allows instant feedback when something does not work anymore, and enables identification of software bugs early in the development process.

  1. Collection Runner

See the [**Collections** section](https://github.com/Lexxeous/technical_references/blob/master/Postman/Postman%20Management.md#iiiii-collections) for more information about the Collection Runner that is built into **Postman**.

  2. Postman Monitors (w/ *Pro* account)

See the [**Monitors** section](https://github.com/Lexxeous/technical_references/blob/master/Postman/Postman%20Management.md#iiivi-monitors) for more information about the Monitors that are built into **Postman**.

  3. **Newman**

**Newman** is a CLI tool that allows a user to run **Postman** collections directly from the command line. It is installed as a global command line tool using NodeJS and NPM by running the following command: `npm install -g newman`. Validate the installation of **Newman** by running `newman --version`. Then, you can execute a **Postman** collection by running `newman run <url_link_to_collection>`.

> If you encounter an error that **Newman** is "*unable to get local issuer certificate*", you can either run the collection with the `--insecure` flag, or add an environment variable for NodeJS called `NODE_EXTRA_CA_CERTS` and set it equal to a path to any `.cer` file.

<img src="../.pics/Postman/newman_nytimes_run.png" width="100%" style="border: 5px solid orange;"/>

An alternative way to run a collection using **Newman** is with its UID and a **Postman** API key. The [**Newman** documentation](https://github.com/postmanlabs/newman#readme) has a section on [Using **Newman** with the Postman API](https://github.com/postmanlabs/newman#using-newman-with-the-postman-api).

  * First, generate an API key, `<api-key>`, from [your personal account API key settings page](https://web.postman.co/settings/me/api-keys).
  * Next, use a GET request in **Postman** to retrieve a list of your collections using `https://api.getpostman.com/collections?apikey=<api_key>`.
  * Then, locate the desired collection UID, `<coll_uid>`.
  * Next, use a separate GET request in **Postman** to retrieve a list of your environments using `https://api.getpostman.com/environments?apikey=<api_key>` (optional).
  * Similarly, locate the desired environment UID, `env_uid` (optional).
  * Finally, you can run **Newman** with an unchanging collection URL link by combining the aforementioned information as follows:

```sh
# Note the use of different UIDs for the desired collection and the desired environment.

$ newman run "https://api.getpostman.com/collections/<coll_uid>?apikey=<api_key>" \ # specify collection & API key
    --environment "https://api.getpostman.com/environments/<env_uid>?apikey=<api_key>" \ # specify env (optional)
```

This method provides a way to run **Postman** collections with **Newman** without ever having to re-export or regenerate URL links or JSON files. The changes to a **Postman** collection are automatically synced to your personal profile, then the **Postman** API always retrieves the current state information.

> ! ! !
> IMPORTANT NOTE: Variables will only persist for **Newman** calls if their "*Initial Value*" is set. The "*Current Value*" is for locally stored variables on your host machine. 
> ! ! !

**Newman Reporters**

```sh
# You can use reporting flags to format your Newman output: 

    --reporters [cli|json|junit|progress|emojitrain|html|htmlextra|...] \ # choose <reporter_name> (optional)
    --reporter-<reporter_name>-export "newman/<filename>.[txt|xml|json|...]" # export results to file (optional)

# You can specify an absolute path for file export, otherwise, the report will be placed
# in your current directory.
```

According to the [**Newman** "Configuring Reporters" documentation](https://www.npmjs.com/package/newman-reporter-html),

the default **Newman** reporters are

  * cli - Outputs to the CLI
  * json - Outputs a JSON file.
  * junit - Outputs an XML file.
  * progress - Prints a standard ASCII progress bar on the command line.
  * emojitrain - Prints an emoji-based progress bar on the command line.

and more **Newman** reporters are available for install as well by running `npm install -g newman-reporter-<reporter_name>` where `<reporter_name>` is:

  * [html](https://www.npmjs.com/package/newman-reporter-html) - Also allows customization of the [default report template](https://github.com/postmanlabs/newman-reporter-html/blob/develop/lib/template-default.hbs) with additional [reporter CLI options](https://www.npmjs.com/package/newman-reporter-html#options).
  * [htmlextra](https://www.npmjs.com/package/newman-reporter-htmlextra)
  * [csv](https://github.com/matt-ball/newman-reporter-csv)
  * etc...

> Use `newman --help` and `newman run --help` for more information.

  4. **Newman** + **Jenkins**
  5. **Newman** + other CI services

> **Newman** is a command line tool made by the same developers who created **Postman**. It is offered as a companion product. **Newman** can run tests independently from **Postman** and is ideal for running tests on a CI server like **Jenkins**.

### IV.v. Converting Postman Collections:

The current version of **Postman** no longer supports the import or use of version 1 (v1) collections. If you wish to use old **Postman** collections, you will have to convert them to version 2 (v2). Fortunately, there is a **Postman** collection version conversion tool available with NPM.

> For more information regarding the conversion tool, see the [Converting Postman Collections from v1 to v2 documentation](https://learning.postman.com/docs/getting-started/importing-and-exporting-data/#converting-postman-collections-from-v1-to-v2).

Install the conversion tool globally with NPM by running:

```sh
npm install -g postman-collection-transformer
```

Validate the package installation using:

```sh
postman-collection-transformer [-V|--version]
```

Get more help and information about the conversion tool by running:

```sh
postman-collection-transformer convert [-h|--help]
```

Then, convert the desired v1 file into a v2 file using:

```sh
postman-collection-transformer convert -i <path/to/input/v1/file>.json \ # input file
                                       -o <path/to/output/v2/file>.json \ # output file
                                       -j 1.0.0 \ # input version
                                       -p 2.0.0 \ # output version
                                       -P # pretty print output (optional)
```

### IV.vi. Writing **Postman** Results to a File:

There is no built-in way to write request and response bodies to a local file system, with the **Postman** desktop application, for security reasons. However, there is a work-around to writing data to a local file, indirectly with **Newman**. To do this, setup a local directory as a `nodejs` project. You also must have a copy of the exported **Postman** collection JSON file. For a new project, run the following commands so that the project has the correct contents.

```bash
# Create and move to new directory
mkdir <node_js_proj>
cd <node_js_proj>

# Initialize new NodeJS project and install Newman
npm init
npm install newman

# Ensure required directory contents
ls

Mode              LastWriteTime     Length  Name
----              -------------     ------  ----
d----   MM/DD/YYYY   hh:mm A/PM              node_modules
-a---   MM/DD/YYYY   hh:mm A/PM  <file_sz>   package-lock.json
-a---   MM/DD/YYYY   hh:mm A/PM  <file_sz>   package.json
-a---   MM/DD/YYYY   hh:mm A/PM  <file_sz>   <pm_collection>.json


```

Then, insert the following code into your `index.js` file:

```js
// index.js

// Import libraries 
const fs = require('fs'); // file system library
const newman = require('newman');

// Run collection with Newman
newman.run({
  collection: require('./<pm_collection>.json'), // use local JSON collection file
  reporters: 'cli'
}).on('beforeRequest', function (err, args) {
  if(err) {
    console.error(err);
  }
  else {
    // Write request to file with file system library
    let filename = Date.now() + '-request.txt';
    fs.writeFile(filename, args.request.body.raw, function(error) {
      if(error) {
        console.error(error);
      }
    });
  }
}).on('request', function (err, args) {
  if(err) {
    console.error(err);
  }
  else {
    // Write response to file with file system library
    let filename = Date.now() + '-response.txt';
    fs.writeFile(filename,args.response.stream, function(error) {
      if(error) {
        console.error(error);
      }
    });
  }
});
```

Finally, run the **JavaScript** file either with `npm start` or `node index.js`.