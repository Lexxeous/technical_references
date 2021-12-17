<!-- CSS Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's CSS Management: <img src="../.pics/CSS/css_logo.png" width="80"/>

## Summary:


## CSS Locators:

CSS locators allow the selection of specific element in an HTML page, based on the location of HTML elements and/or the attributes that the elements contain.

CSS locators follow a relatively simple format to begin: `<html_tag>[<attr>='<val>']`.

You can access parent and child relationships by using absolute and/or relative pathing.

Absolute `><elem>`
Relative ` <elem>`

You can also access specific child elements by using indexing `[x]` where x is the 1-based index of the location of the child element.

### Dynamic Attributes:

#### Partial Locators:

  * Starts With: `^` - `<html_tag>[<attr>^='<val>']`
  * Ends With: `$` - `<html_tag>[<attr>$='<val>']`
  * Contains: `*` - `<html_tag>[<attr>*='<val>']`

> For more information about CSS locators, check out the [W3Schools documentation](https://www.w3schools.com/cssref/css_selectors.asp) and their [CSS selector tester](https://www.w3schools.com/cssref/trysel.asp).