// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Caml_option = require("rescript/lib/js/caml_option.js");

function calculate(param) {
  console.log("You clicked me");
  
}

var calcButton = document.getElementById("calculate");

if (!(calcButton == null)) {
  calcButton.addEventListener("click", calculate);
}

var D;

var Doc;

var Elem;

var calcButton$1 = (calcButton == null) ? undefined : Caml_option.some(calcButton);

exports.D = D;
exports.Doc = Doc;
exports.Elem = Elem;
exports.calculate = calculate;
exports.calcButton = calcButton$1;
/* calcButton Not a pure module */