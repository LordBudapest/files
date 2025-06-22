
(* This file was auto-generated based on "syntax.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 174 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 173 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 172 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 168 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 163 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 159 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 158 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 156 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 154 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 152 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 151 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 148 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 147 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 145 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 144 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 143 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 142 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 141 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 139 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 133 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 119 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 106 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 101 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 99 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 98 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 97 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 95 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 94 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 92 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 91 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 89 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 88 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 84 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 83 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 81 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 80 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 72 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 71 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 67 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 50 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 49 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 44 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 38 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 36 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 35 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 32 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 25 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 24 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 13 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 9 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 8 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 7 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 6 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 5 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 3 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 2 ->
        "<YOUR SYNTAX ERROR MESSAGE HERE>\n"
    | 0 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 170 ->
        "116\nan input statement\nan opening parenthesis to start a command\n"
    | 180 ->
        "046\na term\na term construction (symbol, function application, match, let binding, ...);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 184 ->
        "041\nan indexed identifier\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 185 ->
        "040\nan indexed identifier\nan index, i.e. either a numeral, a symbol, or a hexadecimal number;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 21 ->
        "045\nan index list\neither a closing parenthesis, or an index (i.e. a numeral, a symbol,\nor a hexadecimal);\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot symbols, and thus are not allowed here\n"
    | 220 ->
        "044\na function application\na term as argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 134 ->
        "043\na list of terms\neither a closing parenthesis, or another term;\nnote that keywords and reserved words (such as '_', 'as', ...) are\nnot terms, and thus are not allowed here\n"
    | 183 ->
        "042\na term\na term construction (identifier, let binding, quantification, ...);\nnote that this expectation if caused by the preceding opening parenthesis\n"
    | 14 ->
        "041\nan indexed identifier\na symbol;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 15 ->
        "040\nan indexed identifier\nan index, i.e. either a numeral, a symbol, or a hexadecimal number;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 39 ->
        "039\nan identifier in parentheses\neither an indexed identifier (starting with an underscore)\nor an 'as' type ascription;\nnote that this is because of the preceding opening parenthesis\n"
    | 40 ->
        "004\na qualified identifier\nan identifier.\nNote that keywords (such as '_', 'as', ...) are not identifiers,\nand thus are not allowed here.\n"
    | 41 ->
        "003\na qualified identifier\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords (such as '_', 'as', ...) are none of these, and thus\nare not allowed here.\n"
    | 42 ->
        "002\na qualified identifier\na closing parenthesis\n"
    | 188 ->
        "038\na match\na term to match (i.e. the scrutinee of the match)\n"
    | 189 ->
        "037\na match\na match case list, starting with an opening parenthesis\n"
    | 190 ->
        "036\na list of match cases\na match case of the form \"(pattern term)\"\n"
    | 51 ->
        "035\na match case\na pattern, i.e. either a symbol or a datatype pattern of\nthe form \"(symbol symbol+)\";\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 60 ->
        "034\na match case\na term for the case body\n"
    | 61 ->
        "033\na match case\na closing parenthesis to close the match case\n"
    | 69 ->
        "032\na list of match cases\na closing parenthesis or a match case of the form \"(pattern body)\"\n"
    | 192 ->
        "031\na match\na closing parenthesis to close the match\n"
    | 53 ->
        "030\na pattern\na symbol (either a variable or a datatype constructor);\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 54 ->
        "029\narguments of a constructor in a pattern\na symbol to bind the first constructor argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 55 ->
        "028\narguments of a constructor in a pattern\na closing parenthesis, or a symbol to bind the argument;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nsymbols, and thus are not allowed here\n"
    | 194 ->
        "027\na term\na variable binding list, starting with an opening parenthesis\n"
    | 195 ->
        "026\na term\na variable binding of the form \"(var term)\"\n"
    | 73 ->
        "025\na variable binding\na symbol (i.e. variable name)\n"
    | 74 ->
        "024\na variable binding\na term\n"
    | 75 ->
        "023\na variable binding\na closing parenthesis\n"
    | 77 ->
        "022\na list of variable binding\na closing parenthesis or a variable binding of the form \"(var term)\"\n"
    | 197 ->
        "021\na term\na term (body for the let binding)\n"
    | 198 ->
        "020\na term\na closing parenthesis to end the let binding\n"
    | 200 ->
        "019\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 201 ->
        "018\na term\na sorted variable of the form \"(var sort)\"\n"
    | 10 ->
        "017\na sorted variable\na symbol, i.e. a variable name\n"
    | 11 ->
        "016\na sorted variable\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 30 ->
        "015\na sorted variable\na closing parenthesis\n"
    | 85 ->
        "014\na list of sorted variables\neither a closing parentheis, or a sorted var of the form \"(var sort)\"\n"
    | 203 ->
        "013\na term\na term (body for the universal quantification)\n"
    | 204 ->
        "012\na term\na closing parenthesis to end the universally quantified formula\n"
    | 206 ->
        "011\na term\na list of sorted variables, starting with an opening parenthesis\n"
    | 207 ->
        "010\na term\na sorted variable of the form \"(var sort)\"\n"
    | 209 ->
        "009\na term\na term (body for the existencial quantification)\n"
    | 210 ->
        "008\na term\na closing parenthesis to end the existencially quantified formula\n"
    | 212 ->
        "007\na term with attribute\na term\n"
    | 213 ->
        "006\na term\nan attribute of the form \"keyword value\"\n"
    | 131 ->
        "005\nan attribute list\neither a closing parenthesis, or another attribute of the form\n\"keyword value\"\n"
    | 216 ->
        "004\na qualified identifier\nan identifier;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 217 ->
        "003\na qualified identifier\na sort, i.e. either an identifier, or a sort constructor application;\nnote that keywords and reserved words (such as '_', 'as', ...) are not\nidentifiers, and thus are not allowed here\n"
    | 218 ->
        "002\na qualified identifier\na closing parenthesis\n"
    | 23 ->
        "001\nan identifier\nan underscore: identifiers starting with an opening parenthesis must be\nindexed identifiers, of the form \"(_ symbol index+)\"\n"
    | _ ->
        raise Not_found
