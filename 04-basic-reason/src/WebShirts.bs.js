// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Belt_Option = require("rescript/lib/js/belt_Option.js");
var Caml_format = require("rescript/lib/js/caml_format.js");
var Caml_option = require("rescript/lib/js/caml_option.js");
var Caml_js_exceptions = require("rescript/lib/js/caml_js_exceptions.js");

function shirtSizeOfString(str) {
  switch (str) {
    case "L" :
        return /* Large */2;
    case "M" :
        return /* Medium */1;
    case "S" :
        return /* Small */0;
    case "XL" :
        return /* XLarge */{
                _0: 1
              };
    case "XXL" :
        return /* XLarge */{
                _0: 2
              };
    case "XXXL" :
        return /* XLarge */{
                _0: 3
              };
    case "XXXXL" :
        return /* XLarge */{
                _0: 4
              };
    default:
      return ;
  }
}

function price(size) {
  if (typeof size !== "number") {
    return 16.00 + (size._0 - 1 | 0) * 0.50;
  }
  switch (size) {
    case /* Small */0 :
        return 11.00;
    case /* Medium */1 :
        return 12.50;
    case /* Large */2 :
        return 14.00;
    
  }
}

function toInt(s) {
  var result;
  try {
    result = Caml_format.caml_int_of_string(s);
  }
  catch (raw_exn){
    var exn = Caml_js_exceptions.internalToOCamlException(raw_exn);
    if (exn.RE_EXN_ID === "Failure") {
      return ;
    }
    throw exn;
  }
  return result;
}

function getValue(element) {
  return Belt_Option.map(Belt_Option.map(element, (function (prim) {
                    return prim;
                  })), (function (prim) {
                return prim.value;
              }));
}

function calculate(param) {
  var quantity = Belt_Option.flatMap(getValue(Caml_option.nullable_to_opt(document.getElementById("quantity"))), toInt);
  var unitPrice = Belt_Option.map(Belt_Option.flatMap(getValue(Caml_option.nullable_to_opt(document.getElementById("size"))), shirtSizeOfString), price);
  var totalPrice = unitPrice !== undefined && quantity !== undefined ? unitPrice * quantity : undefined;
  var priceString = totalPrice !== undefined ? totalPrice.toFixed(2) : "n/a";
  var __x = document.getElementById("price");
  Belt_Option.map((__x == null) ? undefined : Caml_option.some(__x), (function (__x) {
          __x.innerText = priceString;
          
        }));
  console.log("You clicked me");
  
}

var calcButton = document.getElementById("calculate");

if (!(calcButton == null)) {
  calcButton.addEventListener("click", calculate);
}

var quantity = document.getElementById("quantity");

if (!(quantity == null)) {
  quantity.addEventListener("input", calculate);
}

var size = document.getElementById("size");

if (!(size == null)) {
  size.addEventListener("change", calculate);
}

var D;

var Doc;

var Elem;

var calcButton$1 = (calcButton == null) ? undefined : Caml_option.some(calcButton);

var quantity$1 = (quantity == null) ? undefined : Caml_option.some(quantity);

var size$1 = (size == null) ? undefined : Caml_option.some(size);

exports.D = D;
exports.Doc = Doc;
exports.Elem = Elem;
exports.shirtSizeOfString = shirtSizeOfString;
exports.price = price;
exports.toInt = toInt;
exports.getValue = getValue;
exports.calculate = calculate;
exports.calcButton = calcButton$1;
exports.quantity = quantity$1;
exports.size = size$1;
/* calcButton Not a pure module */
