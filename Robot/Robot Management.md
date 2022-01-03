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
5. Install **Selenium** web-drivers for each browser.
    * A 32-bit IE web-driver from the [official Selenium downloads page](https://www.selenium.dev/downloads/).
    * A 32-bit Firefox web-driver from [Mozilla's official GekoDriver releases page](https://github.com/mozilla/geckodriver/releases).
    * A 32-bit Google Chrome web-driver from the [Chromium downloads page](https://chromedriver.chromium.org/).
    * A 32-bit Microsoft Edge web-driver from [Microsoft's official web-driver tool downloads page](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/#downloads).
      - To find the right Microsoft Edge web-driver, open the Edge web browser, click on the ellipsis (`...`) and choose `Settings`, then click on `About Microsoft Edge`, and note the version number.
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

  * [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
  * [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html) (for lists and dictionaries)
  * [DateTime](https://robotframework.org/robotframework/latest/libraries/DateTime.html)
  * [Dialogs](https://robotframework.org/robotframework/latest/libraries/Dialogs.html)
  * [Libdoc](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#libdoc)
  * [OperatingSystem](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
  * [Process](https://robotframework.org/robotframework/latest/libraries/Process.html)
  * [Rebot](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#post-processing-outputs)
  * [Remote](https://github.com/robotframework/RemoteInterface)
  * [Screenshot](https://robotframework.org/robotframework/latest/libraries/Screenshot.html)
  * [String](https://robotframework.org/robotframework/latest/libraries/String.html)
  * [Telnet](https://robotframework.org/robotframework/latest/libraries/Telnet.html)
  * [Testdoc](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#testdoc)
  * [Tidy](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tidy)
  * [XML](https://robotframework.org/robotframework/latest/libraries/XML.html)
  

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


## Script File Sections:

> Sections always begin with 3 asterisks.

> You must use 2 spaces between keywords and parameters.

> You must indent blocks with 4 spaces.

> Comments on the same line as keywords must have 2 spaces before the `#` character.

### Settings:

```robot
***Settings***

Documentation   Some information about the suite

# Import library
Library  <library_name>

# Path to keywords file(s)
Resource  <path/to/resource.robot>

# Run keyword prior to suite execution
Suite Setup  <before_suite_keyword>

# Run keyword after suite execution
Suite Teardown  <after_suite_keyword>

# Run keyword prior to all test's execution
Test Setup  <before_test_keyword>

# Run keyword after all test's execution
Test Teardown  <after_test_keyword>

# Wait before error thrown
Test Timeout  <global_timeout>
```
### Variables:

Variables expand the re-usability of scripts, not just for **Robot** framework. We can:

  * Declare scalars.
  * Declare lists.
  * Declare dictionaries.
  * Define global and local scope.
  * Pass variables into user-defined keywords (like function parameters).
  * Pass variables into scripts at runtime (from the command line).

There also exist a collection of *Built-in Variables* that are declared "under-the-hood".
  
  * [Operating System Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#operating-system-variables)
  * [Number Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#number-variables)
  * [Boolean and None/Null Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#boolean-and-none-null-variables)
  * [Space and Empty Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#space-and-empty-variables)
  * [Automatic Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#automatic-variables)

#### Scalars:

Scalar variables are meant to hold a single value. We can declare the existence of and initialize a scalar variable by using dollar-sign & curly bracket syntax: `${<variable_name>} =  <variable_value>`. The variable can then be referenced with the same left-hand-side syntax: `${<variable_name>}`. Inside of a **Robot** framework script, it should look something like the following.

> When declaring a new variable, you must have a single space on the LHS and two spaces on the RHS of the equals sign (`=`).

**Keywords**:
  * Set Variable

```robot
***Variables***

${URL} =  https://facebook.com
${BROWSER} =  edge
${SEARCH_TERM} =  Mark Zuckerberg

*** Test Cases ***
Search for user
    Open Browser  ${URL}  ${BROWSER}
    Input Text  id=<search-box-id>  ${SEARCH_TERM}
```

> **Robot** framework allows you to declare variables that include spaces, but this is not recommended as they can be easily confused with library keywords and user-defined keywords.

#### Lists:

> From the built-in [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html) library.

// TODO

Allows you to hold a series of values

  * `@{var_name} =  <val0>  <val1>  <valN>`
  * `@{var_name}[0]`
  * `@{var_name}[1:]`
  * `@{var_name}[:2]`

**Keywords**:
  * Evaluate
  * Log Many
  * Create List

> Must have 2 spaces in between each value in the list. The two spaces acts as a delimiter instead of commas or some other non-alpha character.

#### Dictionaries:

> From the built-in [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html) library.

Allows you to hold a series of named values (key-value pairs):

**Define:** Dictionaries are declared/defined using an ampersand (`&`) but are not accessed the same way.
```robot
*** Variables ***
&{<dict_name>}  <key1>=<val1>  <key2>=<val2>  <keyN>=<valN>
# other declared variables
```

**Access:** Dictionaries are accessed using the same syntax as scalar variables, using the dollar sign (`$`).
```robot
*** Test Cases ***
Access dictionary value
    [Tags]  dictionary
    Log  ${dict_name}.${key_name}
    # other stuff
```

// TODO

#### Scope:

// TODO

Global - upper case
Suite - upper case
Test Case - lower case
Keyword - lower case

Precedence:
Command Line > Script/suite > Keyword parameters

use uppercase for variables section global scope
user lowercase for internal test case scope

#### Passing Variables to Keywords:

// TODO

```robot
*** Test Cases ***
<Test case title>
    ${arg1} =  val1
    ${arg2} =  val2
    ${argN} =  valN
    <Custom Keyword Name>  ${arg1}  ${arg2}  ${argN}

*** Keywords ***
<Custom Keyword Name>
    [Arguments]  ${arg1}  ${arg2}  ${argN}
    Do Something  ${arg1}  ${arg2}
    Do Something Else  ${argN}
```

#### Passing Variables at Runtime:

// TODO

`python -m robot -v BROWSER:edge -v SEARCH_TERM:"Ferrari Enzo" -d Results/Main/ Tests/main.robot`

### Test Cases:

The following is a "normal" setup for a **Robot** test case:

```robot
*** Test Cases***
<Test case title>

    [Documentation]  Some information about the test case.
    [Tags]  Tag1  Tag2  ...  TagN
    [Timeout]  X
    
    # Pre-conditions (setup for test actions)
    # Test case steps (test actions)
    # Post-conditions (clean up after test actions)
```

You can also use test case template abstractions to avoid repetition, to convert keyword-driven design into a data-driven design.

```robot
***  Settings  ***
Test Template    <keyword_to_use>  # applies template to all test cases in this suite/file

*** Test Cases ***
    [Template]  <keyword_to_use>  # for individual test case template specification
    $[arg1]  $[arg2]  ...  $[argN]  # round 1 of optional parameter passing
    $[arg1]  $[arg2]  ...  $[argN]  # round 2 of optional parameter passing
    ...
    $[arg1]  $[arg2]  ...  $[argN]  # round N of optional parameter passing

*** Keywords ***
<keyword_to_use> 
    [Arguments]  $[arg1]  $[arg2]  ...  $[argN]  # can also be imported from a keyword/resource file
    #  code to execute
```

> Use the *group* `Test Template` option OR the *individual* `[Template]` option when declaring templated test cases; don't use both options in the same file, it's bad practice and can cause issues.



### Keywords:

You can "prototype" user-defined keyword definitions. This is similar to prototyping custom functions in general purpose programming languages. When the user-defined keyword(s) are in the same file, from which they are being called, they do not prefix a resource location in the results. If the user-defined keyword(s) are abstracted to an external file, and imported as a resource, they do prefix a resource location in the results.

```robot
***Keywords***

Custom Keyword Phrase
    [Arguments]  ${arg1}  ${arg2}  ${argN}
    Do Something
```

> Optional. Typically put keywords in associated `Resources` files.

Keywords can also return values, like functions/methods. All that is needed is a `[Return]` statement inside the keyword body. You can return scalar values, numeric values, lists, dictionaries, etc. To capture the return value, simply assign a variable to the keyword call.

```robot
*** Keywords ***
Sample keyword
    ${returned_value} =  Keyword that returns something
    Log  ${returned_value}


Keyword that returns something
    # Do some stuff
    [Return] <value>
```

#### Gherkin Syntax:

The use of Gherkin syntax for **Robot** framework is meant to improve the readability of test cases. It produces finer-grained results that may be easier to interpret in some cases. The keywords are based on phrase prefixes.

Gherkin user-defined keywords should attempt to mimic acceptance test cases for Agile stories. However, the phrasing of Gherkin syntax can be massively subjective. They can be written in many different ways, as opposed to the procedural (step-by-step) syntax.

##### Gherkin Prefixes:

```robot
*** Test Cases ***

<Test case title>
    [Documentation]  Some information about the test case.

    Given <A> # precondition
    And <B> # precondition (optional)
    When <C> # the test
    Then <D> # expected result
```

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

In alphabetical order:

  * `-c --critical <tags>` - Allows specification of which tag(s) will cause the test report to be red (in failed state) if tagged test(s) fail. By default, all tests are critical, unless otherwise specified.
  * `-d --outputdir <path/to/output/dir>` - Specify output directory for results.
  * `-i --include <tags>` - Include only a subset of tests to run based on custom tags.
  * `-L --loglevel <level>` - Allows you to specify a log level from the following list: TRACE, DEBUG, INFO (default), WARN, NONE (no logging). You can also use the `Set Log Level` keyword, locally, inside of a script to change the log level at any given point.
  * `-n --noncritical <tags>` - Allows specification of which tag(s) will not cause the test report to be red (in failed state) if tagged test(s) fail.
  * `-N --name <name>` - Set the name of the top level suite. By default the name is created based on the executed file or directory.
  * `-t --test <name>` - Specify the name of a unique test case that you want to run.
  * `-T --timestampoutputs` - Prevents result(s)/log(s) from overwriting each other. Preserve multiple results over time.
  * `-v --variable <VAR_NAME>:<values>` - Pass variables into **Robot** script from the command line.

  * `--randomize <all|suites|tests|none>` - Specify a test randomization strategy.
  * `--reporttitle <title> | --logtitile <title>` - Allows specific title on report/log file(s).


### Script Execution Order:
By default, test script files will normally be executed in alphabetic order. However, we can change the order of test script file execution by prefixing file names with `XX__`, where `XX` is a one or two digit integer, padded on the left with zeros. For example:

The following files:
```txt
Tests > 
    Some_Feature.robot
    Another_Feature.robot
```
will be executed in the order: `Another_Feature.robot --> Some_Feature.robot` by default. However, if we refactor the naming convention of the test script files as:
```txt
Tests >
    01__Some_Feature.robot
    02__Another_Feature.robot
```
then the files will be executed in the order: `01__Some_Feature.robot --> 02__Another_Feature.robot`.


Another way to change the execution order of your tests is to use the `--randomize <all|suites|tests|none>` option. This is a good way to find potential defects in your test(s).


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

## Script Control Flow:

### Run Keyword If/ELSE IF/ELSE:

```robot
*** Test Cases ***
Conditional Example 1
    [Tags]  control_flow
    Run Keyword If  ${<val1>} == <val2>  Keyword 1

Conditional Example 2
    [Tags]  control_flow
    Run Keyword If  ${<val1>} > <val2>  Keyword 1  ELSE Keyword 2

Conditional Example 3
    [Tags]  control_flow
    Run Keyword If  ${<val1>} <= <val2>  Keyword 1
    ...  ELSE IF  ${<val3>} < <val4>  Keyword 2
    ...  ELSE  Keyword 3  #  use an ellipsis and two spaces on next line to break up control flow

*** Keywords ***
Keyword 1
    # do something

Keyword 2
    # do different thing

Keyword 3
    # do another thing
```

### Loops:

**For RF v3.1+:**
```robot
FOR  ${<item>}  IN  item1  item2  item3
    Keyword  ${item}
    # more stuff
END
```


**For RF v2.x ~ v3.0:**
```robot
:FOR  ${<item>}  IN  item1  item2  item3
\    Keyword  ${item}
\    # more stuff
```

#### Loop Usage:

**`IN RANGE`:**
  * `FOR  ${i}  IN RANGE  <int>` - Loop `<int>` times with 0-based indexing
  * `FOR  ${i}  IN RANGE  <start>  <end>` - Loop with specific starting and ending integers.
  * `FOR  ${i}  IN RANGE  <start>  <end>  <step>` - Loop with starting and ending integers and an integer step size.
  * `FOR  ${item}  IN RANGE  @{items}` - Loop through a pre-defined, variable list of items.

**`Exit`/`Continue For Loop`:**
  * `Exit For Loop` - Will exit out of the `FOR` loop no matter the current iteration (same as `break` from other general purpose programming languages)
  * `Continue For Loop` - // TODO

**`Repeat Keyword`:**
  * `Repeat Keyword  <int>  <keyword>` - Repeat `<keyword>` an `<int>` number of times.
  * `Repeat Keyword  <int> times  <keyword>` - Repeat `<keyword>` an `<int>` number of times.
  * `Repeat Keyword  <int> x  <keyword>` - Repeat `<keyword>` an `<int>` number of times.
  * `Repeat Keyword  [hrs] h [mins] m <secs> s  <keyword>` - Repeat `<keyword>` as many times as possible with in the given amount of time.