import React from 'react'
import { createRoot } from 'react-dom/client'
import ListaContadores from './ListaContadores.jsx';
import { Provider } from 'react-redux'
import store from './estado.js'

const root = createRoot(document.getElementById('app'))
root.render(
    <Provider store={store}>
        <ListaContadores valoresIniciales={[1, 5, 9, 7]}/>
    </Provider>);