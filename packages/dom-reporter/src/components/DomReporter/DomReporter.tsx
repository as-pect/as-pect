import React, { FC, useEffect } from 'react'
import { AspectTestData, useTestData } from '../../hooks/useTestData';

export const DomReporter: FC<{ binary: Uint8Array}> = ({ binary }) => {
  const [testContext, testNodes, isTestEnded]: AspectTestData = useTestData({ binary });

  useEffect(() => {
    console.log(testNodes)
  }, [testNodes])

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
