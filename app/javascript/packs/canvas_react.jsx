import React from 'react'
import ReactDOM from 'react-dom'
import CanvasContainer from '../containers/CanvasContainer'
import { ActionCableProvider } from 'react-actioncable-provider'

document.addEventListener('DOMContentLoaded', () => {
  const id = document.getElementById('CanvasProps').dataset.id
  ReactDOM.render(
    <ActionCableProvider url="ws://localhost:3000/cable">
      <CanvasContainer id={id} />
    </ActionCableProvider>,
    document.body.appendChild(document.createElement('div'))
  )
})
