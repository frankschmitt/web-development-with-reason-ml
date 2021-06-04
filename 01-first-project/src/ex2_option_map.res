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

let makeDisplayText = (input: string, costStr: string) : string => {
  "Your " ++ input ++ " shirt costs EUR " ++ costStr 
}

let displayPrice = (input: string) : unit => {
  // combining the pipe operator -> with Option.map / Option.flatMap allows us to write quite elegant code
  // flatMap expects a function that returns an option<'a>, and map expects a "plain" function that returns 'a
  let text = 
    shirtSizeOfString(input)
    -> Belt.Option.map(_, price)
    -> Belt.Option.map(_, Js.Float.toString)
    -> Belt.Option.map(_, makeDisplayText(input))
    -> Js.Option.getWithDefault("Cannot determine price for " ++ input, _)
  Js.log(text);
};

displayPrice("S");
displayPrice("XL");
displayPrice("XS");

