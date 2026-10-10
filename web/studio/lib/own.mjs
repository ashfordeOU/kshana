// SPDX-License-Identifier: AGPL-3.0-only
// A lookup that answers only for a table's own keys. A scenario's `kind` (and the keys of a
// shared link) are text the reader controls; `table[key]` on a plain object also answers for
// inherited names such as "constructor" or "toString", which are not entries. Pure; tested in
// own.test.mjs.
export const own = (table, key) => (typeof key === "string" && Object.hasOwn(table, key) ? table[key] : undefined);
