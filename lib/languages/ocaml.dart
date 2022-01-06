import '../src/common_modes.dart';
import '../src/mode.dart';

final ocaml = Mode(
    refs: {},
    aliases: ["ml"],
    keywords: {
      "keyword": "and as assert asr begin class constraint do done downto else end exception external for fun function functor if in include inherit! inherit initializer land lazy let lor lsl lsr lxor match method!|10 method mod module mutable new object of open! open or private rec sig struct then to try type val! val virtual when while with parser value",
      "built_in": "array bool bytes char exn|5 float int int32 int64 list lazy_t|5 nativeint|5 string unit in_channel out_channel ref",
      "literal": "true false"
    },
    illegal: "\\/\\/|>>",
    lexemes: "[a-z_]\\w*!?",
    contains: [
      Mode(className: "literal", begin: "\\[(\\|\\|)?\\]|\\(\\)", relevance: 0),
      Mode(className: "comment", begin: "\\(\\*", end: "\\*\\)", contains: [Mode(self: true), phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "symbol", begin: "'[A-Za-z_](?!')[\\w']*"),
      Mode(className: "type", begin: "`[A-Z][\\w']*"),
      Mode(className: "type", begin: "\\b[A-Z][\\w']*", relevance: 0),
      Mode(begin: "[a-z_]\\w*'[\\w']*", relevance: 0),
      Mode(className: "string", begin: "'", end: "'", illegal: "\\n", contains: [backSlashEscape], relevance: 0),
      Mode(className: "string", begin: "\"", end: "\"", illegal: null, contains: [backSlashEscape]),
      Mode(className: "number", begin: "\\b(0[xX][a-fA-F0-9_]+[Lln]?|0[oO][0-7_]+[Lln]?|0[bB][01_]+[Lln]?|[0-9][0-9_]*([Lln]|(\\.[0-9_]*)?([eE][-+]?[0-9_]+)?)?)", relevance: 0),
      Mode(begin: "[-=]>")
    ]);