@builtin "whitespace.ne"
@preprocessor typescript

snapshots -> _ (snapshot _):* {%
	function (d) {
		/**
		 * Signifies a parsed snapshot.
		 */
		interface ISnapshotData {
			/** The testing group that the snapshots belong to. */
			[groupName: string]: {
				/** The test name that the snapshots belong to. */
				[testName: string]: {
					/** The snapshot itself. */
					[snapshotName: string]: string;
				};
			};
		}
		const snapshotPairs = d[1].map((e: any) => e[0]);
		const result: ISnapshotData = {};
		for (let i = 0; i < snapshotPairs.length; i++) {
			const [groupName, testName, snapshotName, value] = snapshotPairs[i];
			const group = result[groupName] = (result[groupName] || {});
			const test = group[testName] = (group[testName] || {});
            if (test.hasOwnProperty(snapshotName)) throw new Error("Invalid snapshot, duplicate detected: " + groupName + " " + testName + " " + snapshotName);
            test[snapshotName] = value;
		}
		return result;
	}
%}

snapshot -> "exports[`" value "`][`" value "`][`" value "`] = `" value "`;" {%
   function parseSnapshot(d) {
	   return [d[1], d[3], d[5], d[7]];
   }
%}

value -> ([^`] | escapedTick):* {%
	function parseValue(d) {
	  return d[0].join("");
  }
%}

escapedTick -> "\\`" {% () => "`" %}