import React from 'react';
import Contador from './Contador.jsx';
import AnyadirContador from './AnyadirContador.jsx';
import { useSelector } from 'react-redux';

export default function ListaContadores() {
    const suma = useSelector(state => state.reduce((x, y) => x + y, 0));
    const numeroContadores = useSelector(state => state.length);

    return <div>
        { Array.from({length: numeroContadores}, (_, i) => 
            <Contador key={i} indice={i}/>) }
        <p>La suma total es: {suma}</p> 
        <AnyadirContador/>
    </div>
}