// Ejemplo de uso de la librería immutable

import { List, Map, Set } from "immutable"

const xs = List.of(1, 6, 5, 3, 10);
const ys = xs.push(20);

console.log(xs.toString());
console.log(ys.toString());

const zs = xs.concat(ys);
console.log(zs.toString());


const m1 = Map({x: 10, y: 20, z: 30})
console.log(m1.get("x"));
const m2 = m1.set("z", 40);
console.log(m1.toString());
console.log(m2.toString());


const s1 = Set.of("A", "E", "I", "O", "U");
const s2 = s1.map(x => x.toLowerCase());
const vowels = s1.union(s2);
console.log(vowels.toString());

function cuantasVocales(str) {
    return List(str).count(x => vowels.has(x))
}

console.log(cuantasVocales("Hola, mundo"));
