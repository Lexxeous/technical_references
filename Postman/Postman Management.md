<!-- Postman Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Postman Management: <img src="../.pics/Postman/postman_logo.png" width="100px"/>

## I. Summary

**Postman** is a quick and powerful way to test custom and 3rd-party back-end APIs without the need for a front-end interface. As long as the back-end API runs with HTTP RESTful actions, **Postman** is a great pick (however, there are options to run **Postman** requests with legacy API systems).

## II. Installation:

  * [Web Application](https://www.postman.com/) - (*Easiest*)
  * [Standalone Desktop Application](https://www.postman.com/downloads/) - (*Recommended*)
  * [Google Chrome Extension](https://chrome.google.com/webstore/detail/postman-interceptor/aicmkgpgakddgnaphhhpliifpcfhicfo) - (*Deprecated*)

## III. GUI Sections:

### III.i. Request Builder:

<img src="../.pics/Postman/section_request_builder.png" width="100%" style="border: 5px solid orange;"/>

> Click on the <img src="../.pics/Postman/section_request_builder_eye.png" width="40px"/> button (in the top right corner) to get a quick view of the current environment. This includes things like environment and global variable initial/current values.

#### III.i.a. Builder Request Types: 

| Request    | Description                                                                                  |
|:----------:|:---------------------------------------------------------------------------------------------|
| GET        |  |
| POST       |  |
| PUT        |  |
| PATCH      |  |
| DELETE     |  |
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


#### III.i.c. Request Builder Authorization:

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

#### III.i.g. Request Builder Tests:

*Tests* allow us to run code/scripts to interact with the data that we get from **Postman** requests. Think of this as an alternative to having an interactive front-end already developed for your application. Instead, we can write **Postman** (`pm`) scripts (with **JavaScript**) to do things like:

  * Get/Set Global/Environment variables
  * Check for the value of status code(s)
  * Interpret the value of a JSON string
  * Inspect HTTP headers
  * etc...

> One of the best ways to get started with **Postman** *tests* is to use the provided snippets. The snippets will automatically inject the relevant code for the task you wish to run in the script. Otherwise, you can learn more about writing **Postman** *tests* with [the "Writing tests" documentation](https://learning.postman.com/docs/writing-scripts/test-scripts/).


#### III.i.h. Request Builder Settings:

#### III.i.j. Request Builder Response:

<img src="../.pics/Postman/section_request_builder_response.png" width="100%" style="border: 5px solid orange;"/>

##### III.i.j.1. Request Builder Response Body:

##### III.i.j.2. Request Builder Response Cookies:

##### III.i.j.3. Request Builder Response Headers:

##### III.i.j.4. Request Builder Response Test Results:

When you write *Tests* with the *Request Builder*, if those tests make assertions or attempt to validate the existance or value of something, then the results of those *Tests* will be displayed in this section.

### III. Collections:

*Collections* allow you to store groups of requests that are useful for a particular project, website, etc. This allows greater for greater granularity on organization for projects. *Collections* and their requests can be documented, forked, commented on, watched, organized into folders, & can provide relevant code snippets.

<img src="../.pics/Postman/section_collections.png" width="50%" style="border: 5px solid orange;"/>

> You can also provide custom names to requests and have multiple requests of the same "type" in the same collection.

The *Collections Runner* allows you to run all of the requests in a given collection. You can determine which requests to run, modify their order, specify an amount of iterations, choose optional delay (in milliseconds), among other useful options.

<img src="../.pics/Postman/section_collections_runner.png" width="100%" style="border: 5px solid orange;"/>

### III.ii APIs:

### III.iii Environments:

### III.iv Mock Servers:

### III.v Monitors:

### III.vi Flows:

### III.vii History:

## IV. Misc: