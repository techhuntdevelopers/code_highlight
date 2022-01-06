import '../src/common_modes.dart';
import '../src/mode.dart';

final java = Mode(
    refs: {},
    aliases: ["jsp"],
    keywords: "false synchronized int abstract float private char boolean var static null if const for true while long strictfp finally protected import native final void enum else break transient catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private module requires exports do",
    illegal: "<\\/|#",
    contains: [
      Mode(className: "comment", begin: "/\\*\\*", end: "\\*/", contains: [Mode(begin: "\\w+@", relevance: 0), Mode(className: "doctag", begin: "@[A-Za-z]+"), phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], relevance: 0),
      cLineCommentMode,
      cBlockCommentMode,
      aposStringMode,
      quoteStringMode,
      Mode(className: "class", beginKeywords: "class interface", end: "[{;=]", excludeEnd: true, keywords: "class interface", illegal: "[:\"\\[\\]]", contains: [Mode(beginKeywords: "extends implements"), underScoreTitleMode]),
      Mode(beginKeywords: "new throw return else", relevance: 0),
      Mode(
          className: "function",
          begin: "([À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*(<[À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*(\\s*,\\s*[À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*)*>)?\\s+)+[a-zA-Z_]\\w*\\s*\\(",
          returnBegin: true,
          end: "[{;=]",
          excludeEnd: true,
          keywords: "false synchronized int abstract float private char boolean var static null if const for true while long strictfp finally protected import native final void enum else break transient catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private module requires exports do",
          contains: [
            Mode(begin: "[a-zA-Z_]\\w*\\s*\\(", returnBegin: true, relevance: 0, contains: [underScoreTitleMode]),
            Mode(
                className: "params",
                begin: "\\(",
                end: "\\)",
                keywords: "false synchronized int abstract float private char boolean var static null if const for true while long strictfp finally protected import native final void enum else break transient catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private module requires exports do",
                relevance: 0,
                contains: [aposStringMode, quoteStringMode, cNumberMode, cBlockCommentMode]),
            cLineCommentMode,
            cBlockCommentMode
          ]),
      Mode(className: "number", begin: "\\b(0[bB]([01]+[01_]+[01]+|[01]+)|0[xX]([a-fA-F0-9]+[a-fA-F0-9_]+[a-fA-F0-9]+|[a-fA-F0-9]+)|(([\\d]+[\\d_]+[\\d]+|[\\d]+)(\\.([\\d]+[\\d_]+[\\d]+|[\\d]+))?|\\.([\\d]+[\\d_]+[\\d]+|[\\d]+))([eE][-+]?\\d+)?)[lLfF]?", relevance: 0),
      Mode(className: "meta", begin: "@[A-Za-z]+")
    ]);
