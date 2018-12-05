FROM swipl:7.6.4

EXPOSE 5000

COPY solve.pl /sudoku/solve.pl
COPY server.pl /sudoku/server.pl

WORKDIR /sudoku

CMD ["swipl", "server.pl"]
