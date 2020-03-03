import React, { useEffect, useState } from "react";
import { TestContext } from "@as-pect/core";
// import { EmptyReporter } from '@as-pect/core';

interface Props {
    binary?: Uint8Array;
}

const getWasmBinary = async () => {
    const binary = await fetch("./assembly/__tests__/example.spec.wasm");
    const buffer = await binary.arrayBuffer();
    return new Uint8Array(buffer);
}

const DomReporter: React.FC<Props> = ({ binary }) => {
    const [testContext, setTestContext] = useState<TestContext | undefined>();
    const [wasmBinary, setWasmBinary] = useState<Uint8Array | undefined>();
    useEffect(() => {
        const fetchAndSetWasmBinary = async () => {
            setWasmBinary(await getWasmBinary());
        };
        fetchAndSetWasmBinary();
    }, []);

    useEffect(() => {
        setTestContext(new TestContext({
            fileName: "test.spec.ts", // the name of your module
            // groupRegex: /./, // filter the groups
            // testRegex: /./, // filter the tests
            // nortrace: true, // disable rtrace monitoring
            // stdout: null, // something that can write(input: string): void
            // stderr: null, // something that can write(input: string): void
            binary: wasmBinary, // the binary for test name collection
            reporter: {} as any,
        }));
    }, [wasmBinary]);

    // const result = testRunner?.testGroups.map(
    // ({ tests }, i) => tests.map((test, j) => <div key={`test-${i}-${j}`}>{test.name}: {test.pass}</div>));

    // return <>{result}</>
    return <div>hi</div>
}

export default DomReporter;
