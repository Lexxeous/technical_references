<!-- Robot Management.md -->

# <img src="../../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Robot Management: <img src="../../.pics/Python/Robot/robot_logo.jpg" width="90px"/>

## Summary:

**Robot** is a free, open-source test automation framework for Python. Developed in Finland by Pekka Klarck for his Master's Thesis in 2005. Version 1.0 was created at Nokia Siemens Networks. In 2008, Version 2.0 was released as open-source software.

**Robot** is cross platform and can be run on Windows, Mac, and Linux based operating systems. It is a keyword-driven software with data-driven capabilities.

## Installation:

1. Install Python and `pip`.
2. Use `pip` to install the **Robot** framework.
3. Use `pip` to install the **Selenium** library.
4. Install desired browser appications (Internet Explore, Google Chrome, Firefox, Safari, etc).
5. Install **Selenium** web-drivers for each browser.
6. Install the Pycharm IDE and Intellibot plugin (optional).

> It is not guarunteed that the 64-bit web-driver versions will work, so the 32-bit versions are recommended for now.

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
  * **Reusable Entities/Objects** - Removes unecessary redundancy.
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

  * Selenium (testing framework for web apps)
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

[Documentation] Some information about the test.
[Tags] Tag1 Tag2 ... TagN
[Timeout] X
```

#### Keywords:

```robot
***Keywords***

# TODO
```

> Optional. Typically put keywords in associated `Resources` files.