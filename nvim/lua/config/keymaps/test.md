# Test Strings for Neovim Keymaps

## Basic Delimiter Tests
This section tests functionality with different delimiters in various positions.

# Backtick tests - map("n", "`", "vi`A"), map("n", "~", "$F`i"), etc.
Test `word` in backticks
Function call: some_function(`parameter`)
Backtick at line end: `

# Single quote tests - map("n", "'", "vi'A"), map("n", "''", "$F'i"), etc.
Test 'word' in single quotes
String: 'This is a string'
Single quote at line end: '

# Double quote tests - map("n", '"', 'vi"A'), map("n", '""', '$F"i'), etc.
Test "word" in double quotes
String: "This is also a string"
Double quote at line end: "

# Parentheses tests - map("n", "(", "vi(A"), map("n", "()", "$F)i"), etc.
Test (word) in parentheses
Function call: some_function(parameter)
Parentheses at line end: (

# Square bracket tests - map("n", "[", "vi[A"), map("n", "[]", "$F]i"), etc.
Test [word] in square brackets
Array access: array[index]
Square bracket at line end: [

# Curly brace tests - map("n", "{", "vi{A"), map("n", "{}", "$F}i"), etc.
Test {word} in curly braces
Code block: function() { return; }
Curly brace at line end: {

# Angle bracket tests - map("n", "<", "vi<A"), map("n", "<>", "$F>i"), etc.
Test <word> in angle brackets
HTML tag: <div>content</div>
Angle bracket at line end: <

## Complex Nested Tests
This section tests functionality with nested delimiters.

Nested backticks: ``nested `inner` text``
Nested quotes: "'nested 'inner' text'"
Nested brackets: ([{nested [inner] text}])
Nested HTML: <div><span>nested</span></div>

## End-of-Line Tests
This section specifically tests behavior when delimiters are at the end of a line.

Backticks EOL: test`
Single quotes EOL: test'
Double quotes EOL: test"
Parentheses EOL: test(
Square brackets EOL: test[
Curly braces EOL: test{
Angle brackets EOL: test<

## Tag-Specific Tests
This section tests HTML/XML tag operations.

Simple tag: <div>content</div>
Self-closing tag: <img src="image.jpg" />
Nested tags: <outer><inner>content</inner></outer>
Tag with attributes: <a href="https://example.com">link</a>

## Word and Function Tests
This section tests word and function selection operations.

Simple words: apple banana cherry
CamelCase: camelCaseWord
snake_case: snake_case_word
Function definition: function testFunction() {
    return "something";
}

## Mixed Content Tests
This section tests operations on mixed content.

Mixed quotes: "outer 'inner' quote"
Mixed brackets: {outer [inner] brace}
Code like: if (condition) { doSomething(); }
String in function: function() { return "string"; }

## Multi-Line Tests
This section tests operations across multiple lines.

Multi-line string:
"This is a
multi-line string"

Multi-line function:
function() {
    doSomething();
    return value;
}

Multi-line HTML:
<div>
    <span>Content</span>
</div>

## Edge Cases
This section tests edge cases and potentially problematic scenarios.

Empty delimiters: "" '' `` () [] {} <>
Unclosed delimiters: "unclosed
Escaped delimiters: "escaped \"quote\"" or 'escaped \'quote\''
Multiple on same line: "one" 'two' `three` (four) [five] {six} <seven>
Delimiter at the very start of a file: `at start
