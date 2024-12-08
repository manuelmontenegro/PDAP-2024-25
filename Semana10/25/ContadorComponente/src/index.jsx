import React from 'react'
import Contador from './Contador.jsx'
import { createRoot } from 'react-dom/client'

const root = createRoot(document.getElementById('app'))
root.render(<Contador valorInicial={3}/>);