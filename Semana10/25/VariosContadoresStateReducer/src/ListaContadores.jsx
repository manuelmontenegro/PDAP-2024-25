import React, { useState } from 'react';
import Contador from './Contador.jsx';
import AnyadirContador from './AnyadirContador.jsx';

export default function ListaContadores({ valoresIniciales = [] }) {
    const [estado, setEstado] = useState(valoresIniciales);

    function reducer(estado, accion) {
        switch (accion.type) {
            case 'contador/incrementar': {
                const ind = accion.payload;
                return [...estado.slice(0, ind), estado[ind] + 1, ...estado.slice(ind + 1, estado.length)];
            }

            case 'contador/decrementar': {
                const ind = accion.payload;
                return [...estado.slice(0, ind), estado[ind] - 1, ...estado.slice(ind + 1, estado.length)];
            }

            case 'contador/anyadir': {
                const valorInicial = accion.payload;
                return [...estado, valorInicial];
            }

            default:
                return estado;
        }
    }

    function ejecutarAccion(accion) {
        const nuevoEstado = reducer(estado, accion);
        setEstado(nuevoEstado);
    }

    const suma = estado.reduce((x, y) => x + y, 0);

    return <div>
        { estado.map((valor, i) => <Contador key={i} valor={valor} indice={i} ejecutarAccion={ejecutarAccion}/>) }    
        <p>La suma total es: {suma}</p> 
        <AnyadirContador ejecutarAccion={ejecutarAccion}/>
    </div>
}