<!-- Robot Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Robot Management: <img src="../.pics/Python/Robot/robot_logo.jpg" width="90px"/>

## Summary:

**Robot** is a free, open-source test automation framework for Python. Developed in Finland by Pekka Klarck for his Master's Thesis in 2005. Version 1.0 was created at Nokia Siemens Networks. In 2008, Version 2.0 was released as open-source software.

**Robot** is cross platform and can be run on Windows, Mac, and Linux based operating systems. It is a keyword-driven software with data-driven capabilities.

## Installation:

1. Install Python and `pip`.
2. Use `pip` to install the **Robot** framework.
3. Use `pip` to install the **Selenium** library.
    - If you are using current versions of **Python** and the **Robot** framework, install the current development branch of `SeleniumLibrary` to avoid **Python** import errors by running `pip install git+https://github.com/robotframework/SeleniumLibrary.git`.
4. Install desired browser applications (Internet Explore, Google Chrome, Firefox, Safari, etc).
5. Install **Selenium** web-drivers for each browser.
6. Install the Pycharm IDE and Intellibot plugin (optional).

> It is not guaranteed that the 64-bit web-driver versions will work, so the 32-bit versions are recommended for now.

> Follow official [documented install instructions](https://www.selenium.dev/downloads/) for your OS and browser platform(s).

> After downloading the web-driver `.zip` files, extract the executable contents into a known directory, and add the aforementioned directory to your system or user `PATH`.

### Windows:

1. Install [Python](https://www.python.org/downloads/windows/) (3.7+).
    * Make sure that `python --version` and `pip --version` return values.
2. Run `pip install robotframework`.
    * Make sure that `robotframework` is listed as a package after running `pip list`.
3. Run `pip install selenium` and `pip install robotframework-seleniumlibrary`
    * Make sure that `selenium`  and `robotframework-seleniumlibrary` are listed as packages (along with their dependencies) after running `pip list`.
4. Install desired browser applications (Google Chrome, Firefox, Opera, etc).
5. Install **Selenium** web drivers for each browser.
    * The [32-bit IE web-driver](https://github.com/SeleniumHQ/selenium/releases/download/selenium-4.0.0/IEDriverServer_Win32_4.0.0.zip) from the [official Selenium downloads page](https://www.selenium.dev/downloads/).
    * The [32-bit Firefox web-driver](https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-win32.zip) from [Mozilla's official GekoDriver releases page](https://github.com/mozilla/geckodriver/releases).
    * The [32-bit Google Chome web-driver](https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_win32.zip) from the [Chromium downloads page](https://chromedriver.chromium.org/).
    * The [32-bit Microsft Edge web-driver (for Edge build 96.0.1054.29)](https://msedgedriver.azureedge.net/96.0.1054.29/edgedriver_win32.zip) from [Microsoft's official web-driver tool downloads page](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/#downloads).
6. // TODO

### macOS:

// TODO

https://www.python.org/downloads/macos/

Safari already has a web-driver built in

### Linux:

// TODO

https://www.python.org/downloads/source/

## Test Automation Framework:

  * **Programming Language** - How to write your tests.
  * **Scripts** - Can create files that do multiple tasks.
  * **Reusable Entities/Objects** - Removes unnecessary redundancy.
  * **Includes Supporting Libraries** - Core, Standard, Import (test web, APIs, DBs, mobile, etc).
  * **Abstraction** - Increased readability and usability.
  * **Test Runner** - Selective run capabilities and tags.
  * **Setup & Teardown** - Suite/test recovery.
  * **Reports** - Results, summaries, aggregation, timestamps, drill downs, search, screenshots.
  * **Integration** - Scheduled tests & CI/CD automation.
  * **Parallel Execution** - Run multiple test scripts at the same time in same or different locations.
  * **Conventions** - Standardization and consistency.


## Libraries:

### Standard:

  * BuiltIn
  * OperatingSystem
  * Dialogs
  * String
  * XML
  * Process
  * Collections (for lists and dictionaries)
  * DateTime
  * Screenshot
  * Remote
  * Telnet
  * etc...

### External (with `pip install`):

  * [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) (testing framework for web apps)
    * can use multiple programming languages like Java, C#, Python, etc...
  * Appium (for native mobile app testing)
  * FTP
  * SSH
  * Database
  * Diff
  * Swing
  * Archive
  * Android
  * MongoDB
  * etc...


## Organizing Project Files:

  * /Tests
    * /product-1
      - feature1.robot
      - feature2.robot
    * /product-2
      - feature1.robot
  * /Resources
    * common.robot (common keyword file for all products)
    * /product-1
      - feature1.robot (keyword file for the first feature of product 1)
      - feature2.robot
      - /page-objects
        - po1.robot
        - po2.robot
  * /Results
    * /product-1
    * /product-2
  * /Libraries
    * /my-custom-robotframework-library


## Script File:

### Sections:

> Sections always begin with 3 asterisks.

> You must use 2 spaces between keywords and parameters.

> You must indent blocks with 4 spaces.

#### Settings:

```robot
***Settings***

Documentation   Some information about the suite

# Import library
Library         <library_name>

# Path to keywords file(s)
Resource        <path/to/resource.robot>

# Run keyword prior to suite execution
Suite Setup     <before_suite_keyword>

# Run keyword after suite execution
Suite Teardown  <after_suite_keyword>

# Run keyword prior to all test's execution
Test Setup      <before_test_keyword>

# Run keyword after all test's execution
Test Teardown   <after_test_keyword>

# Wait before error thrown
Test Timeout    <global_timeout>
```
#### Variables:

```robot
***Variables***

# TODO
```

Declare variables...

#### Test Cases:

```robot
*** Test Cases***
<Test case title>

    [Documentation]  Some information about the test.
    [Tags]  Tag1  Tag2  ...  TagN
    [Timeout]  X
    
    # Pre-conditions (setup for test actions)
    # Test case steps (test actions)
    # Post-conditions (clean up after test actions)
```

#### Keywords:

You can "prototype" user-defined keyword definitions. This is similar to prototyping custom functions in general purpose programming languages. When the user-defined keyword(s) are in the same file, from which they are being called, they do not prefix a resource location in the results. If the user-defined keyword(s) are abstracted to an external file, and imported as a resource, they do prefix a resource location in the results.

```robot
***Keywords***

Custom Keyword Phrase
    Do Something  [parameter]
```

> Optional. Typically put keywords in associated `Resources` files.

## Executing **Robot** Files:


Depending on the version of **Robot**, the supporting language (**Python**, **Java**, etc..) you are using, and your underlying operating system, you may need to use one of the following options for running **Robot** scripts. <a href="https://github.com/robotframework/robotframework/issues/1857#issuecomment-400495930" target="_blank">Here</a> is a GitHub issue where the creator of **Robot**, confirms that using `robot.run`, `robot.exe`, and `robot.bat`, are valid ways to run **Robot** scripts.


https://stackoverflow.com/questions/69749942/getting-error-cannot-import-name-run-cli-from-robot-with-gitlab-ci-runner

  * `pybot` - Use for **Robot** v1.x and v2.x.
  * `robot` - Use for **Robot** v3.x+.
  * `python -m robot`
  * `python -m robot.run`
  * `python -m robot.exe`
  * `python -m robot.bat`

### Flags:

  * `-d --outputdir <path/to/output/dir>` - Specify output directory for results.
  * `-i --include <tags>` - Include only a subset of tests to run based on custom tags.
  * `-N --name <name>` - Set the name of the top level suite. By default the name is created based on the executed file or directory.
  * `-t --test <name>` - Specify the name of a unique test case that you want to run.


### Run Multiple Suites:

Using something like `python -m robot -d Results/ <path/to/desired/suite/folder>/` will run all of the suites/test cases in all folders and sub-folders with in the desired directory.


### Run a Single Test Case:

You can run a single **Robot** test case by using the `-t` option/flag by running something like `python -m robot -d Results -t <test_case_name> [path/to/test/file].robot`. If you do not specify a test file location for the `<test_case_name`, then **Robot** will run all test cases that have `<test_case_name>`, in all the current sub-folders.

> You can also use the `-i` option/flag to achieve the same result.

> Using the `-t` option requires more specificity, but the `-i` option creates much more cluttered logs with nested folder structures. Use your own preferences to balance these pros and cons.


### With a Batch File:

```batch
rem <robot_file>.bat

@echo off
cd <path/to/robot/proj>
call <robot_command>
```

> Double click on the **Batch** file with the GUI or run `<robot_file>.bat`, to execute.


### With Windows Task Scheduler:

// TODO
// use task scheduler application to create a new task and point to .bat file
// can schedule to run in increments or at specific time
// include screenshots

### Remotely with SauceLabs:

//TODO
// 3rd party vendor that you have to pay for
// can watch the tests run on the website
// can view screenshots and videos of your tests
https://saucelabs.com/


### With Jenkins:

//TODO
//can have single button click and parallel execution of tests
// can be complex to configure
// test cases live in a git repo
// have to install Jenkins and RF plugin