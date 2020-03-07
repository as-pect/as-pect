import React, { useEffect, useState } from "react";
import { TestContext, EmptyReporter, IAspectExports } from "@as-pect/core";
import { instantiate } from "assemblyscript/lib/loader";

interface Props {
    binary?: Uint8Array;
}

const getWasmBinary = async () => {
    const binary = await fetch("http://localhost:5000/example.spec.wasm");
    console.log(binary);
    const buffer = await binary.arrayBuffer();
    return new Uint8Array(buffer);
}

const DomReporter: React.FC<Props> = ({ binary }) => {
    // const [wasmBinary, setWasmBinary] = useState<Uint8Array | un/defined>();
    useEffect(() => {
        const fetchAndSetWasmBinary = async () => {
            const wasmBinary = await getWasmBinary();
            const ctx = new TestContext({
                fileName: "test.spec.ts", // the name of your module
                // groupRegex: /./, // filter the groups
                // testRegex: /./, // filter the tests
                // nortrace: true, // disable rtrace monitoring
                // stdout: null, // something that can write(input: string): void
                // stderr: null, // something that can write(input: string): void
                binary: wasmBinary, // the binary for test name collection
                reporter: new EmptyReporter(),
            });
            const wasm = await instantiate<IAspectExports>(wasmBinary, {});
            ctx.run(wasm);

            // console.log(ctx.pass);
        };
        fetchAndSetWasmBinary();
    }, []);


    return null;
}

export default DomReporter;
