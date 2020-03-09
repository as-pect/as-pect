@preprocessor typescript

start -> _ lines _ {% d => {
  const results = d[1];
  const map = new Map<string, string>();
  for (let i = 0; i < results.length; i++) {
    const [key, value] = results[i];
    if (map.has(key)) throw new Error("Invalid snapshot.");
    map.set(key, value);
  }
  return map;
} %}
lines -> line (_ line):* {% d => [d[0]].concat(d[1].map((e: any) => e[1])) %}

line -> "exports[" _ string _ "]" _ "=" _ string _ ";" {% d => [d[2], d[8]] %}

_ -> [ \t\r\n]:*

string -> "`" (escaped | [^`]):* "`" {% d => d[1].join("") %}
escaped -> "\\`" {% () => "`" %}