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

let price = (size: option<shirtSize>) : option<float> => {
  switch (size) {
    | Some(Small) => Some(11.00)
    | Some(Medium) => Some(12.50)
    | Some(Large) => Some(14.00)
    | Some(XLarge(n)) => Some(16.00 +. (float_of_int(n - 1) *. 0.50))
    | None => None
  }
};

let displayPrice = (input: string) : unit => {
  let size = shirtSizeOfString(input);
  let amount = price(size);
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

Js.log(price(shirtSizeOfString("S")));
Js.log(price(shirtSizeOfString("XXL")));

displayPrice("S");
displayPrice("XL");

