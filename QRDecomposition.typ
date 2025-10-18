// Applied Linear Algebra Course Notes Template
// Customize the variables below for each lecture/topic

#let course = "MATH 307"
#let lecture_num = "18"
#let topic = "QR Decomposition"
#let date = datetime.today().display()

// Page setup
#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
  numbering: "1",
)

#set text(
  font: "New Computer Modern",
  size: 12pt,
)

#set par(
  justify: true,
  leading: 0.65em,
)

// Heading styles
#set heading(numbering: "1.1")
#show heading.where(level: 1): it => block(
  above: 1.5em,
  below: 1em,
  text(size: 16pt, weight: "bold", it.body),
)

// Theorem-like environments
#let theorem(title: none, body) = block(
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  fill: rgb("#e8f4f8"),
  stroke: rgb("#0077be") + 1pt,
)[
  #text(weight: "bold", fill: rgb("#0077be"))[
    Theorem#if title != none [ (#title)]
  ]
  #body
]

#let definition(title: none, body) = block(
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  fill: rgb("#f0f8e8"),
  stroke: rgb("#4a7c2e") + 1pt,
)[
  #text(weight: "bold", fill: rgb("#4a7c2e"))[
    Definition#if title != none [ (#title)]
  ]
  #body
]

#let example(body) = block(
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  fill: rgb("#fff8e8"),
  stroke: rgb("#d4a520") + 1pt,
)[
  #text(weight: "bold", fill: rgb("#d4a520"))[Example]
  #body
]

#let note(body) = block(
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  fill: rgb("#f8f8f8"),
  stroke: rgb("#666666") + 1pt,
)[
  #text(weight: "bold")[Note: ]#body
]

// Title
#align(center)[
  #text(size: 18pt, weight: "bold")[#course]

  #text(size: 14pt)[Lecture #lecture_num: #topic]

  #text(size: 10pt, style: "italic")[#date]

  #line(length: 100%, stroke: 0.5pt)
]

#v(1em)

#let ip(..args) = $lr(angle.l #args.pos().join($,$) angle.r, size: #50%)$

#let cvec(..args) = $mat(delim: "[", align: #right, #args.pos().join($ ; $))$

#let matrightsqr(..aa) = math.mat(
  delim: "[",
  ..aa
    .pos()
    .map(row => row.map(y => {
      y
      [$&$]
    })),
)

#let matright(..aa) = math.mat(
  ..aa
    .pos()
    .map(row => row.map(y => {
      y
      v(8mm)
    })),
)

// ============================================================
// Your notes start here
// ============================================================

== Orthogonal Matrices

- _Definition_: A matrix $A$ is *orthgonal* if $A^T A = A A^T = I$.

  $A^T A = I$ implies that the columns of $A$ are orthonormal, and $A A^T$ implies that the rows
  of $A$ are orthonormal.

  - Note $Q^(-1) => Q^(tack.t)$


    Similar computation for rows. To show that $Q dot Q^(tack.t)$

  - _Theorem_: If $A$ is an orthgonal matrix, then $norm(A x) = norm(x), forall x in RR^n$

    - For the proof we can just compute $norm(A x)^2 = (A x)^T dot A x = x^T A^T A x = x^T x = norm(x)^2$

  - A good example of this type of matrix are the reflection and rotation matrices. What we can get from this is that projections
    do not change the length / magnitude.

  - We know that the matrix norm of any orthogonal matrix is 1. $norm(Q) = 1$. Aside, if $Q_1 and Q_2$ are orthogonal than so is $Q_1 dot Q_2$.

  - For projections (NOT Orthogonal), unless the trivial $P=I$. So this is true 99.9% time of the time, orthogonal matrices are invertible while it is not true
    that projections are.

  - Reflections: Let $U subset.eq R^n$ be a subspace. The Reflection of $x in RR^n$ through $U$ is $R x = 2 P x - x$ where $P$ is the projection onto $U$.

    $
      R x = 2 P X - X => R = 2P - I
    $

  - Check
    $
      R dot R^T = (2P - I) (2P - I)^T = (2P - 1) (2P^T - I^T) \
      R dot R^T = (2P - I) (2P - I)^T = (2P - 1) (2P^T - I^T) \
    $

  - To show that a matrix is orthogonal you must show $R dot R^T = I$ and $R^T dot R = I$. Which also implies $Q^(-1) = Q^(tack.t)$.

  - Formula $P = Q dot Q^(tack.t)$ but is $P = I$?


== QR by Gram-Schmidt

- _Definition_: Let $A$ be an $n dot m$ matrix with rank($A$) = $m$ and let $a_1, ..., a_n$ be the columns of A. There exists an orthogonal matrix
  $Q$ and upper triangle matrix $R$ such that $A = Q R$.

  In particular $Q = [Q_1, Q_2] "and" R = vec(R_1, 0)$

  Where Q_1 is n x m, Q2 is n x (n-m), R1 is mxm such that Q1 = [w1, wn] is an orthogonal basis of R(A) constructed by Gram-Schmidt applied to the columns of A
  and Q2 = [w(m+1), wn] is an orthonormal of R(A)^(tack.t). R is mxn

  So if we do the Gram-Schmidt we just get QR automatically, just as if we applied Gaussian elimination on a matrix we just get LU.


  - Example:
    Take $A = Q R$ and $A = Q_1 dot R$ since $Q R = [Q_1, Q_2] dot vec(R_1, 0)$

  *$ A & = Q_1 dot R_1 $*

  We run Gram-Schmidt across the basis columns of R(A) and normalize.

  $$

  We expand these columns in terms of the orthonormal basis, by projecting the columns onto the orthonormal basis.

  $
    a_1 & = ip(w_1, a_1) dot w_1 \
    a_2 & = ip(w_1, a_2) dot w_1 + ip(w_2, a_2) dot w_2 \
    dot \
    dot \
    dot \
    a_n & = ip(w_1, a_n) dot w_1 + ip(w_2, a_n) dot w_2 + dot dot dot + ip(w_n, a_n) dot w_n
  $

  where $a_k in "span"{w_1, ..., w_n}$, and we can write as matrix multiplication

  $
    A = {w_1, ... , w_m} dot matrightsqr(ip(w_1, a_1), ip(w_1, a_2), ..., ip(w_1, a_m); 0, ip(w_2, a_2), ..., ip(w_2, a_m))
  $

  $
    Q_1 = matrightsqr(; w_1 ... w_n; ;) & R_1 & =
  $




== Lecture

