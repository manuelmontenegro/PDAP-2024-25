import { configureStore } from '@reduxjs/toolkit'

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

export function incrementar(indice) {
    return {
        type: 'contador/incrementar',
        payload: indice
    };
}

export function decrementar(indice) {
    return {
        type: 'contador/decrementar',
        payload: indice
    };
}

export function anyadir(valorInicial) {
    return {
        type: 'contador/anyadir',
        payload: valorInicial
    };
}

const store = configureStore({
    reducer: reducer,
    preloadedState: [1, 5, 7, 9]
});

export default store