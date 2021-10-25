<!-- Angular Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Angular Management: <img src="../.pics/JS/angular_logo.png" width="90px"/>

# Summary:

**Angular** is a front-end application design JS framework and development platform for creating efficient and sophisticated single-page apps.

Like other front-end frameworks, **Angular** is typically used to create single-page apps that run on a client, but it can also be used to create full-stack apps by making HTTP requests to a back-end server as well. Additionally, **Angular** can be run on the server-side (back-end) with tools like **Angular** Universal.

> For more information, visit the [**Angular** online documentation](https://angular.io/docs).

### Why Use Angular?:

  * **Angular** is a full-featured framework (but has a steep learning curve)
  * Creates dynamic front-end applications and UIs
  * Has optional integration of TypeScript (superset of JS)
  * Uses the [**RxJS**](https://rxjs.dev/) JS library for efficient asyncronous programming
  * Ability to run end-to-end and unit tests
  * Popular in industry and enterprise business

### What to know first?:

  * HTML basics
  * CSS (or derivatives like SCSS, SASS, LESS, etc...)
  * JS fundamentals
  * Asyncronous programming (promises)
  * Array methods (forEach, map, filter, etc...)
  * API/HTTP requests
  * [NPM (Node Package Manager)](https://www.npmjs.com/)

### Angular Components:

The **Angular** framework is component driven. This means that code can be resused and placed anywhere. Components are pieces of UI template code that include things like HTML, logic, and styling. Since components are reusable, they can be embedded into a template in an XML-like fashion, using custom HTML tags.

```ts
// Example TypeScript main app component file
// app.component.ts

import { Component } from '@angular/core'; // import default Angular core component class

@Component({ // create new component with properties
	selector: 'app-<component_name>', // tag name
	templateUrl: './<component_name>.component.html', // path to html
	styleUrls: ['./<component_name1>.component.css', './<component_name2>.component.css', ...]
	providers: [<ComponentService>]
})

// Here add custom properties, methods, lifecycle methods, etc...
export class ComponentName {
	title: string = '<title-name>'; // declare strict datatyping 
	/* ... */
}
```

```ts
// Example TypeScript header component file
// header.component.ts

import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  constructor() { }

  ngOnInit(): void { // lifecycle method (code runs when the component loads)
  }

}
```

You can generate new custom components and structure the files and folders however you like. It is customary to have all of the generated components inside of `src/app/components/<component_name>`. The `app.module.ts` file will be automatically updated to reflect the changes.

```sh
# Create new component
ng generate component [path]/<component_name> 
```

### Angular Services:

**Angular** services are typically used to serve one function (each) for your application, such as data fetching, input validation, logging data, etc... Services are distinguishable from components as they increase modularity and reusability of your code. By separating a component's view-related functionality from other kinds of processing, you can make your component classes lean and efficient. Components can also delegate certain tasks to these services. 

### Angular CLI (Command Line Interface):

For more information, visit [**Angular**'s setup documentation page](https://angular.io/guide/setup-local).

```sh
# Initial Angular application setup

npm install -g @angular/cli
ng new <new-app-name>
cd my-app # navigate to project location
ng serve # runs by default on port 4200
```

> If you receive the `ERR_OSSL_EVP_UNSUPPORTED` error, try first running the `export NODE_OPTIONS=--openssl-legacy-provider` envionment variable configuration command, as suggested [here](https://github.com/webpack/webpack/issues/14532).


### `ng`:

Available Commands:

  * `add` – Adds support for an external library to your project.
  * `analytics` – Configures the gathering of Angular CLI usage metrics. See https://angular.io/cli/usage-analytics-gathering.
  * `build` (b) – Compiles an Angular app into an output directory named dist/ at the given output path. Must be executed from within a workspace directory.
  * `deploy` – Invokes the deploy builder for a specified project or for the default project in the workspace.
  * `config` – Retrieves or sets Angular configuration values in the angular.json file for the workspace.
  * `doc` (d) – Opens the official Angular documentation (angular.io) in a browser, and searches for a given keyword.
  * `e2e` (e) – Builds and serves an Angular app, then runs end-to-end tests.
  * `extract-i18n` (i18n-extract, xi18n) – Extracts i18n messages from source code.
  * `generate` (g) – Generates and/or modifies files based on a schematic.
  * `help` – Lists available commands and their short descriptions.
  * `lint` (l) – Runs linting tools on Angular app code in a given project folder.
  * `new` (n) – Creates a new workspace and an initial Angular application.
  * `run` – Runs an Architect target with an optional custom builder configuration defined in your project.
  * `serve` (s) – Builds and serves your app, rebuilding on file changes.
  * `test` (t) – Runs unit tests in a project.
  * `update` – Updates your application and its dependencies. See https://update.angular.io/
  * `version` (v) – Outputs Angular CLI version.


### Angular HTML:

```html
<!-- Example Angular HTML file -->
<!-- app.component.html -->

<h1>{{title}}</h1> <!-- string interpolation and pass data from component -->
<h1>{{title.toUpperCase()}}</h1> <!-- can use default JS methods -->
<h1>{{5+5}}</h1> <!-- can do operations and will be converted to a string -->
```








