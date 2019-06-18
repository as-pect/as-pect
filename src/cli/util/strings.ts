/**
 * Capitalize a word.
 *
 * @param {string} word - The word to be capitalized.
 */
export function capitalize(word: string): string {
  return word[0].toLocaleUpperCase() + word.substring(1);
}

/**
 * CamelCase a single string. Usually used with `dash-cased` words.
 *
 * @param {string} str - The string to be camelCased.
 * @param {string} from - The string seperator.
 */
export function toCamelCase(str: string, from: string = "-"): string {
  return str.split(from)
    .map((word, idx) => (idx > 0) ? capitalize(word) : word)
    .join("");
}
