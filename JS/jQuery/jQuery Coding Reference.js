// jQuery Coding Reference.js

/*--------------------------------------------------------------------------------------------------------------*/
// METHODS

parent.appendChild(newItem) // put new item at end of a list
parent.insertBefore(newItem, target) // put new item before target

selection.html("<%= j action %>") // retrieves only the HTML inside the first element in the matched set along with any of its descendents from the jQuery selection
selection.text() // will return the text from the a jQuery selection
// the 'j' will escape JS and run any embedded ruby code

elem.before() // insert content before the selected element
elem.after() // insert content after the selected element

a.prepend(b) // insert content inside the selected element(s) after the opening tag ; adds b to a
a.prependTo(b) // adds a to b
a.append(b) // insert content inside the selected element(s) before the closing tag ; adds b to a
a.appendTo(b) // adds a to b

elem.attr("attrOne", "attrTwo") // will get (one) and optionally set or update (two) a specified attrubute and its value
elem.removeAttr("attr") // obvious
elem.addClass("klass") // obvious
elem.removeClass("klass") // obvious

elem.css("property", "value") // can get and/or set css property:value pairs on elements
elem.css("property1": "val1", "property2": "val2") // manipulate multiple css property:value pairs

selection.each() // applies the same code to each element in the selection

elem.show() // displays elem
elem.hide() // hides elem
elem.toggle() // toggles between showing and hiding elem
elem.fadeIn() // obvious
elem.fadeOut() // obvious
elem.fadeTo() // changes the opacity of elem
elem.fadeToggle() // hides or shows elem by changing the opacity (the opposite of thier current state)
elem.slideUp() // obvious
elem.slideDown() // obvious
elem.slideToggle() // obvious
elem.delay() // delays execution of subsequent items in queue
elem.stop() // stops animation if it is currently running
elem.animate({[, speed][, easing][, complete]}) // creates custom animations
// "speed" indicated the duration of the animation in milliseconds ; can also take keywords like 'fast' or 'slow'
// "easing" can take 2 values: 'linear' will make the transition uniform & 'swing' has a slow start, fast middle, and slow end
// "complete" is used to call a function that should run when the animation has finished ; callback function

selection.find() // all elements within current selection that match the selector
selection.closest() // nearest ancestor (not just parent) that matches the selector
selection.parent() // direct parent
selection.parents() // all parents
selection.children() // all children
selection.siblings() // all siblings
selection.next() // the next sibling
selection.nextAll() // all subsequent siblings
selection.prev() // the previous sibling
selection.prevAll() // all previous siblings

selection.add() // adds elements to a set of matched elements
selection.filter() // reduces number of matched elements to those specified by function
selection.is() // 
selection.each() // applies same function to each element in a matched set
selection.toArray() // converts a jQuery collection to and aray of DOM elements ; enables use of array methods
selection:contains() // 
selection.not() / :not() // removes elements from a set of matched elements
selection.has() / :has() // 
// based on the dot or colon selector method syntax, the following two selectors are equivalent:
$("li").not("hot").addClass("cool");
$("li:not(.hot)").addClass("cool");
// colon selector method syntax is faster than dot, but dot is cleaner and easier to read/understand

$("li").eq(index) // element that matches the index number
$("li:lt(index)") // elements with an index less than specified
$("li:gt(index)") // elements with an index greater than specified
// index is 0 based like array indexes

elem.remove() // removes any matched elements from the DOM tree including any descendants
elem.detach() // same as "remove" but keeps a copy of removed elements in memory
elem.empty() // removes child nodes and descendants from any elements in the matching set
elem.unwrap() // removes parents of matched set, leaving matched elements
elem.clone() // creates full copy of matched set including descendants

form.action() // the URL that the form is submitted to
form.method() // if to be sent via GET or POST
form.name() // rarely used, more often used is "id"
form.elements() // a collection of the elements that the form can interact with ; they can be accessed via index or thier name attribute
form.submit() // submits the form
form.reset() // resets the form to the initial values it had when the page first loaded
form.value // text if text input, value attribute otherwise
form.type // type of form element (text, password, radio, checkbox, etc)
form.name // gets or sets the name attribute of the form
form.defaultValue // the initial value when the page is loaded
form.form // the form that the control belongs to
form.disabled // disables the form element
form.checked // indicates which checkboxes or radio buttons have been checked ; returns boolean
form.defaultChecked // whether or not checkboxes or radio buttons were checked when the page loaded ; returns boolean
form.selected // indicates that and item from a select box has been selected ; returns boolean

selectBox.options // a collection of all the option elements
selectBox.selectedIndex // index number of the option that is currently thier "option"
selectBox.length // number of options
selectBox.multiple // allows to select multiple options
selectBox.selectedOptions // a collection of all the selected options
selectBox.add(option, before) // add "option" prior to index "before" ; will default to tail if no "before" is given
selectBox.remove(index) // removes option at "index"

element.isRequired() // checks whether the element has a required value
element.isEmpty() // checks whether the element has a value


/*--------------------------------------------------------------------------------------------------------------*/
// EVENTS
$("element").on("event")

// When an event "fires" on an element it "triggers" a script that takes an action.
// HTML Event Handlers ; DO NOT USE
// DOM Event Handlers ; OLDER BUT USEFUL
element.onblur() = checkUsername;
// DOM Event Listeners ; CURRENT AND PREFERRED
element.addEventListener("blur", checkUsername, false)
												(event, function_code, flow)
												// flow is false by default and uses element bubbling
												// if flow is true it uses element capturing instead ; not supported ≤ IE8

// UI
load
unload
error
resize
scroll

// Keyboard
keydown
keyup
keypress

// Mouse
click // also fires when the ENTER key is pressed and an element has focus
dblclick
mousedown
mouseup
mousemove
mouseover
mouseout
// screen > page > client is the relationship of display for any webpage and location of mouse pointer can be addressed by:
// screenX & screenY
// pageX & pageY
// clientX & clientY

// Focus
focus / focusin
blur / focusout

// Form
input
change
submit
reset
cut
copy
paste
select

// Mutation
DOMSubtreeModified
DOMNodeInserted
DOMNodeRemoved
DOMNodeInsertedIntoDocument
DOMNodeRemovedFromDocument

// Properties
target // target of the event (most specific element interacted with)
type // type of event that was fired
cancelable // whether or not you can cancel the default behavior of an event

// Methods
preventDefault() // canel the default behavior of an event (if cancelable)
stopPropagation() // stops the event from bubbling or capturing any further

$("li").on("click" events[, selector][, data], function(e) { // the event object
	eventType = e.type; // type of event (click, mouseover, etc.)
	eventData = e.data; // object literal containing extra information passed to the function when the event fires
	eventTarget = e.target; // DOM element that initiated the event
	eventX = e.pageX; // mouse position from left edge of viewport
	eventY = e.pageY; // mouse position from top edge of viewport
	eventTimeStamp = e.timeStamp; // number of milliseconds from Jan 1st, 1970, to when the event was fired (Unix Time)
	eventActioner = e.which; // which button or key that was pressed to fire the event
	e.preventDefault(); // see function definition in this file
	e.stopPropagation(); // see function definition in this file
});
// "selector" lets you respond to a subset of the elements in the initial jQuery selection that will filter its descendants
// "data" lets you pass extra info to the function that is called when the event is fired ; the info is passed along with 'e'


/*--------------------------------------------------------------------------------------------------------------*/
// FUNCTIONS


$("li").each(function() {
	var ids = this.id;
	$(this).append("<em class='order'>" + ids + '</em>');
});


/*--------------------------------------------------------------------------------------------------------------*/
// AJAX, JSON, AND XML

// browsers only let AJAX load HTML and XML if the data is from the same domain
// JSON is unforgiving ; missing any punctuation will break the file
// JSON is JS and can contain malicious content ; dont trust external JSON files

var xhr = new XMLHttpRequest(); // new instance of an 'X'ML'H'ttps'R'equest
xhr.open("GET", "data/test.json", true) // specify the type of request, the data, and the asynchronous status
xhr.send("search=arduino") // sends the instance to the server ; default argument is NULL, but extra info can be sent optionally
xhr.onload() // when the browser has received and loaded a response from the server
xhr.status() // returns the status code of the request (200, 201, 401, 500, 304, etc...)
xhr.load() // loads HTML fragments into an element ; simplest method for retrieving data

$.get(url[, data][, callback][, type]) // loads data using the HTTP GET method, used to request data from the server
$.post(url[, data][, callback][, type]) // loads data using the HTTP POST method, used to send data to the server
$.getJSON(url[, data][, callback]) // loads JSON data using a HTTP GET request
$.getScript(url[, callback]) // loads and executes JS data using a HTTP GET request
// these are methods of a global jQuery object which is why they start with '$' ; they only request data from the server
// they do not automatically use that data to update the elements of a matched set, which is why the '$' is not followed by a selector
// "url" specifies where the data is fetched from
// "data" provides any additional information to send to the server
// "callback" indicated that the function should be called when data is returned (can be named or anonymous)
// "type" shows the return type of data to expect from the server

$.ajax(type: "GET", url: "https:// www.example.com", timeout: 2000, beforeSend: function(){}, success: function(){}, error: function(){}, complete: function(){})
// the methods above use "$.ajax" under the hood ; used to perform all requests
// "timeout" is the number of milliseconds to wait before the event should fail
// "beforeSend" is a function that executes before the AJAX request starts
// "success" is basically the same as the .done() method (mentioned below)
// "error" is basically the same as the .fail() method (mentioned below)
// "complete" runs after "success" or "error" events ; similar to .always()??? (mentioned below)

jqXHR.responseText // the text data
jqXHR.responseXML // the XML data
jqXHR.status // status code
jqXHR.statusText // status description ; typically about an error
jqXHR.done() // code runs if the request was successful
jqXHR.fail() // code runs if the request fails/was unsuccessful
jqXHR.always() // code to run always no matter whether the code was successful or unsuccessful
jqXHR.abort() // halt the HTTP communication
// when using the .load() method the HTML returned from the server is inserted into a jQuery selection
// you can specify what should be done with the data that is returned using the jqXHR object


/*--------------------------------------------------------------------------------------------------------------*/
// APIs

// history API works like a stack, new pages that are visited are pushed to the top of the stack
// navigating backwards moves you down the stack
// navigating forwards moves you up the stack

history.back() // obvious
history.forward() // obvious
history.go(+ - integer) // takes you to a place in the histories index originating at 0
history.pushState(state, "title", url) // pushes an item to the history stack
history.replaceState(state, "title", url) // edits the current history item
history.lenth // how many items are in the stack

// AngularJS is a MVC development approach for JS


/*--------------------------------------------------------------------------------------------------------------*/
// MISC

var $jq = jQuery.noConflict();
var $mt = MooTools.noConflict();
var $y = YUI.noConflict();
// you can specify a custom alias to avoid shorthand conflicts with certain JS libraries
