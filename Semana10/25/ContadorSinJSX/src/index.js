import React from 'react'
import {
    createRoot
} from 'react-dom/client'

const valorContador = 3;

function view(model) {
    return React.createElement('div', null,
        React.createElement('button', null, '+'),
        React.createElement('div', {
            className: 'contador'
        }, model.toString()),
        React.createElement('button', null, '-')
    );
}


const contadorDOM = view(valorContador)

    const root = createRoot(document.getElementById('app'))
root.render(contadorDOM);