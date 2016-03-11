Button = require('./components/Button.cjsx')
React = require('react')
ReactDOM = require('react-dom')

$(document).ready ->
  ReactDOM.render(<Button />, document.getElementById('container'))
