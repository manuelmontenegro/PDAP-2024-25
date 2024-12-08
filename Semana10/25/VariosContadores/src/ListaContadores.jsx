import React, { useState } from 'react';
import Contador from './Contador.jsx';
import AnyadirContador from './AnyadirContador.jsx';

export default function ListaContadores({ valoresIniciales = [] }) {
    const [estado, setEstado] = useState(valoresIniciales);

    function incrementarContador(indice) {
        setEstado([...estado.slice(0, indice), estado[indice] + 1, ...estado.slice(indice + 1, estado.length)]);
    }

    function decrementarContador(indice) {
        setEstado([...estado.slice(0, indice), estado[indice] - 1, ...estado.slice(indice + 1, estado.length)]);
    }

    function anyadirContador(valorInicial) {
        setEstado([...estado, valorInicial]);
    }

    const suma = estado.reduce((x, y) => x + y, 0);

    return <div>
        { estado.map((valor, i) => <Contador key={i} valor={valor} onIncrementar={() => incrementarContador(i)} onDecrementar={() => decrementarContador(i)}/>) }    
        <p>La suma total es: {suma}</p> 
        <AnyadirContador onAnyadir={anyadirContador}/>
    </div>
}