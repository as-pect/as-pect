
export function capitalize(word: string): string {
  return  word[0].toLocaleUpperCase() + word.substring(1);
}

export function toCamelCase(str: string, from: string = "-"): string {
  return str.split(from)
            .map((word, idx) => (idx > 0) ? capitalize(word): word)
            .join("");
}
