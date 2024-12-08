import React from 'react';

export default function Contador({ valor, indice, ejecutarAccion = () => {}}) {
    return <div>
        <button onClick={() => ejecutarAccion({ type: "contador/incrementar", payload: indice })}>+</button>
        <div className="contador">{valor}</div>
        <button disabled={valor === 0} onClick={() => ejecutarAccion({ type: "contador/decrementar", payload: indice })}>-</button>
    </div>
}
