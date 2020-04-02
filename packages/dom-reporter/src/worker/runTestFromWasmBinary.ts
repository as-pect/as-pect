import { DomReporterData } from '../reporter/DomReporter';

export type SetDomReporterData = (e: DomReporterData) => void;

export const runTestFromWasmBinary = (wasmBinary: Uint8Array, setDomReporterData: SetDomReporterData) => {
  const worker = new Worker("./worker.ts");
  worker.addEventListener('message', setDomReporterData);
  worker.postMessage(wasmBinary);
};
