'use strict'
// Split a byte stream into lines (LF or CRLF), keeping a partial last line between chunks.
function lineSplitter(onLine) {
  let buf = ''
  return {
    push(chunk) {
      buf += chunk.toString('utf8')
      let i
      while ((i = buf.indexOf('\n')) >= 0) {
        onLine(buf.slice(0, i).replace(/\r$/, ''))
        buf = buf.slice(i + 1)
      }
      if (buf.length > 65536) buf = '' // never grow without bound on a stream with no newlines
    }
  }
}
module.exports = { lineSplitter }
