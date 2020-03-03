import * as React from 'react';

declare module 'dom-reporter' {
  function DomReporter({ binary }): React.ReactElement;
}
