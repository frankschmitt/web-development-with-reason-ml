/* You're familiar handleClick from ReactJS. This mandatorily takes the
payload, then the `self` record, which contains state (none here),
`handle`, `reduce` and other utilities */
let handleClick = (_event) => Js.log("clicked!");

@react.component
let make = (~message) => {
  <div onClick={handleClick}>
    {React.string(message)}
  </div>
}
