<!-- Test Management.md -->

# Test Management:

## Summary:

The `Tests` directory is where your test script(s) (`.robot` files) are stored.

## Using Locators in Test Cases:

In most cases, using an HTML `id`, HTML `name`, Link Text, or Partial Link Text locator are the easiest to use, but the latter 3 are also the most brittle. This means that they will work the least often between different web browsers, and between website updates. For more specificity, especially for enterprise environments, using HTML `id`, XPath, and CSS locators are your best options.

For more information about XPath locators, visit <a href="https://github.com/Lexxeous/technical_references/blob/master/XML/XML%20Management.md" target="_blank">`XML Management.md`</a>\
For more information about CSS locators, visit <a href="https://github.com/Lexxeous/technical_references/blob/master/CSS/CSS%20Management.md" target="_blank">`CSS Management.md`</a>

### Locator Strategies:

  * HTML `id` - `Click <elem>  id=<id>`
  * HTML `name` - `Click <elem>  name=<name>`
  * Link Text -`Click <elem>  <text>`
  * Partial Link Text - `Click <elem>  partial link=<partial_text>`
  * XPath - `Click <elem>  xpath=<xpath_locator>`
  * CSS - `Click <elem>  css<css_locator>`

  where `<elem>` is something like `Link`, `Image`, etc...

> For misc locator strategies, where the locator includes a `=` character, prepend the locator with the `default` strategy, ex: `Click Link  default=<webpage_link>?a=b`