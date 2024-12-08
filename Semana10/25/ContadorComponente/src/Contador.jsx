import React from 'react';

export default function Contador({ valorInicial = 0 }) {
    return <div>
        <button>+</button>
        <div className="contador">{valorInicial}</div>
        <button>-</button>
    </div>
}
