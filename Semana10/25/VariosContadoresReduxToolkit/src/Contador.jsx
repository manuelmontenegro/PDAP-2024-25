import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { incrementar, decrementar } from './estado.js';

export default function Contador({ indice }) {
    const valor = useSelector(state => state[indice]);
    const dispatch = useDispatch();

    return <div>
        <button onClick={() => dispatch(incrementar(indice))}>+</button>
        <div className="contador">{valor}</div>
        <button disabled={valor === 0} onClick={() => dispatch(decrementar(indice))}>-</button>
    </div>
}
