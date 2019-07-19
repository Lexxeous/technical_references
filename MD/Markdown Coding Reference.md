<!-- Markdown Coding Reference -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's MD Coding Reference: <img src="../.pics/Markdown/md_logo.png" width="130px"/>

Certification(s) w/ an external link:
[![Build Status](https://travis-ci.org/divmain/GitSavvy.svg?branch=master)](https://travis-ci.org/divmain/GitSavvy)
[![Coverage Status](https://coveralls.io/repos/github/divmain/GitSavvy/badge.svg)](https://coveralls.io/github/divmain/GitSavvy)
[![Codacy Badge](https://api.codacy.com/project/badge/3c214fa790b249f79f5275dbfa6499ca)](https://www.codacy.com/app/dale/GitSavvy)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/divmain/GitSavvy?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Cercification(s) w/o an external link:
![License](https://camo.githubusercontent.com/890acbdcb87868b382af9a4b1fac507b9659d9bf/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d626c75652e737667)

# This is the largest title heading (h1).
## This is a smaller title heading (h2).
### This is a smaller-er title heading (h3).
#### This is a smaller-er-er title heading (h4).
##### This is a smaller-er-er-er title heading (h5).
###### This is a smaller-er-er-er-er title heading (h6) ; The h6 is also grey.

This is what normal text looks like.

**This is what bold text looks like.**

*This is what italicized text looks like.*

> This is how to make a block comment or prospective user question.

This is how to make a [link](http://www.ascii-middle-finger.com/) to a specific web page.

 - [ ] This is how to make a checkbox.

Make numbered lists like this (must have an empty line in between description and list):

1.  I am a list item.
2.	I am a list item.
3.	I am a list item.
4.	I am a list item.
5.	I am a list item.
6.	I am a list item.
7.	I am a list item.
8.	I am a list item.
9.	I am a list item.
10.	I am a list item.
11.	I am a list item.
12.	I am a list item.
13.	I am a list item.

Make un-numbered (bulleted) lists like this (must have an empty line in between):

  * I am a list item.
    - I am a sub-list item.
  * I am a list item.
    - I am a sub-list item.
    - I am a sub-list item.
  * I am a list item.
    - I am a sub-list item.
    - I am a sub-list item.
    - I am a sub-list item.

This is how to make a table:

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

This is how to display in-line code:
`for (i = 0, i < 10, i++)`

This is how to display blocks of code with a specific style types
(Ruby, Bash, CSS, HTML, JS, etc...):

Ruby:
```ruby
gem "n2_styles", git: "git@github.com:n2publishing/n2-styles"
```

Bash:
```bash
$ bundle
```

Shell:
```sh
git clone git@github.com:n2publishing/n2pub.com.git
cd n2pub.com
bin/setup
```

HTML:
```html
<a>Link to this place.</a>
```

CSS:
```css
/*
 *= require n2_styles/all
 */
```

JS:
```java
//= require n2_styles
$("#new-note-modal form")[0].reset();
```

JSON:
```json
"dependencies": {
  "n2-styles": "github:n2publishing/n2-styles",
}
```

VHDL:
```vhdl
entity entity_name is
  port( signal_name : signal_mode signal_type;
        signal_name : signal_mode signal_type);
end entity entity_name


architecture arch_name of entity_name is
  signal node1 STD_LOGIC;
end architecture arch_name;
```


Here's a full list of supported languages:

* abap (`*.abap`)
* ada (`*.adb`, `*.ads`, `*.ada`)
* ahk (`*.ahk`, `*.ahkl`)
* apacheconf (`.htaccess`, `apache.conf`, `apache2.conf`)
* applescript (`*.applescript`)
* as (`*.as`)
* as3 (`*.as`)
* asy (`*.asy`)
* bash (`*.sh`, `*.ksh`, `*.bash`, `*.ebuild`, `*.eclass`)
* bat (`*.bat`, `*.cmd`)
* befunge (`*.befunge`)
* blitzmax (`*.bmx`)
* boo (`*.boo`)
* brainfuck (`*.bf`, `*.b`)
* c (`*.c`, `*.h`)
* cfm (`*.cfm`, `*.cfml`, `*.cfc`)
* cheetah (`*.tmpl`, `*.spt`)
* cl (`*.cl`, `*.lisp`, `*.el`)
* clojure (`*.clj`, `*.cljs`)
* cmake (`*.cmake`, `CMakeLists.txt`)
* coffeescript (`*.coffee`)
* console (`*.sh-session`)
* control (`control`)
* cpp (`*.cpp`, `*.hpp`, `*.c++`, `*.h++`, `*.cc`, `*.hh`, `*.cxx`, `*.hxx`, `*.pde`)
* csharp (`*.cs`)
* css (`*.css`)
* Cucumber (`*.feature`)
* cython (`*.pyx`, `*.pxd`, `*.pxi`)
* d (`*.d`, `*.di`)
* delphi (`*.pas`)
* diff (`*.diff`, `*.patch`)
* dpatch (`*.dpatch`, `*.darcspatch`)
* duel (`*.duel`, `*.jbst`)
* dylan (`*.dylan`, `*.dyl`)
* erb (`*.erb`)
* erl (`*.erl-sh`)
* erlang (`*.erl`, `*.hrl`)
* evoque (`*.evoque`)
* factor (`*.factor`)
* felix (`*.flx`, `*.flxh`)
* fortran (`*.f`, `*.f90`)
* gas (`*.s`, `*.S`)
* genshi (`*.kid`)
* glsl (`*.vert`, `*.frag`, `*.geo`)
* gnuplot (`*.plot`, `*.plt`)
* go (`*.go`)
* groff (`*.(1234567)`, `*.man`)
* haml (`*.haml`)
* haskell (`*.hs`)
* html (`*.html`, `*.htm`, `*.xhtml`, `*.xslt`)
* hx (`*.hx`)
* hybris (`*.hy`, `*.hyb`)
* ini (`*.ini`, `*.cfg`)
* io (`*.io`)
* ioke (`*.ik`)
* irc (`*.weechatlog`)
* jade (`*.jade`)
* java (`*.java`)
* js (`*.js`)
* jsp (`*.jsp`)
* lhs (`*.lhs`)
* llvm (`*.ll`)
* logtalk (`*.lgt`)
* lua (`*.lua`, `*.wlua`)
* make (`*.mak`, `Makefile`, `makefile`, `Makefile.*`, `GNUmakefile`)
* mako (`*.mao`)
* maql (`*.maql`)
* mason (`*.mhtml`, `*.mc`, `*.mi`, `autohandler`, `dhandler`)
* markdown (`*.md`)
* modelica (`*.mo`)
* modula2 (`*.def`, `*.mod`)
* moocode (`*.moo`)
* mupad (`*.mu`)
* mxml (`*.mxml`)
* myghty (`*.myt`, `autodelegate`)
* nasm (`*.asm`, `*.ASM`)
* newspeak (`*.ns2`)
* objdump (`*.objdump`)
* objectivec (`*.m`)
* objectivej (`*.j`)
* ocaml (`*.ml`, `*.mli`, `*.mll`, `*.mly`)
* ooc (`*.ooc`)
* perl (`*.pl`, `*.pm`)
* php (`*.php`, `*.php(345)`)
* postscript (`*.ps`, `*.eps`)
* pot (`*.pot`, `*.po`)
* pov (`*.pov`, `*.inc`)
* prolog (`*.prolog`, `*.pro`, `*.pl`)
* properties (`*.properties`)
* protobuf (`*.proto`)
* py3tb (`*.py3tb`)
* pytb (`*.pytb`)
* python (`*.py`, `*.pyw`, `*.sc`, `SConstruct`, `SConscript`, `*.tac`)
* rb (`*.rb`, `*.rbw`, `Rakefile`, `*.rake`, `*.gemspec`, `*.rbx`, `*.duby`)
* rconsole (`*.Rout`)
* rebol (`*.r`, `*.r3`)
* redcode (`*.cw`)
* rhtml (`*.rhtml`)
* rst (`*.rst`, `*.rest`)
* sass (`*.sass`)
* scala (`*.scala`)
* scaml (`*.scaml`)
* scheme (`*.scm`)
* scss (`*.scss`)
* smalltalk (`*.st`)
* smarty (`*.tpl`)
* sourceslist (`sources.list`)
* splus (`*.S`, `*.R`)
* sql (`*.sql`)
* sqlite3 (`*.sqlite3-console`)
* squidconf (`squid.conf`)
* ssp (`*.ssp`)
* tcl (`*.tcl`)
* tcsh (`*.tcsh`, `*.csh`)
* tex (`*.tex`, `*.aux`, `*.toc`)
* text (`*.txt`)
* v (`*.v`, `*.sv`)
* vala (`*.vala`, `*.vapi`)
* vbnet (`*.vb`, `*.bas`)
* velocity (`*.vm`, `*.fhtml`)
* vhdl (`*.vhd`)
* vim (`*.vim`, `.vimrc`)
* xml (`*.xml`, `*.xsl`, `*.rss`, `*.xslt`, `*.xsd`, `*.wsdl`)
* xquery (`*.xqy`, `*.xquery`)
* xslt (`*.xsl`, `*.xslt`)
* yaml (`*.yaml`, `*.yml`)

<br>

Use two spaces `"  "` at the end of a line or the HTML line break element `<br>` to initialize a line break.
> Typically it's better to use `<br>` since it's actually visable and some text editors/interpreters rid trailing white space.

<br>

### Indent with Markdown

Markdown does not have indenting properties by default but there is a fairly simple way (using non-breaking space HTML entities `&nbsp;`) to indent sub-sections of Markdown so that they are in line vertically. If you use a double comment operator `>>`, comment lines will be pushed out even farther than normal. To match this indention, use 7 `&nbsp;` characters on paragraphs. For code blocks, indent every line of the code block out by 3 spaces (not `&nbsp;` characters). For HTML headers `<Hn>`(anchor tags/titles), use `n+2` `&nbsp;` characters after the `#` characters. For example:

### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H3 Anchor using 5 `&nbsp;` Characters
###### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H6 Anchor using 8 `&nbsp;` Characters
>> Double comment indent.

```
   Triple
   Space
   Indent
```

### Markdown Whitespace

```sh
Hello  # has 2 spaces here
World

Hello<br> #has HTML line break element here
World

Hello # no spaces here
World
```

Emojis can be inserted into markdown using a colon on each side of the descriptor like: `:descriptor:`. <br>
:bowtie: `:bowtie:` <br>
:trollface: `:trollface:` <br>
:octocat: `:octocat:` <br>
:dog2: `:dog2:` <br>
A full list of the markdown emoji descriptors can be found here: [https://github.com/ikatyang/emoji-cheat-sheet](https://github.com/ikatyang/emoji-cheat-sheet).

For additional information about Markdown, please visit the `Markdown Cheatsheet` here: [https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

