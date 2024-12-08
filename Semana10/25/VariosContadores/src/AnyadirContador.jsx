import React, { useState } from 'react';


export default function AnyadirContador({ onAnyadir = () => {} }) {
    const [texto, setTexto] = useState('');
    
    const valido = texto.match(/^\d+$/);

    return <div>
        <input type="text" value={texto} onInput={evt => setTexto(evt.target.value)} size="3"/>
        <button onClick={() => onAnyadir(parseInt(texto))} disabled={!valido}>Añadir contador</button>
    </div>
}