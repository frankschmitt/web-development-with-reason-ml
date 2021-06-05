module D = Webapi.Dom;
module Doc = Webapi.Dom.Document;
module Elem = Webapi.Dom.Element;

// calculate the monthly payment for the given principal, annual percentage rate and number of years
let payment = (~principal, ~apr, ~years) => {
  let r = apr /. 12.0 /. 100.0;
  let n = float_of_int(years * 12);
  let powerTerm = (1.0 +. r) ** n;
  principal *. (r *. powerTerm) /. (powerTerm -. 1.0);
};

// convert a string to an integer
let toInt = (s: string) : option<int> => {
  switch(int_of_string(s)) {
    | result => Some(result)
    | exception(Failure(_)) => None
  }
}

// convert a string to a float
let toFloat = (s: string) : option<float> => {
  switch(float_of_string(s)) {
    | result => Some(result)
    | exception(Failure(_)) => None
  }
}

// get the value of a DOM element
let getValue = (element: option<Elem.t>) : option<string> => {
  element
  -> Belt.Option.map(Elem.unsafeAsHtmlElement)
  -> Belt.Option.map(D.HtmlElement.value)
};

let getIntValue = (elementId: string) : option<int> => {
  getValue(Doc.getElementById(elementId, D.document))
   -> Belt.Option.flatMap(_, toInt);
 };

let getFloatValue = (elementId: string) : option<float> => {
  getValue(Doc.getElementById(elementId, D.document))
   -> Belt.Option.flatMap(_, toFloat);
 };


let updatePayment = (_: Dom.event) : unit => {
  let principal: option<float> = getFloatValue("principal");
  let apr: option<float> = getFloatValue("apr");
  let years: option<int> = getIntValue("years");

  let monthlyPayment = switch(principal, apr, years) {
    | (Some(_principal), Some(_apr), Some(_years)) => Some(payment(~principal=_principal, ~apr=_apr, ~years=_years))
    | _ => None
  };

  let paymentString = switch(monthlyPayment) {
    | Some(p) => Js.Float.toFixedWithPrecision(p, ~digits=2)
    | None => "n/a"
  };

  let _ = Doc.getElementById("payment", D.document) 
    -> Belt.Option.map(_, Elem.setInnerText(_, paymentString));
  Js.log("calculate!");
}

// set event listeners
let principal = Doc.getElementById("principal", D.document);
switch (principal) {
  | Some(element) => D.EventTarget.addEventListener( 
      "input", updatePayment, Elem.asEventTarget(element))
  | None => ()
};
let apr = Doc.getElementById("apr", D.document);
switch (apr) {
  | Some(element) => D.EventTarget.addEventListener( 
      "input", updatePayment, Elem.asEventTarget(element))
  | None => ()
};
let years = Doc.getElementById("years", D.document);
switch (years) {
  | Some(element) => D.EventTarget.addEventListener( 
      "input", updatePayment, Elem.asEventTarget(element))
  | None => ()
};


let calculate = Doc.getElementById("calculate", D.document);
switch (calculate) {
  | Some(element) => D.EventTarget.addEventListener( 
      "click", updatePayment, Elem.asEventTarget(element))
  | None => ()
};
