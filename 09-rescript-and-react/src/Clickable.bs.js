// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function handleClick(_event) {
  console.log("clicked!");
  
}

function Clickable(Props) {
  var message = Props.message;
  return React.createElement("div", {
              onClick: handleClick
            }, message);
}

var make = Clickable;

export {
  handleClick ,
  make ,
  
}
/* react Not a pure module */
