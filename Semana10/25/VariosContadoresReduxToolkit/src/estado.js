import { configureStore, createSlice } from '@reduxjs/toolkit'

const slice = createSlice({
    name: 'contador',
    initialState: [1, 5, 7, 9],
    reducers: {
        incrementar: (estado, accion) => {
            const ind = accion.payload;
            return [...estado.slice(0, ind), estado[ind] + 1, ...estado.slice(ind + 1, estado.length)];
        },
        decrementar: (estado, accion) => {
            const ind = accion.payload;
            return [...estado.slice(0, ind), estado[ind] - 1, ...estado.slice(ind + 1, estado.length)];
        },
        anyadir: (estado, accion) => {
            const valorInicial = accion.payload;
            return [...estado, valorInicial];
        }
    }
})

export const { incrementar, decrementar, anyadir } = slice.actions;

const store = configureStore({reducer: slice.reducer});

export default store