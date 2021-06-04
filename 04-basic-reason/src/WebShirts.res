module D = Webapi.Dom;
module Doc = Webapi.Dom.Document;
module Elem = Webapi.Dom.Element;


let calculate = (_: Dom.event) : unit => {
  Js.log("You clicked me");
};

let calcButton = Doc.getElementById("calculate", D.document);

switch (calcButton) {
  | Some(element) => D.EventTarget.addEventListener( 
      "click", calculate, Elem.asEventTarget(element))
  | None => ()
};

