import React, { FC, useState, useCallback, useEffect } from 'react'

import { runTestFromWasmBinary, SetDomReporterData } from './worker/runTestFromWasmBinary';
import { DomReporterData, ExtractedTestInfo } from './reporter/DomReporter';
import { TestContext, TestNode } from '@as-pect/core';
import { AspectTestData, useTestData } from './hooks/useTestData';

export const DomReporter: FC<{ binary: Uint8Array}> = ({ binary }) => {
  const [testContext, testNodes, isTestEnded]: AspectTestData = useTestData({ binary });

  return (
    <main>
      {testNodes?.map(({ name, pass, negated, expected, actual }, idx) => {
        return (
          <section key={`testnode-${idx}`}>
            <h2>{name}: {String(pass || negated)}</h2>
            <p>expected: {expected}</p>
            <p>actual: {actual}</p>
          </section>
        )
      })}
    </main>
  )
}
