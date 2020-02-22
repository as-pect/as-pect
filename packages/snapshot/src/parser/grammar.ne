@builtin "whitespace.ne"
@preprocessor typescript

snapshots -> _ (snapshot _):* {%
	function (d) {
		type SnapshotData = Map<string, Map<string, Map<string, string>>>;

		const snapshotPairs = d[1].map((e: any) => e[0]);
		const result: SnapshotData = new Map();
		for (let i = 0; i < snapshotPairs.length; i++) {
			const [groupName, testName, snapshotName, value] = snapshotPairs[i];
			if (!result.has(groupName)) result.set(groupName, new Map());
			const group = result.get(groupName)!;
			if (!group.has(testName)) group.set(testName, new Map());
			const test = group.get(testName)!;
			if (test.has(snapshotName)) throw new Error("Invalid snapshot, duplicate detected: " + groupName + " " + testName + " " + snapshotName);
			test.set(snapshotName, value);
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