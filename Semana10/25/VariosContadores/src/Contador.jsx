import React from 'react';

export default function Contador({ valor, onIncrementar = () => {}, onDecrementar = () => {}}) {
    return <div>
        <button onClick={() => onIncrementar()}>+</button>
        <div className="contador">{valor}</div>
        <button disabled={valor === 0} onClick={() => onDecrementar()}>-</button>
    </div>
}
