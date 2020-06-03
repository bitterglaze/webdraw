import React from 'react'
import ReactDOM from 'react-dom'
import CanvasContainer from '../containers/CanvasContainer'
import { ActionCableProvider } from 'react-actioncable-provider'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ActionCableProvider url="ws://localhost:3000/cable">
      <CanvasContainer />,
    </ActionCableProvider>,
    document.body.appendChild(document.createElement('div'))
  )
})
