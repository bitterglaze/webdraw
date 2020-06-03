// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Hello = (props) => <div>Hello {props.name}!</div>

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

fetch('http://localhost:3000/api/drawroom/index.json')
  .then((response) => {
    return response.json()
  })
  .then((data) => {
    console.log(data)
  })

document.addEventListener('DOMContentLoaded', () => {
  let props = document.getElementsByTagName('div')[0].dataset.props
  let testContent = JSON.parse(props).test
  // console.log(JSON.parse(props).test)

  ReactDOM.render(
    <Hello name={testContent} />,
    document.body.appendChild(document.createElement('div'))
  )
})

// var canvas = document.getElementById('paper'),
//   ctx = canvas.getContext('2d')
//
// canvas.addEventListener('mousemove', function (e) {
//   ctx.beginPath()
//   ctx.arc(e.clientX, e.clientY, 10, 0, Math.PI * 2)
//   ctx.fill()
// })
