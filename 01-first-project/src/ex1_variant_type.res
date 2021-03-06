type shirtSize = 
  | Small
  | Medium
  | Large
  | XLarge (int);

let price = (size: shirtSize) : float => {
  switch (size) {
    | Small => 11.00
    | Medium => 12.00
    | Large => 13.00
    | XLarge(n) => 16.00 +. (float_of_int(n - 1) *. 0.50)
  }
};

// simple union type for handling colour specs
type colourSpec = 
  | White
  | Black
  | Grey (float) /* Percentage grey as float */
  | RGB (int, int, int);

// convert a colourSpec to its String representation
let stringOfColourSpec = (cspec: colourSpec) : string => {
  switch (cspec) {
    | White => "rgb(255, 255, 255)"
    | Black => "rgb(0, 0, 0)"
    | Grey(f) => {
                    let s = Belt.Int.toString(int_of_float(255.0 *. f)); 
                    "rgb(" ++ s ++ "," ++ s ++ "," ++ s ++ ")"
                 }
    | RGB (r,g,b) => "rgb(" ++ Belt.Int.toString(r) ++ "," ++ Belt.Int.toString(g) ++ "," ++ Belt.Int.toString(b) ++ ")"
  }
}; 

// parse a colourSpec from a string
// for invalid colour specs, White is returned
let colourSpecOfString = (s: string) : colourSpec => {
  switch (s) {
    | "White" => White
    | "Black" => Black
    | s => let r = %re("/Grey\(([.0-9]+)\)/g")
           switch Js.Re.exec_(r, s) {
             |Some(m) => let m0 = Js.Re.captures(m)[0]
                         // TODO this is ugly and doesn't work properly - debug, write in pipe style 
                         Js.Option.getWithDefault(Black, Js.Nullable.toOption(Js.Nullable.bind(m0, (. match0) => Grey(Js.Option.getWithDefault(0.0, Belt.Float.fromString(match0))))))
             |None    => Black
           }
    // TODO: handle Grey + RGB
  }
};

// DEMO CODE - MAIN
// colourSpec -> string
Js.log("----------------------- colourSpec -> string --------------------------");
Js.log("White = " ++ stringOfColourSpec(White));
Js.log("Black = " ++ stringOfColourSpec(Black));
Js.log("Grey(0.7) = " ++ stringOfColourSpec(Grey(0.7)));
Js.log("RGB(100,150,200) = " ++ stringOfColourSpec(RGB(100,150,200)));
// string -> colourSpec
Js.log("----------------------- string -> colourSpec --------------------------");
Js.log("White = " ++ stringOfColourSpec(colourSpecOfString("White")));
Js.log("Black = " ++ stringOfColourSpec(colourSpecOfString("Black")));
Js.log("Grey(0.3) = " ++ stringOfColourSpec(colourSpecOfString("Grey(0.3)")));
Js.log("RGB(10,20,30) = " ++ stringOfColourSpec(colourSpecOfString("RGB(10,20,30")));
