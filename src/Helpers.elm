module Helpers exposing (..)

{-| Returns the n first digits after the comma in a float

    >>> nDigits 2 123.45
    "45"

    >>> nDigits 0 125
    ""

    >>> nDigits 1 1.99
    "0"

    >>> nDigits 2 1.0
    "00"

    >>> nDigits 2 -1.0
    "00"
-}


nDigits : Int -> Float -> String
nDigits digits f =
    let
        multiplicator =
            toFloat (10 ^ digits)

        fint =
            (round (f * multiplicator))
    in
        splitIntRec fint []
            |> String.concat
            |> String.right digits
            |> String.padRight digits '0'


{-| Recursive helper to format an integer

    >>> splitIntRec 12345 []
    ["12", "345"]
-}
splitIntRec : Int -> List String -> List String
splitIntRec num tmp =
    if num >= 10 ^ 3 then
        splitIntRec
            (num // 10 ^ 3)
            ((num % 10 ^ 3 |> toString |> String.padLeft 3 '0') :: tmp)
    else
        (toString num) :: tmp