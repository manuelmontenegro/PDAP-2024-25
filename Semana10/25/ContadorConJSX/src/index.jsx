import React from 'react'
import { createRoot } from 'react-dom/client'


function view(model) {
    return <div>
        <button>+</button>
        <div className="contador">{model}</div>
        <button>-</button>
    </div>
}

const valorContador = 3;
const contadorDOM = view(valorContador);

const root = createRoot(document.getElementById('app'))
root.render(contadorDOM);
