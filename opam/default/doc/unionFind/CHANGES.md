# CHANGES

## 2022/01/22

* Strengthen the specification of `merge`. It is now guaranteed that,
  if the user function `f` raises an exception, then the union-find
  data structure is unaffected.

## 2022/01/09

* In `UnionFind` and `UnionFind.Make`, introduce a new operation `merge`,
  a variant of `union` that is parameterized with a join function `f`.
  The function `f` is not allowed to perform reentrant accesses to the
  union-find data structure.

* In `UnionFind` only, introduce an optimization that reduces the amount
  of memory allocation. This leads to a speed improvement of about 10%
  in the micro-benchmark.

## 2022/01/07

* Incompatible changes in the signature `STORE`, which appears in the type of
  the functor `UnionFind.Make`.

  - Instead of having every operation return a possibly-updated store, we
    assume that stores are updated in place. A new `copy` operation is
    introduced, so a persistent store is now simulated by a mutable store that
    can be copied in constant time. The main motivation for this change is
    that it makes `UnionFind.Make` much more pleasant to use in practice.

  - The operation `union` is no longer parameterized with a join function `f`.
    This API was flawed and could lead to meaningless behavior if the function
    `f` provided by the user performed reentrant calls to the union-find
    algorithm.

  - The operation `union` now returns a reference of type `'a rref` instead
    of a unit value. This makes `UnionFind.Make` analogous to `UnionFind`,
    which it was not.

* Expose `find` among the operations offered by `UnionFind.Make`.

* Add `is_representative` to the operations offered by `UnionFind`
  and by `UnionFind.Make`.

* Add a micro-benchmark, which is executed by `make test`.

## 2022/01/01

* Improved documentation.

## 2020/03/20

* Add a fast path (an optimization) in the `find` and `eq` functions, both in
  the basic union-find (`UnionFind`) and the one that is parameterized over a
  store (`UnionFind.Make`).

## 2019/08/27

* Initial release of the package.
