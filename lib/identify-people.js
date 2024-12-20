import { Atlas } from './atlas.js';
import * as fs from 'node:fs';
import * as path from 'node:path';
import * as yaml from 'js-yaml';

function fmt(arr) {
    return arr.join('|')
}

const atlas = new Atlas();
await atlas.init();
//const archive = await atlas.dumpCollection("archive");
//console.log(archive)

const people = await atlas.dumpCollection('people');
const targetCollection = "archive";

function identify(pp) {
    return pp.map((p) => {
        const [title, id] = p.split('|').map(i => i.trim());
        if (id) {
            return title === id ? id : fmt([title, id])
        }
        const re = new RegExp(`^${title}$`, 'i');
        const found = people.find(x => x.name.match(re) || x.altNames?.find(an => an.match(re)))
        return found ? (title === found.id ? title : fmt([title, found.id])) : title
    })
}

let total = 0
for (const ai of atlas.collections[targetCollection].items) {
    for (const l of ai.lists) {
        let changes = 0;
        const data = l.originalData;
        for (const i of data) {
            const newPeople = identify(i.people);
            if (JSON.stringify(newPeople) !== JSON.stringify(i.people)) {
                console.log(`identified target=${ai.id} list=${l.id} item=${i.id} new=${JSON.stringify(newPeople)} old=${JSON.stringify(i.people)}`);
                i.people = newPeople;
                changes++;
            }
        }
        if (changes > 0) {
            fs.writeFileSync(path.join('./src', targetCollection, ai.id, 'collections', `${l.id}.json`), JSON.stringify(data, null, 2));
            total += changes
        }
    }
}
console.log(`done. total changes = ${total}`)