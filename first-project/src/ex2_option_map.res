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

let price = (size: shirtSize) : float => {
  switch (size) {
    | Small => 11.00
    | Medium => 12.50
    | Large => 14.00
    | XLarge(n) => 16.00 +. (float_of_int(n - 1) *. 0.50)
  }
};

let displayPrice = (input: string) : unit => {
  // combining the pipe operator -> with Option.map / Option.flatMap allows us to write quite elegant code
  let amount = 
    shirtSizeOfString(input)
    -> Belt.Option.map(_, price)
  let text = switch(amount) {
    | Some(cost) => {
        let costStr = Js.Float.toString(cost)
        "Your " ++ input ++ " shirt costs EUR " ++ costStr 
      }
    | None => "Cannot determine price for " ++ input
  };
  Js.log(text);
};

/* let oneOver = Belt.Option.flatMap(x, f);
   let result = Belt.Option.map(oneOver, cube);
   toFloat(input)
   -> Belt.Option.flatMap(_, reciprocal)
   -> Belt.Option.map(_, cube)
 */

displayPrice("S");
displayPrice("XL");
displayPrice("XS");

