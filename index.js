import React from 'react';
import ReactDOM from 'react-dom';

import Sample from './Sample.js';
import SampleWASM from './Sample.wasm';

const sample = Sample({
    locateFile: () => {
        return SampleWASM;
    },
});

sample.then((core) => {
    console.log('soma  = ',core.add(1, 2));
    console.log('menos = ',core.minus(1, 2));
    console.log('mul   = ',core.mul(1, 2));
    console.log(core)
});

ReactDOM.render(
    <div>
        <h1>Using WebAssembly with React From Scratch!</h1>
    </div>,
    document.getElementById('root')
);
