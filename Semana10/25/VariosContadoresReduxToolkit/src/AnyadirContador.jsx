import React, { useState } from 'react';
import { anyadir } from './estado';
import { useDispatch } from 'react-redux';

export default function AnyadirContador() {
    const [texto, setTexto] = useState('');
    const dispatch = useDispatch();
    
    const valido = texto.match(/^\d+$/);

    return <div>
        <input type="text" value={texto} onInput={evt => setTexto(evt.target.value)} size="3"/>
        <button onClick={() => dispatch(anyadir(parseInt(texto)))} disabled={!valido}>Añadir contador</button>
    </div>
}