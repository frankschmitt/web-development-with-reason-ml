let qty = 8;
let price = 11.5;

let discount = (qty < 10) ? 0.05 : 0.10;

let total = float_of_int(qty) *. price;
let discountPrice = total *. (1.0 -. discount);

/* bad unicode - string enclosed in "" */
Js.log2("The total price is €", total);

/* good Unicode - string enclosed in ... */ 
Js.log({js|The discount price is €|js} ++ Js.Float.toString(discountPrice)); 
