<!-- XML Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's XML Management: <img src="../.pics/XML/xml_logo.png" height="80"/>

## Summary:


## XPath Locators:

XPath locators are a similar/generalized version of CSS selectors that also allow for the selection and traversal of HTML, as well as, XML documents.

XPath locators follow a relatively simple format to begin: `//<html_tag>[@<attribute_name>='<value>']`.

> The `//` indicates a relative XPath.
 
You can access parent and child relationships by using absolute and/or relative pathing.

Absolute `/<elem>` pathing by specifying each element to walk down in the HTML element tree.
Relative `//<elem>` pathing by specifying only the ending HTML element descendant that you want.

You can also access specific child elements by using indexing `[x]` where x is the 1-based index of the location of the child element.

### Dynamic Attributes:

#### Partial Locators:

  * Starts With: `starts-with` - `<html_tag>[starts-with(@<attr>,'<val>')]`
  * Ends With: `ends-with` - `<html_tag>[ends-with(@<attr>,'<val>')]` ; (only works with XPath v2.0+)
  * Contains: `contains` - `<html_tag>[contains(@<attr>,'<val>')]`
  * Contains: `contains` - `<html_tag>[contains(text(),'<val>')]` ; (if there are no attributes to locate, will only look for parent for text)
  * Contains: `contains` - `<html_tag>[contains(.,'<val>')]` ; (if there are no attributes to locate, will search parent and child elements for text)



> For more information, check out [LambdaTest's XPath locator cheat sheet](https://www.lambdatest.com/blog/most-exhaustive-xpath-locators-cheat-sheet/) and this [online XPath tester](http://xpather.com/).