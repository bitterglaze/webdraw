import React, { Component } from 'react'
import { ActionCable } from 'react-actioncable-provider'

export default class CanvasContainer extends Component {
  constructor(props) {
    super(props)

    this.state = {
      painting: false,
      canvases: {},
      points: []
    }

    this.renderCanvas = this.renderCanvas.bind(this)
    // this.randBack = this.randBack.bind(this)
    this.handleMouseMove = this.handleMouseMove.bind(this)
    this.handleMouseDown = this.handleMouseDown.bind(this)
    this.handleMouseUp = this.handleMouseUp.bind(this)
    this.saveCanvas = this.saveCanvas.bind(this)

    this.preloadCanvas = this.preloadCanvas.bind(this)
  }

  componentDidMount() {
    this.renderCanvas()
    this.preloadCanvas()

    // const setBg = () => {
    //   const randomColor = Math.floor(Math.random() * 16777215).toString(16)
    //   document.body.style.backgroundColor = '#' + randomColor
    //   color.innerHTML = '#' + randomColor
    //
    //   genNew.addEventListener('click', setBg)
    //   setBg()
    // }
  }

  preloadCanvas() {
    fetch('http://localhost:3000/api/drawroom/index.json')
      .then((response) => {
        return response.json()
      })
      .then((data) => {
        console.log(data)
      })
  }

  // componentDidUpdate() {}

  handleMouseDown(e) {
    this.setState({
      painting: true
    })
    // console.log(true)
  }

  handleMouseUp(e) {
    // let { ctx } = this.handleMouseMove
    const ctx = canvas.getContext('2d')
    ctx.beginPath()

    this.setState({
      painting: false
    })
    // console.log(false)
  }

  handleMouseMove(e, color) {
    const ctx = canvas.getContext('2d')

    if (this.state.painting) {
      console.log(e.clientX, e.clientY)
      ctx.lineWidth = 4 * 2

      ctx.lineTo(e.clientX, e.clientY)
      ctx.stroke()

      ctx.beginPath()
      ctx.arc(e.clientX, e.clientY, 4, 0, Math.PI * 2)

      let { points } = this.state
      points.push([e.clientX, e.clientY])
      this.setState({
        points
      })

      ctx.fill()

      ctx.beginPath()
      ctx.moveTo(e.clientX, e.clientY)
    }
  }

  renderCanvas() {
    // const { colors } = this.state
    const canvas = document.getElementById('canvas')

    canvas.width = window.innerWidth
    canvas.height = window.innerHeight

    canvas.addEventListener('mousedown', this.handleMouseDown)
    canvas.addEventListener('mouseup', this.handleMouseUp)
    canvas.addEventListener('mousemove', this.handleMouseMove)

    // this.setState({
    //   renderCanvas: this.renderCanvas
    // })
    const id = this.generateUUID
    let { canvases } = this.state
    canvases[id] = canvas

    this.setState({
      canvases
    })
  }

  generateUUID() {
    let array = new Uint32Array(8)
    window.crypto.getRandomValues(array)
    let str = ''
    for (let i = 0; i < array.length; i++) {
      str += (i < 2 || i > 5 ? '' : '-') + array[i].toString(16).slice(-4)
    }
    return str
  }

  saveCanvas() {
    const { points } = this.state

    fetch('http://localhost:3000/api/drawroom/sync', {
      method: 'POST', // or 'PUT'
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ points: points })
    })
      // .then((response) => response.json())
      .then((data) => {
        console.log('Success:', data)
      })
      .catch((error) => {
        console.error('Error:', error)
      })
  }

  handleReceivedCanvas(data) {
    console.log('cableisworking', data)
  }

  render() {
    // console.log(this.state.canvases[0])

    return (
      <div className="cover">
        <ActionCable
          channel={{ channel: 'CanvasChannel' }}
          onReceived={this.handleReceivedCanvas}
        />
        <canvas id="canvas"></canvas>
        <button className="saveButn" onClick={this.saveCanvas}>
          Сохранить
        </button>
      </div>
    )
  }
}
