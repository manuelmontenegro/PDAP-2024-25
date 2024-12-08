import React, { useState } from 'react';

export default function Contador({ valorInicial }) {
    const [valor, setValor] = useState(valorInicial);

    function incrementar() {
        setValor(valor + 1);
    }

    function decrementar() {
        setValor(valor - 1);
    }

    return <div>
        <button onClick={incrementar}>+</button>
        <div className="contador">{valor}</div>
        <button disabled={valor === 0} onClick={decrementar}>-</button>
    </div>
}
