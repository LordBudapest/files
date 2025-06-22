
(* This file was auto-generated based on "syntax.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 437 ->
        "160\nan input statement\na s-expr or a closing parenthesis\n"
    | 322 ->
        "160\nan input statement\na s-expr or a closing parenthesis\n"
    | 0 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 1 ->
        "115\na command\na command name\n"
    | 3 ->
        "114\na set-option command\nan attribute of the form \"keyword value?\"\n"
    | 4 ->
        "158\nan attribute\neither an attribute value as s-expression,\nanother attribute, or a closing parenthesis\n"
    | 7 ->
        "157\nan attribute value\na closing parenthesis, or an s-expression, i.e.\na literal, symbol, reserved word, keyword, or an s-expression in parentheses\n"
    | 54 ->
        "156\na list of s-expressions\na closing parenthesis, or another s-expression, i.e.\na literal, symbol, reserved word, keyword, or an s-expression in parentheses\n"
    | 18 ->
        "155\nan s-expression\na closing parenthesis, or another s-expression, i.e.\na literal, symbol, reserved word, keyword, or an s-expression in parentheses\n"
    | 64 ->
        "113\na set-option command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 67 ->
        "112\na set-logic command\na symbol for the logic name\n"
    | 68 ->
        "111\na set-logic command\na closing parenthesis\n"
    | 70 ->
        "110\na set-info command\nan attribute of the form \"keyword value?\"\n"
    | 71 ->
        "109\na set-info command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 73 ->
        "108\na reset-assertions command\na closing parenthesis\n"
    | 328 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 75 ->
        "107\na reset command\na closing parenthesis\n"
    | 77 ->
        "106\na push command\na numeral\n"
    | 78 ->
        "105\na push command\na closing parenthesis\n"
    | 80 ->
        "104\na pop command\na numeral\n"
    | 81 ->
        "103\na pop command\na closing parenthesis\n"
    | 83 ->
        "102\na get-value command\nan opening parenthesis to start a list of terms\n"
    | 84 ->
        "101\na get-value command\na term\n"
    | 174 ->
        "100\na get-value command\na closing parenthesis\n"
    | 176 ->
        "099\na get-unsat-core command\na closing parenthesis\n"
    | 178 ->
        "098\na get-unsat-assumptions command\na closing parenthesis\n"
    | 180 ->
        "097\na get-proof command\na closing parenthesis\n"
    | 182 ->
        "096\na get-option command\na keyword of the form \":symbol\"\n"
    | 183 ->
        "095\na get-option command\na closing parenthesis\n"
    | 185 ->
        "094\na get-model command\na closing parenthesis\n"
    | 187 ->
        "093\na get-info command\na keyword of the form \":symbol\"\n"
    | 189 ->
        "092\na get-info command\na closing parenthesis\n"
    | 191 ->
        "091\na get-assignment command\na closing parenthesis\n"
    | 193 ->
        "090\na get-assertions command\na closing parenthesis\n"
    | 195 ->
        "089\nan exit command\na closing parenthesis\n"
    | 197 ->
        "088\nan echo command\na string literal\n"
    | 198 ->
        "087\nan echo command\na closing parenthesis\n"
    | 200 ->
        "086\na sort definition\na symbol for the defined sort's name\n"
    | 201 ->
        "085\na sort definition\nan opening parenthesis to start a list of arguments\n"
    | 202 ->
        "084\na sort definition\na closing parenthesis, or a list of symbols for the definition arguments\n"
    | 203 ->
        "154\na list of symbols\nanother symbol or a closing parenthesis\n"
    | 206 ->
        "083\na sort definition\na sort for the definition body\n"
    | 207 ->
        "082\na sort definition\na closing parenthesis\n"
    | 209 ->
        "081\na recursive function definition\na symbol for the function's name\n"
    | 210 ->
        "153\na function definition\nan opening parenthesis to start the list of arguments\n"
    | 211 ->
        "152\na function definition\na sorted variable of the form \"(var sort)\", or a closing parenthesis\n"
    | 212 ->
        "151\na list of sorted variables\nanother sorted variable of the form \"(var sort)\", or a closing parenthesis\n"
    | 215 ->
        "150\na function definition\na sort for the return type of the function\n"
    | 216 ->
        "149\na function definition\na term for the body of the function\n"
    | 218 ->
        "080\na recursive function definition\na closing parenthesis\n"
    | 220 ->
        "079\na recursive functions declaration\nan opening parenthesis to start a list of function declaration\n"
    | 221 ->
        "078\na recursive functions definition\na function declaration of the form \"(name (sort*) sort)\"\n"
    | 222 ->
        "148\na function declaration\na symbol for the function name\n"
    | 223 ->
        "147\na function declaration\nan opening parenthesis to start the list of arguments sorts\n"
    | 224 ->
        "146\na function declaration\neither a sort for the first argument type, or a closing parenthesis\n"
    | 226 ->
        "145\na function declaration\na sort for the return type of the function\n"
    | 227 ->
        "144\na function declaration\na closing parenthesis\n"
    | 235 ->
        "143\na list of function declarations\nanother function declaration, or a closing parenthesis\n"
    | 230 ->
        "077\na recursive functions definition\nan opening parenthesis to start a list the function's bodies\n"
    | 231 ->
        "076\na recursive functions definition\na term for the first function's body\n"
    | 233 ->
        "075\na recursive functions definition\na closing parenthesis\n"
    | 237 ->
        "074\na function definition\na symbol for the function's name\n"
    | 238 ->
        "073\na function definition\na closing parenthesis\n"
    | 240 ->
        "072\na sort declaration\na symbol for the sort name\n"
    | 241 ->
        "071\na sort declaration\na numeral for the arity of the sort being declared\n"
    | 242 ->
        "070\na sort declaration\na closing parenthesis\n"
    | 244 ->
        "069\na function declaration\na symbol for the function's name\n"
    | 245 ->
        "068\na function declaration\nan opening parenthesis to start the list of sorts for the function's arguments\n"
    | 246 ->
        "067\na function declaration\na closing parenthesis, or a list of sorts for the arguments of the function\n"
    | 247 ->
        "142\na list of sorts\nanother sort or a closing parenthesis\n"
    | 250 ->
        "066\na function declaration\na sort for the return type of the function\n"
    | 251 ->
        "065\na function declaration\na closing parenthesis\n"
    | 253 ->
        "064\na datatypes declaration\na list of sort declaration, starting with an opening parenthesis\n"
    | 254 ->
        "063\na datatypes declaration\na parametric sort declaration of the form \"(symbol num)\"\n"
    | 255 ->
        "141\na datatype arity declaration\na symbol for the datatype name\n"
    | 256 ->
        "140\na datatype arity declaration\na numeral for the datatype arity\n"
    | 257 ->
        "139\na datatype arity declaration\na closing parenthesis\n"
    | 259 ->
        "138\na list of datatype arity declarations\nanother datatype arity declaration, or a closing parenthesis\n"
    | 262 ->
        "062\na datatypes declaration\nan opening parenthesis to start a list of datatype definitions,\none for each of the sorts being declared\n"
    | 263 ->
        "061\na datatypes definition\nan opening parenthesis to start a list of constructors for the first defined datatype\n"
    | 293 ->
        "137\na list of datatype declarations\nanother datatype declaration, or a closing parenthesis\n"
    | 291 ->
        "060\na datatypes declaration\na closing parenthesis\n"
    | 295 ->
        "059\na datatype declaration\na symbol\n"
    | 296 ->
        "058\na datatype declaration\nan opening parenthesis to start the datatype declaration\n"
    | 264 ->
        "136\na datatype declaration\na list of constructor declarations of the form \"(symbol selector*)\",\nor a parameterization of the datatype of the form \"par (sort+)\"\n"
    | 265 ->
        "135\na datatype declaration\nan opening parenthesis to start a list of sort parameters for the datatype\n"
    | 266 ->
        "134\na list of sort variables to parameterize a datatype\na symbol\n"
    | 286 ->
        "133\na list of sort variables to parameterize a datatype\nanother symbol, or a closing parenthesis\n"
    | 269 ->
        "132\na datatype declaration\nan opening parenthesis to start the list of constructors\n"
    | 270 ->
        "131\na datatype declaration\na constructor declaration of the form \"(symbol selector*)\"\n"
    | 282 ->
        "130\na datatype declaration\na closing parenthesis\n"
    | 271 ->
        "129\na constructor declaration\na symbol for the constructor name\n"
    | 272 ->
        "128\na constructor declaration\na selector declaration, of the form \"(selector sort)\", or a closing parenthesis\n"
    | 273 ->
        "127\na selector declaration\na symbol for the selector name\n"
    | 274 ->
        "126\na selector declaration\na sort for the return type of the selector\n"
    | 275 ->
        "125\na selector declaration\na closing parenthesis\n"
    | 277 ->
        "124\na list of selectors\nanother selector of the form \"(selector sort)\", or a closing parenthesis\n"
    | 284 ->
        "123\na list of constructor declarations\nanother constructor declaration of the form \"(constructor selectors*)\",\nor a closing parenthesis\n"
    | 297 ->
        "057\na datatype declaration\na closing parenthesis\n"
    | 299 ->
        "056\na constant declaration\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 300 ->
        "055\na constant declaration\na sort\n"
    | 301 ->
        "054\na constant declaration\na closing parenthesis\n"
    | 101 ->
        "122\na sort\na sort to start a non-empty list of arguments\n"
    | 102 ->
        "121\na list of sorts\na sort, or a closing parenthesis\n"
    | 100 ->
        "120\na sort\nan identifier to make a sort function application (such as \"f x y\"),\nor an underscore to start an indexed identifier\n"
    | 303 ->
        "053\na check-sat-assuming command\na list of propositional literals, starting with an opening parenthesis\n"
    | 304 ->
        "052\na list of propositional literals\na propositional literal, i.e. either a symbol or the negation of a symbol\n"
    | 312 ->
        "119\na list of propositional literals\na propositional literal of the form \"symbol\" or \"(not symbol)\"\n"
    | 305 ->
        "117\na propositional literal\nthe \"not\" symbol\n"
    | 307 ->
        "047\na propositional literal\na symbol\n"
    | 308 ->
        "046\na propositional literal\na closing parenthesis\n"
    | 315 ->
        "051\na check-sat-assuming command\na closing parenthesis\n"
    | 317 ->
        "050\na check-sat command\na closing parenthesis\n"
    | 319 ->
        "048\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 320 ->
        "049\nan assertion\na closing parenthesis\n"
    | 168 ->
        "044\na function application\na term as argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 86 ->
        "042\na term\na term construction (identifier, let binding, quantification, ...);\nnote that this expectation if caused by the preceding opening parenthesis\n"
    | 109 ->
        "038\na match\na term to match (i.e. the scrutinee of the match)\n"
    | 110 ->
        "037\na match\na match case list, starting with an opening parenthesis\n"
    | 111 ->
        "036\na list of match cases\na match case of the form \"(pattern term)\"\n"
    | 128 ->
        "031\na match\na closing parenthesis to close the match\n"
    | 132 ->
        "027\na term\na variable binding list, starting with an opening parenthesis\n"
    | 133 ->
        "026\na term\na variable binding of the form \"(var term)\"\n"
    | 141 ->
        "021\na term\na term (body for the let binding)\n"
    | 142 ->
        "020\na term\na closing parenthesis to end the let binding\n"
    | 144 ->
        "019\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 145 ->
        "018\na term\na sorted variable of the form \"(var sort)\"\n"
    | 153 ->
        "013\na term\na term (body for the universal quantification)\n"
    | 154 ->
        "012\na term\na closing parenthesis to end the universally quantified formula\n"
    | 156 ->
        "011\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 157 ->
        "010\na term\na sorted variable of the form \"(var sort)\"\n"
    | 159 ->
        "009\na term\na term (body for the existencial quantification)\n"
    | 160 ->
        "008\na term\na closing parenthesis to end the existencially quantified formula\n"
    | 162 ->
        "007\na term with attribute\na term.\n"
    | 163 ->
        "006\nattributes for a term\nan attribute of the form \"keyword value\"\n"
    | 330 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 331 ->
        "115\na command\na command name\n"
    | 332 ->
        "114\na set-option command\nan attribute of the form \"keyword value?\"\n"
    | 333 ->
        "113\na set-option command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 335 ->
        "112\na set-logic command\na symbol for the logic name\n"
    | 336 ->
        "111\na set-logic command\na closing parenthesis\n"
    | 338 ->
        "110\na set-info command\nan attribute of the form \"keyword value?\"\n"
    | 339 ->
        "109\na set-info command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 341 ->
        "108\na reset-assertions command\na closing parenthesis\n"
    | 343 ->
        "107\na reset command\na closing parenthesis\n"
    | 345 ->
        "106\na push command\na numeral\n"
    | 346 ->
        "105\na push command\na closing parenthesis\n"
    | 348 ->
        "104\na pop command\na numeral\n"
    | 349 ->
        "103\na pop command\na closing parenthesis\n"
    | 351 ->
        "102\na get-value command\nan opening parenthesis to start a list of terms\n"
    | 352 ->
        "101\na get-value command\na term\n"
    | 354 ->
        "100\na get-value command\na closing parenthesis\n"
    | 356 ->
        "099\na get-unsat-core command\na closing parenthesis\n"
    | 358 ->
        "098\na get-unsat-assumptions command\na closing parenthesis\n"
    | 360 ->
        "097\na get-proof command\na closing parenthesis\n"
    | 362 ->
        "096\na get-option command\na keyword of the form \":symbol\"\n"
    | 363 ->
        "095\na get-option command\na closing parenthesis\n"
    | 365 ->
        "094\na get-model command\na closing parenthesis\n"
    | 367 ->
        "093\na get-info command\na keyword of the form \":symbol\"\n"
    | 368 ->
        "092\na get-info command\na closing parenthesis\n"
    | 370 ->
        "091\na get-assignment command\na closing parenthesis\n"
    | 372 ->
        "090\na get-assertions command\na closing parenthesis\n"
    | 374 ->
        "089\nan exit command\na closing parenthesis\n"
    | 376 ->
        "088\nan echo command\na string literal\n"
    | 377 ->
        "087\nan echo command\na closing parenthesis\n"
    | 379 ->
        "086\na sort definition\na symbol for the defined sort's name\n"
    | 380 ->
        "085\na sort definition\nan opening parenthesis to start a list of arguments\n"
    | 381 ->
        "084\na sort definition\na closing parenthesis, or a list of symbols for the definition arguments\n"
    | 383 ->
        "083\na sort definition\na sort for the definition body\n"
    | 384 ->
        "082\na sort definition\na closing parenthesis\n"
    | 386 ->
        "081\na recursive function definition\na symbol for the function's name\n"
    | 387 ->
        "080\na recursive function definition\na closing parenthesis\n"
    | 389 ->
        "079\na recursive functions declaration\nan opening parenthesis to start a list of function declaration\n"
    | 390 ->
        "078\na recursive functions definition\na function declaration of the form \"(name (sort*) sort)\"\n"
    | 392 ->
        "077\na recursive functions definition\nan opening parenthesis to start a list the function's bodies\n"
    | 393 ->
        "076\na recursive functions definition\na term for the first function's body\n"
    | 395 ->
        "075\na recursive functions definition\na closing parenthesis\n"
    | 397 ->
        "074\na function definition\na symbol for the function's name\n"
    | 398 ->
        "073\na function definition\na closing parenthesis\n"
    | 400 ->
        "072\na sort declaration\na symbol for the sort name\n"
    | 401 ->
        "071\na sort declaration\na numeral for the arity of the sort being declared\n"
    | 402 ->
        "070\na sort declaration\na closing parenthesis\n"
    | 404 ->
        "069\na function declaration\na symbol for the function's name\n"
    | 405 ->
        "068\na function declaration\nan opening parenthesis to start the list of sorts for the function's arguments\n"
    | 406 ->
        "067\na function declaration\na closing parenthesis, or a list of sorts for the arguments of the function\n"
    | 408 ->
        "066\na function declaration\na sort for the return type of the function\n"
    | 409 ->
        "065\na function declaration\na closing parenthesis\n"
    | 411 ->
        "064\na datatypes declaration\na list of sort declaration, starting with an opening parenthesis\n"
    | 412 ->
        "063\na datatypes declaration\na parametric sort declaration of the form \"(symbol num)\"\n"
    | 414 ->
        "062\na datatypes declaration\nan opening parenthesis to start a list of datatype definitions,\none for each of the sorts being declared\n"
    | 415 ->
        "061\na datatypes definition\nan opening parenthesis to start a list of constructors for the first defined datatype\n"
    | 417 ->
        "060\na datatypes declaration\na closing parenthesis\n"
    | 419 ->
        "059\na datatype declaration\na symbol\n"
    | 420 ->
        "058\na datatype declaration\nan opening parenthesis to start the datatype declaration\n"
    | 421 ->
        "057\na datatype declaration\na closing parenthesis\n"
    | 423 ->
        "056\na constant declaration\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 424 ->
        "055\na constant declaration\na sort\n"
    | 425 ->
        "054\na constant declaration\na closing parenthesis\n"
    | 427 ->
        "053\na check-sat-assuming command\na list of propositional literals, starting with an opening parenthesis\n"
    | 428 ->
        "052\na list of propositional literals\na propositional literal, i.e. either a symbol or the negation of a symbol\n"
    | 430 ->
        "051\na check-sat-assuming command\na closing parenthesis\n"
    | 432 ->
        "050\na check-sat command\na closing parenthesis\n"
    | 434 ->
        "048\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 435 ->
        "049\nan assertion\na closing parenthesis\n"
    | 443 ->
        "046\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 447 ->
        "041\nan indexed identifier\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 448 ->
        "040\nan indexed identifier\nan index, i.e. either a numeral, a symbol, or a hexadecimal number;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 94 ->
        "045\nan index list\neither a closing parenthesis, or an index (i.e. a numeral, a symbol,\nor a hexadecimal);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 483 ->
        "044\na function application\na term as argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 169 ->
        "043\na list of terms\neither a closing parenthesis, or another term;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 446 ->
        "042\na term\na term construction (identifier, let binding, quantification, ...);\nnote that this expectation if caused by the preceding opening parenthesis\n"
    | 87 ->
        "041\nan indexed identifier\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 88 ->
        "040\nan indexed identifier\nan index, i.e. either a numeral, a symbol, or a hexadecimal number;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 96 ->
        "039\nan identifier in parentheses\neither an indexed identifier (starting with an underscore)\nor an 'as' type ascription;\nnote that this is because of the preceding opening parenthesis\n"
    | 97 ->
        "004\na qualified identifier\nan identifier.\nNote that keywords (such as '_', 'as', ...) are not identifiers,\nand thus are not allowed here.\n"
    | 99 ->
        "003\na qualified identifier\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords (such as '_', 'as', ...) are none of these, and thus\nare not allowed here.\n"
    | 107 ->
        "002\na qualified identifier\na closing parenthesis\n"
    | 451 ->
        "038\na match\na term to match (i.e. the scrutinee of the match)\n"
    | 452 ->
        "037\na match\na match case list, starting with an opening parenthesis\n"
    | 453 ->
        "036\na list of match cases\na match case of the form \"(pattern term)\"\n"
    | 112 ->
        "035\na match case\na pattern, i.e. either a symbol or a datatype pattern of\nthe form \"(symbol symbol+)\";\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 121 ->
        "034\na match case\na term for the case body\n"
    | 122 ->
        "033\na match case\na closing parenthesis to close the match case\n"
    | 130 ->
        "032\na list of match cases\na closing parenthesis or a match case of the form \"(pattern body)\"\n"
    | 455 ->
        "031\na match\na closing parenthesis to close the match\n"
    | 114 ->
        "030\na pattern\na symbol (either a variable or a datatype constructor);\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 115 ->
        "029\narguments of a constructor in a pattern\na symbol to bind the first constructor argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 116 ->
        "028\narguments of a constructor in a pattern\na closing parenthesis, or a symbol to bind the argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 457 ->
        "027\na term\na variable binding list, starting with an opening parenthesis\n"
    | 458 ->
        "026\na term\na variable binding of the form \"(var term)\"\n"
    | 134 ->
        "025\na variable binding\na symbol (i.e. variable name)\n"
    | 135 ->
        "024\na variable binding\na term\n"
    | 136 ->
        "023\na variable binding\na closing parenthesis\n"
    | 138 ->
        "022\na list of variable binding\na closing parenthesis or a variable binding of the form \"(var term)\"\n"
    | 460 ->
        "021\na term\na term (body for the let binding)\n"
    | 461 ->
        "020\na term\na closing parenthesis to end the let binding\n"
    | 463 ->
        "019\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 464 ->
        "018\na term\na sorted variable of the form \"(var sort)\"\n"
    | 146 ->
        "017\na sorted variable\na symbol, i.e. a variable name\n"
    | 147 ->
        "016\na sorted variable\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 148 ->
        "015\na sorted variable\na closing parenthesis\n"
    | 150 ->
        "014\na list of sorted variables\neither a closing parentheis, or a sorted var of the form \"(var sort)\"\n"
    | 466 ->
        "013\na term\na term (body for the universal quantification)\n"
    | 467 ->
        "012\na term\na closing parenthesis to end the universally quantified formula\n"
    | 469 ->
        "011\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 470 ->
        "010\na term\na sorted variable of the form \"(var sort)\"\n"
    | 472 ->
        "009\na term\na term (body for the existencial quantification)\n"
    | 473 ->
        "008\na term\na closing parenthesis to end the existencially quantified formula\n"
    | 475 ->
        "007\na term with attribute\na term\n"
    | 476 ->
        "006\na term\nan attribute of the form \"keyword value\"\n"
    | 166 ->
        "005\nan attribute list\neither a closing parenthesis, or another attribute of the form\n\"keyword value\"\n"
    | 479 ->
        "004\na qualified identifier\nan identifier;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 480 ->
        "003\na qualified identifier\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 481 ->
        "002\na qualified identifier\na closing parenthesis\n"
    | 98 ->
        "001\nan identifier\nan underscore: identifiers starting with an opening parenthesis must be\nindexed identifiers, of the form \"(_ symbol index+)\"\n"
    | _ ->
        raise Not_found
