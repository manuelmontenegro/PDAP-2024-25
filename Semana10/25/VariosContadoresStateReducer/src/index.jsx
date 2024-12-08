import React from 'react'
import { createRoot } from 'react-dom/client'
import ListaContadores from './ListaContadores.jsx';


const root = createRoot(document.getElementById('app'))
root.render(<ListaContadores valoresIniciales={[1, 5, 9, 7]}/>);