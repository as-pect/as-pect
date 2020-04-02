import { useState, useCallback, useEffect } from 'react';
import { TestContext, TestNode } from '@as-pect/core';
import { ExtractedTestInfo, DomReporterData } from '../reporter/DomReporter';
import { SetDomReporterData, runTestFromWasmBinary } from '../worker/runTestFromWasmBinary';

export type AspectTestData = [Pick<TestContext, ExtractedTestInfo> | null, Array<TestNode>, boolean];

export const useTestData: ({ binary }: { binary: Uint8Array }) => AspectTestData = ({ binary }) => {
  const [testContext, setTestContext] = useState<Pick<TestContext, ExtractedTestInfo> | null>(null);
  const [testNodes, setTestNodes] = useState<Array<TestNode>>([]);
  const [isTestEnded, setTestEnded] = useState<boolean>(false);

  const handleSetDomReporterData: SetDomReporterData  = useCallback(
    ({ data: [ ctx, node ] }) => {
        setTestContext(() => ctx);
        if (node !== null) setTestNodes((prevTestNodes) => [...prevTestNodes, node])
        if (node === null) setTestEnded(() => true);
      },
    [],
  );

  useEffect(() => {
    runTestFromWasmBinary(binary, handleSetDomReporterData);
  }, []);

  return [
    testContext,
    testNodes,
    isTestEnded,
  ]
}
