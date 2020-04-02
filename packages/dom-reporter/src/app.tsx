import React, { FC, useState, useCallback, useEffect } from 'react'

import { runTestFromWasmBinary, SetDomReporterData } from './worker/runTestFromWasmBinary';
import { DomReporterData, ExtractedTestInfo } from './reporter/DomReporter';
import { TestContext, TestNode } from '@as-pect/core';

export const DomReporter: FC<{ binary: Uint8Array}> = ({ binary }) => {
  const [testContext, setTestContext] = useState<Pick<TestContext, ExtractedTestInfo> | null>(null);
  const [testNodes, setTestNodes] = useState<Array<TestNode>>([]);

  const handleSetDomReporterData: SetDomReporterData  = useCallback(
    ({ data: [ ctx, node ] }) => {
        setTestContext(() => ctx);
        if (node !== null) setTestNodes((prevTestNodes) => [...prevTestNodes, node])
        console.log(ctx, node)
      },
    [],
  )

  useEffect(() => {
    runTestFromWasmBinary(binary, handleSetDomReporterData);
  }, [])

  useEffect(() => {
    console.log(testNodes)
  }, [testNodes]);

  return (
    <main>
      {testContext?.testRunCount}
      {testNodes?.map(({ name, pass, negated }, idx) => {
        return (
          <section key={`testnode-${idx}`}>
            {name}: {String(pass || negated)}
          </section>
        )
      }}
    </main>
  )
}
