module D = Webapi.Dom;
module Doc = Webapi.Dom.Document;
module Elem = Webapi.Dom.Element;


type shirtSize =
  | Small
  | Medium
  | Large
  | XLarge(int);

let shirtSizeOfString = (str: string) : option<shirtSize> => {
  switch(str) {
    | "S" => Some(Small)
    | "M" => Some(Medium)
    | "L" => Some(Large)
    | "XL" => Some(XLarge(1))
    | "XXL" => Some(XLarge(2))
    | "XXXL" => Some(XLarge(3))
    | "XXXXL" => Some(XLarge(4))
    | _ => None
  }
};

// calculate the price for the given shirt size
let price = (size: shirtSize) : float => {
  switch (size) {
    | Small => 11.00
    | Medium => 12.50
    | Large => 14.00
    | XLarge(n) => 16.00 +. (float_of_int(n - 1) *. 0.50)
  }
};

// convert a string to an integer
let toInt = (s: string) : option<int> => {
  switch(int_of_string(s)) {
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

// calculate the price for the given size and quantity
let calculate = (_: Dom.event) : unit => {
  let quantity: option<int> = getValue(Doc.getElementById("quantity", D.document))
   -> Belt.Option.flatMap(_, toInt);

  let unitPrice: option<float> = getValue(Doc.getElementById("size", D.document))
    -> Belt.Option.flatMap(_, shirtSizeOfString)
    -> Belt.Option.map(_, price);

  let totalPrice = switch(unitPrice, quantity) {
    | (Some(uPrice), Some(qty)) => Some(uPrice *. float_of_int(qty))
    | _ => None
  };

  let priceString = switch(totalPrice) {
    | Some(total) => Js.Float.toFixedWithPrecision(total, ~digits=2)
    | None => "n/a"
  };

  let _ = Doc.getElementById("price", D.document) 
    -> Belt.Option.map(_, Elem.setInnerText(_, priceString));

  Js.log("You clicked me");
};

// set event handlers
let calcButton = Doc.getElementById("calculate", D.document);
switch (calcButton) {
  | Some(element) => D.EventTarget.addEventListener( 
      "click", calculate, Elem.asEventTarget(element))
  | None => ()
};

