# sudoku.pl

A webserver in Prolog which solves Sudoku (9x9) puzzles.

This project uses [Dictionaries](http://www.swi-prolog.org/pldoc/man?section=dicts) and requires swi-prolog v7.

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

```sh
docker build . --tag sudoku.pl
docker run -d -p 5000:5000 --name sudoku.pl sudoku.pl
```

## To use

```
curl -H "Content-type: application/json" -X POST -d [Your puzzle] localhost:5000
```

(or any other means of POSTing data at an url)

```sh
curl -H "Content-Type: application/json" -X POST -d '{
  "puzzle": [
    [8,"?","?","?","?","?","?","?","?"],
    ["?","?",3,6,"?","?","?","?","?"],
    ["?",7,"?","?",9,"?",2,"?","?"],
    ["?",5,"?","?","?",7,"?","?","?"],
    ["?","?","?","?",4,5,7,"?","?"],
    ["?","?","?",1,"?","?","?",3,"?"],
    ["?","?",1,"?","?","?","?",6,8],
    ["?","?",8,5,"?","?","?",1,"?"],
    ["?",9,"?","?","?","?",4,"?","?"]
  ]
}' localhost:5000
```

Example response:
```js
[
  [8, 1, 2, 7, 5, 3, 6, 4, 9 ],
  [9, 4, 3, 6, 8, 2, 1, 7, 5 ],
  [6, 7, 5, 4, 9, 1, 2, 8, 3 ],
  [1, 5, 4, 2, 3, 7, 8, 9, 6 ],
  [3, 6, 9, 8, 4, 5, 7, 2, 1 ],
  [2, 8, 7, 1, 6, 9, 5, 3, 4 ],
  [5, 2, 1, 9, 7, 4, 3, 6, 8 ],
  [4, 3, 8, 5, 2, 6, 9, 1, 7 ],
  [7, 9, 6, 3, 1, 8, 4, 5, 2 ]
]
```

# License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
