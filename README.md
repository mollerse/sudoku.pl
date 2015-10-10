# sudoku.pl

A webserver in Prolog which solves Sudoku (9x9) puzzles.

## Accepted format:

```json
{
  "puzzle": [puzzle]
}
```

Where `puzzle` is a 2-dimensional list which represent the Sudoku board. Use `"?"`
for unknown values. If the puzzle is not solvable you will get an ugly error,
otherwise you will get a solved puzzle. If the puzzle has multiple solutions,
you will only get the first found.

## To start

`prolog -f -q server.pl`

## To use

```
curl -H "Content-type: application/json" -X POST -d [Your puzzle] [server]
```

(or any other means of POSTing data at an url)

Running example at http://sudoku.mornster.net

# License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
