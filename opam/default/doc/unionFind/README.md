# The Union-Find Data Structure in Several Guises

The OCaml library `unionFind` offers two implementations of the union-find
data structure. Both implementations are based on disjoint sets forests, with
path compression and linking-by-rank, so as to guarantee good asymptotic
complexity: every operation requires a quasi-constant number of accesses to
the store.

## Installation

To install the latest released version,
type `opam install unionFind`.

## Documentation

See the [documentation of the latest released
version](http://cambium.inria.fr/~fpottier/unionFind/doc/unionFind).
