
(* This file was auto-generated based on "syntax.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 530 ->
        "160\nan input statement\na s-expr or a closing parenthesis\n"
    | 403 ->
        "160\nan input statement\na s-expr or a closing parenthesis\n"
    | 54 ->
        "157\nan s-expression\na closing parentheis\n"
    | 18 ->
        "156\nan s-expression\na closing parentheis\n"
    | 7 ->
        "155\nan s-expression\na closing parentheis\n"
    | 223 ->
        "147\na function definition\na term for the function body\n"
    | 233 ->
        "146\na parametric function definition\nthe keyword par\n"
    | 234 ->
        "145\na list of type variable\nan opening parenthesis\n"
    | 235 ->
        "144\na list of type variable\nan identifier\n"
    | 237 ->
        "143\na function definition\nthe name of the function\n"
    | 238 ->
        "142\na list of parameters\nan opening parenthesis\n"
    | 239 ->
        "141\na list of parameters\na formal parameter: (id sort)\n"
    | 241 ->
        "140\na function definition\na sort for the result type\n"
    | 242 ->
        "139\na function definition\na term for the body of the function\n"
    | 243 ->
        "139\na function definition\na closing parenthesis\n"
    | 264 ->
        "138\na parametric function declaration\nthe keyword par\n"
    | 265 ->
        "137\na list of type variable\nan open parenthesis\n"
    | 266 ->
        "136\na list of type variable\nan identifier\n"
    | 268 ->
        "135\na function declaration\nthe name of the function\n"
    | 269 ->
        "134\na list of formal parameters\nan opening parenthesis\n"
    | 270 ->
        "133\na list of formal parameters\na formal parameters: (id sort)\n"
    | 272 ->
        "132\na return sort\na sort\n"
    | 273 ->
        "131\ndefinition of recursive function\na closing parenthesis\n"
    | 308 ->
        "130\nthe declaration of a parametric function\nthe keyword par\n"
    | 309 ->
        "129\na list of type variable\nan opening parenthesis\n"
    | 310 ->
        "128\nthe type variable of a parametric function\nan identifier (type variable)\n"
    | 312 ->
        "127\na declaration of a parametric function\nthe name of the function\n"
    | 313 ->
        "126\nthe type parameters of a function\nan opening parenthesis\n"
    | 314 ->
        "125\nthe type parameters of a function\na sort (identifier or an opening parenthesis)\n"
    | 316 ->
        "124\nthe return type of a function\na sort (identifier or an opening parenthesis)\n"
    | 317 ->
        "123\na function declaration\na closing parenthesis\n"
    | 367 ->
        "122\na non empty list of type variable\nan opening parenthesis\n"
    | 368 ->
        "121\na list of type variable\nan identifier\n"
    | 370 ->
        "120\na sort\nan identifier or an opening parenthesis\n"
    | 371 ->
        "119\na constant declaration\na closing parenthesis\n"
    | 372 ->
        "118\na constant declaration\na closing parenthesis\n"
    | 502 ->
        "120\na parametric or monormorphic constant\nthe keyword par or a sort\n"
    | 503 ->
        "122\na non empty list of type variable\nan opening parenthesis\n"
    | 504 ->
        "121\na list of type variable\nan identifier\n"
    | 506 ->
        "120\na sort\nan identifier or an opening parenthesis\n"
    | 507 ->
        "119\na constant declaration\na closing parenthesis\n"
    | 508 ->
        "118\na constant declaration\na closing parenthesis\n"
    | 100 ->
        "117\na sort\nan identifier or an underscore\n"
    | 0 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 1 ->
        "115\na command\na command name\n"
    | 3 ->
        "114\na set-option command\nan attribute of the form \"keyword value?\"\n"
    | 259 ->
        "171\na list of function declaration\na closing parenthesis to close the function declaration\n"
    | 258 ->
        "170\na function declaration\na sort for the return type of the function\n"
    | 256 ->
        "169\na function declaration\na sorted variable of the form \"(var sort)\"\n"
    | 255 ->
        "168\na function declaration\nan opening parenthesis to start the list of arguments\n"
    | 253 ->
        "167\na function declaration\na sort variable\n"
    | 252 ->
        "166\na function declaration\nan opening parenthesis to start a list of sort variables to\nparameterize the function sort\n"
    | 225 ->
        "165\na function definition\na closing parenthesis to close the parameterized definition\n"
    | 222 ->
        "164\na function definition\na term for the body of the function\n"
    | 221 ->
        "163\na function definition\na sort for the return type of the function\n"
    | 217 ->
        "162\na function definition\na sorted variable of the form \"(var sort)\"\n"
    | 216 ->
        "161\na function definition\nan opening parenthesis to start the list of arguments\nof the function\n"
    | 213 ->
        "160\na function definition\na sort variable (symbol)\n"
    | 212 ->
        "159\na function definition\nan opening parenthesis to start a list of sort variables to\nparameterize the function definition over\n"
    | 4 ->
        "158\nan attribute\neither an attribute value as s-expression,\nanother attribute, or a closing parenthesis\n"
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
    | 409 ->
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
        "152\na function definition\na sorted variable of the form \"(var sort)\", a closing parenthesis,\nor a parameterization of the form \"par (var+)\"\n"
    | 218 ->
        "151\na list of sorted variables\nanother sorted variable of the form \"(var sort)\", or a closing parenthesis\n"
    | 230 ->
        "150\na function definition\na sort for the return type of the function\n"
    | 231 ->
        "149\na function definition\na term for the body of the function\n"
    | 245 ->
        "080\na recursive function definition\na closing parenthesis\n"
    | 247 ->
        "079\na recursive functions declaration\nan opening parenthesis to start a list of function declaration\n"
    | 248 ->
        "078\na recursive functions definition\na function declaration of the form \"(name (sort*) sort)\",\nor \"(name (par (var+) (sort*) sort))\"\n"
    | 249 ->
        "148\na function declaration\na symbol for the function name\n"
    | 250 ->
        "147\na function declaration\nan opening parenthesis to start the list of arguments sorts\n"
    | 251 ->
        "146\na function declaration\neither a sort for the first argument type, or a closing parenthesis\n"
    | 262 ->
        "145\na function declaration\na sort for the return type of the function\n"
    | 275 ->
        "144\na function declaration\na closing parenthesis\n"
    | 276 ->
        "143\na list of function declarations\nanother function declaration, or a closing parenthesis\n"
    | 279 ->
        "077\na recursive functions definition\nan opening parenthesis to start a list the function's bodies\n"
    | 280 ->
        "076\na recursive functions definition\na term for the first function's body\n"
    | 282 ->
        "075\na recursive functions definition\na closing parenthesis\n"
    | 284 ->
        "074\na function definition\na symbol for the function's name\n"
    | 285 ->
        "073\na function definition\na closing parenthesis\n"
    | 287 ->
        "072\na sort declaration\na symbol for the sort name\n"
    | 288 ->
        "071\na sort declaration\na numeral for the arity of the sort being declared\n"
    | 289 ->
        "070\na sort declaration\na closing parenthesis\n"
    | 291 ->
        "069\na function declaration\na symbol for the function's name\n"
    | 299 ->
        "142\na list of sorts\nanother sort or a closing parenthesis\n"
    | 319 ->
        "065\na function declaration\na closing parenthesis\n"
    | 321 ->
        "064\na datatypes declaration\na list of sort declaration, starting with an opening parenthesis\n"
    | 322 ->
        "063\na datatypes declaration\na parametric sort declaration of the form \"(symbol num)\"\n"
    | 323 ->
        "141\na datatype arity declaration\na symbol for the datatype name\n"
    | 324 ->
        "140\na datatype arity declaration\na numeral for the datatype arity\n"
    | 325 ->
        "139\na datatype arity declaration\na closing parenthesis\n"
    | 327 ->
        "138\na list of datatype arity declarations\nanother datatype arity declaration, or a closing parenthesis\n"
    | 330 ->
        "062\na datatypes declaration\nan opening parenthesis to start a list of datatype definitions,\none for each of the sorts being declared\n"
    | 331 ->
        "061\na datatypes definition\nan opening parenthesis to start a list of constructors for the first defined datatype\n"
    | 358 ->
        "137\na list of datatype declarations\nanother datatype declaration, or a closing parenthesis\n"
    | 356 ->
        "060\na datatypes declaration\na closing parenthesis\n"
    | 360 ->
        "059\na datatype declaration\na symbol\n"
    | 361 ->
        "058\na datatype declaration\nan opening parenthesis to start the datatype declaration\n"
    | 332 ->
        "136\na datatype declaration\na list of constructor declarations of the form \"(symbol selector*)\",\nor a parameterization of the datatype of the form \"par (sort+)\"\n"
    | 333 ->
        "135\na datatype declaration\nan opening parenthesis to start a list of sort parameters for the datatype\n"
    | 334 ->
        "134\na list of sort variables to parameterize a datatype\na symbol\n"
    | 227 ->
        "133\na list of sort variables to parameterize a datatype\nanother symbol, or a closing parenthesis\n"
    | 336 ->
        "132\na datatype declaration\nan opening parenthesis to start the list of constructors\n"
    | 337 ->
        "131\na datatype declaration\na constructor declaration of the form \"(symbol selector*)\"\n"
    | 349 ->
        "130\na datatype declaration\na closing parenthesis\n"
    | 338 ->
        "129\na constructor declaration\na symbol for the constructor name\n"
    | 339 ->
        "128\na constructor declaration\na selector declaration, of the form \"(selector sort)\", or a closing parenthesis\n"
    | 340 ->
        "127\na selector declaration\na symbol for the selector name\n"
    | 341 ->
        "126\na selector declaration\na sort for the return type of the selector\n"
    | 342 ->
        "125\na selector declaration\na closing parenthesis\n"
    | 344 ->
        "124\na list of selectors\nanother selector of the form \"(selector sort)\", or a closing parenthesis\n"
    | 351 ->
        "123\na list of constructor declarations\nanother constructor declaration of the form \"(constructor selectors*)\",\nor a closing parenthesis\n"
    | 362 ->
        "057\na datatype declaration\na closing parenthesis\n"
    | 364 ->
        "056\na constant declaration\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 365 ->
        "055\na constant declaration\na sort\n"
    | 374 ->
        "054\na constant declaration\na closing parenthesis\n"
    | 101 ->
        "122\na sort\na sort to start a non-empty list of arguments\n"
    | 102 ->
        "121\na list of sorts\na sort, or a closing parenthesis\n"
    | 366 ->
        "120\na parametric or monormorphic constant\nthe keyword par or a sort\n"
    | 376 ->
        "053\na check-sat-assuming command\na list of propositional literals, starting with an opening parenthesis\n"
    | 377 ->
        "052\na list of propositional literals\na propositional literal, i.e. either a symbol or the negation of a symbol\n"
    | 385 ->
        "119\na list of propositional literals\na propositional literal of the form \"symbol\" or \"(not symbol)\"\n"
    | 378 ->
        "117\na propositional literal\nthe \"not\" symbol\n"
    | 380 ->
        "047\na propositional literal\na symbol\n"
    | 381 ->
        "046\na propositional literal\na closing parenthesis\n"
    | 388 ->
        "051\na check-sat-assuming command\na closing parenthesis\n"
    | 390 ->
        "050\na check-sat command\na closing parenthesis\n"
    | 392 ->
        "048\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 401 ->
        "049\nan assertion\na closing parenthesis\n"
    | 168 ->
        "044\na function application\na term as argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 394 ->
        "177\na non-empty list of type variables\nan opening parenthesis\n"
    | 395 ->
        "176\na non-empty list of type variables\na type variable\n"
    | 397 ->
        "175\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 398 ->
        "174\na command\ntwo closing parenthesis\n"
    | 399 ->
        "173\na command\na closing parenthesis\n"
    | 520 ->
        "042\na term\na term construction (identifier, let binding, quantification, ...);\nnote that this expectation if caused by the preceding opening parenthesis\n"
    | 393 ->
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
    | 411 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 412 ->
        "115\na command\na command name\n"
    | 413 ->
        "114\na set-option command\nan attribute of the form \"keyword value?\"\n"
    | 414 ->
        "113\na set-option command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 416 ->
        "112\na set-logic command\na symbol for the logic name\n"
    | 417 ->
        "111\na set-logic command\na closing parenthesis\n"
    | 419 ->
        "110\na set-info command\nan attribute of the form \"keyword value?\"\n"
    | 420 ->
        "109\na set-info command\na closing parenthesis, or an attribute value;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nvalid attribute values, and thus are not allowed here\n"
    | 422 ->
        "108\na reset-assertions command\na closing parenthesis\n"
    | 424 ->
        "107\na reset command\na closing parenthesis\n"
    | 426 ->
        "106\na push command\na numeral\n"
    | 427 ->
        "105\na push command\na closing parenthesis\n"
    | 429 ->
        "104\na pop command\na numeral\n"
    | 430 ->
        "103\na pop command\na closing parenthesis\n"
    | 432 ->
        "102\na get-value command\nan opening parenthesis to start a list of terms\n"
    | 433 ->
        "101\na get-value command\na term\n"
    | 435 ->
        "100\na get-value command\na closing parenthesis\n"
    | 437 ->
        "099\na get-unsat-core command\na closing parenthesis\n"
    | 439 ->
        "098\na get-unsat-assumptions command\na closing parenthesis\n"
    | 441 ->
        "097\na get-proof command\na closing parenthesis\n"
    | 443 ->
        "096\na get-option command\na keyword of the form \":symbol\"\n"
    | 444 ->
        "095\na get-option command\na closing parenthesis\n"
    | 446 ->
        "094\na get-model command\na closing parenthesis\n"
    | 448 ->
        "093\na get-info command\na keyword of the form \":symbol\"\n"
    | 449 ->
        "092\na get-info command\na closing parenthesis\n"
    | 451 ->
        "091\na get-assignment command\na closing parenthesis\n"
    | 453 ->
        "090\na get-assertions command\na closing parenthesis\n"
    | 455 ->
        "089\nan exit command\na closing parenthesis\n"
    | 457 ->
        "088\nan echo command\na string literal\n"
    | 458 ->
        "087\nan echo command\na closing parenthesis\n"
    | 460 ->
        "086\na sort definition\na symbol for the defined sort's name\n"
    | 461 ->
        "085\na sort definition\nan opening parenthesis to start a list of arguments\n"
    | 462 ->
        "084\na sort definition\na closing parenthesis, or a list of symbols for the definition arguments\n"
    | 464 ->
        "083\na sort definition\na sort for the definition body\n"
    | 465 ->
        "082\na sort definition\na closing parenthesis\n"
    | 467 ->
        "081\na recursive function definition\na symbol for the function's name\n"
    | 468 ->
        "080\na recursive function definition\na closing parenthesis\n"
    | 470 ->
        "079\na recursive functions declaration\nan opening parenthesis to start a list of function declaration\n"
    | 471 ->
        "078\na recursive functions definition\na function declaration of the form \"(name (sort*) sort)\",\nor \"(name (par (var+) (sort*) sort))\"\n"
    | 473 ->
        "077\na recursive functions definition\nan opening parenthesis to start a list the function's bodies\n"
    | 474 ->
        "076\na recursive functions definition\na term for the first function's body\n"
    | 476 ->
        "075\na recursive functions definition\na closing parenthesis\n"
    | 478 ->
        "074\na function definition\na symbol for the function's name\n"
    | 479 ->
        "073\na function definition\na closing parenthesis\n"
    | 481 ->
        "072\na sort declaration\na symbol for the sort name\n"
    | 482 ->
        "071\na sort declaration\na numeral for the arity of the sort being declared\n"
    | 483 ->
        "070\na sort declaration\na closing parenthesis\n"
    | 485 ->
        "069\na function declaration\na symbol for the function's name\n"
    | 292 ->
        "068\na function declaration\nan opening parenthesis to start the list of sorts for the function's arguments\n"
    | 293 ->
        "067\na function declaration\na closing parenthesis, or a list of sorts for the arguments of the function\n"
    | 294 ->
        "184\nthe list of type variable of a function declaration\nan opening parenthesis\n"
    | 295 ->
        "183\nthe type variable of a function declaration\na type variable\n"
    | 297 ->
        "182\na function declaration\nan opening parenthesis for starting a possibly empty list of sorts\n"
    | 298 ->
        "181\na function declaration\na sort or a closing parenthesis\n"
    | 302 ->
        "180\na function declaration\nthe return sort\n"
    | 303 ->
        "179\na function declaration\ntwo closing parenthesis\n"
    | 306 ->
        "066\na function declaration\na sort for the return type of the function\n"
    | 486 ->
        "065\na function declaration\na closing parenthesis\n"
    | 488 ->
        "064\na datatypes declaration\na list of sort declaration, starting with an opening parenthesis\n"
    | 489 ->
        "063\na datatypes declaration\na parametric sort declaration of the form \"(symbol num)\"\n"
    | 491 ->
        "062\na datatypes declaration\nan opening parenthesis to start a list of datatype definitions,\none for each of the sorts being declared\n"
    | 492 ->
        "061\na datatypes definition\nan opening parenthesis to start a list of constructors for the first defined datatype\n"
    | 494 ->
        "060\na datatypes declaration\na closing parenthesis\n"
    | 496 ->
        "059\na datatype declaration\na symbol\n"
    | 497 ->
        "058\na datatype declaration\nan opening parenthesis to start the datatype declaration\n"
    | 498 ->
        "057\na datatype declaration\na closing parenthesis\n"
    | 500 ->
        "056\na constant declaration\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 501 ->
        "055\na constant declaration\na sort\n"
    | 510 ->
        "054\na constant declaration\na closing parenthesis\n"
    | 512 ->
        "053\na check-sat-assuming command\na list of propositional literals, starting with an opening parenthesis\n"
    | 513 ->
        "052\na list of propositional literals\na propositional literal, i.e. either a symbol or the negation of a symbol\n"
    | 515 ->
        "051\na check-sat-assuming command\na closing parenthesis\n"
    | 517 ->
        "050\na check-sat command\na closing parenthesis\n"
    | 519 ->
        "048\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 528 ->
        "049\nan assertion\na closing parenthesis\n"
    | 521 ->
        "177\na non-empty list of type variables\nan opening parenthesis\n"
    | 522 ->
        "176\na non-empty list of type variables\na type variable\n"
    | 524 ->
        "175\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 525 ->
        "174\na command\ntwo closing parenthesis\n"
    | 526 ->
        "173\na command\na closing parenthesis\n"
    | 536 ->
        "046\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 540 ->
        "041\nan indexed identifier\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 541 ->
        "040\nan indexed identifier\nan index, i.e. either a numeral, a symbol, or a hexadecimal number;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 94 ->
        "045\nan index list\neither a closing parenthesis, or an index (i.e. a numeral, a symbol,\nor a hexadecimal);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 576 ->
        "044\na function application\na term as argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 169 ->
        "043\na list of terms\neither a closing parenthesis, or another term;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 86 ->
        "042\na term\na term construction (identifier, let binding, quantification, ...);\nnote that this expectation if caused by the preceding opening parenthesis\n"
    | 539 ->
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
    | 544 ->
        "038\na match\na term to match (i.e. the scrutinee of the match)\n"
    | 545 ->
        "037\na match\na match case list, starting with an opening parenthesis\n"
    | 546 ->
        "036\na list of match cases\na match case of the form \"(pattern term)\"\n"
    | 112 ->
        "035\na match case\na pattern, i.e. either a symbol or a datatype pattern of\nthe form \"(symbol symbol+)\";\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 121 ->
        "034\na match case\na term for the case body\n"
    | 122 ->
        "033\na match case\na closing parenthesis to close the match case\n"
    | 130 ->
        "032\na list of match cases\na closing parenthesis or a match case of the form \"(pattern body)\"\n"
    | 548 ->
        "031\na match\na closing parenthesis to close the match\n"
    | 114 ->
        "030\na pattern\na symbol (either a variable or a datatype constructor);\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 115 ->
        "029\narguments of a constructor in a pattern\na symbol to bind the first constructor argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 116 ->
        "028\narguments of a constructor in a pattern\na closing parenthesis, or a symbol to bind the argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 550 ->
        "027\na term\na variable binding list, starting with an opening parenthesis\n"
    | 551 ->
        "026\na term\na variable binding of the form \"(var term)\"\n"
    | 134 ->
        "025\na variable binding\na symbol (i.e. variable name)\n"
    | 135 ->
        "024\na variable binding\na term\n"
    | 136 ->
        "023\na variable binding\na closing parenthesis\n"
    | 138 ->
        "022\na list of variable binding\na closing parenthesis or a variable binding of the form \"(var term)\"\n"
    | 553 ->
        "021\na term\na term (body for the let binding)\n"
    | 554 ->
        "020\na term\na closing parenthesis to end the let binding\n"
    | 556 ->
        "019\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 557 ->
        "018\na term\na sorted variable of the form \"(var sort)\"\n"
    | 146 ->
        "017\na sorted variable\na symbol, i.e. a variable name\n"
    | 147 ->
        "016\na sorted variable\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 148 ->
        "015\na sorted variable\na closing parenthesis\n"
    | 150 ->
        "014\na list of sorted variables\neither a closing parentheis, or a sorted var of the form \"(var sort)\"\n"
    | 559 ->
        "013\na term\na term (body for the universal quantification)\n"
    | 560 ->
        "012\na term\na closing parenthesis to end the universally quantified formula\n"
    | 562 ->
        "011\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 563 ->
        "010\na term\na sorted variable of the form \"(var sort)\"\n"
    | 565 ->
        "009\na term\na term (body for the existencial quantification)\n"
    | 566 ->
        "008\na term\na closing parenthesis to end the existencially quantified formula\n"
    | 568 ->
        "007\na term with attribute\na term\n"
    | 569 ->
        "006\na term\nan attribute of the form \"keyword value\"\n"
    | 166 ->
        "005\nan attribute list\neither a closing parenthesis, or another attribute of the form\n\"keyword value\"\n"
    | 572 ->
        "004\na qualified identifier\nan identifier;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 573 ->
        "003\na qualified identifier\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 574 ->
        "002\na qualified identifier\na closing parenthesis\n"
    | 98 ->
        "001\nan identifier\nan underscore: identifiers starting with an opening parenthesis must be\nindexed identifiers, of the form \"(_ symbol index+)\"\n"
    | _ ->
        raise Not_found
