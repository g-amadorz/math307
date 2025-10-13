// Applied Linear Algebra Course Notes Template
// Customize the variables below for each lecture/topic

#let course = "Math 307"
#let lecture_num = "14"
#let topic = "Orthogonal Projections"
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

// #let matright(..aa) = math.mat(delim: "(", ..aa
//   .pos()
//   .map(row => row.map(y => {
//     y
//     [$&$]
//   })))

#let matright(..aa) = math.mat(..aa
  .pos()
  .map(row => row.map(y => {
    y
    v(8mm)
  })))

// ============================================================
// Your notes start here
// ============================================================

=== Orthgonal Projections

- Definition. The projection of a vector $x$ onto vector $u$


$
  "proj"_(u)(x) = frac(ip(x, u), ip(u, u))u
$



- Projections onto $u$ is given by the matrix multiplication

$
  op("proj")_(u)(x) = P(x) "where" P = thin frac(1, norm(u)^(2)) dot u u^T
$

And $P^2 = P, P^T = P$ and rank($P$) = 1

=== Orthogonal Bases


- *Definition*. Let $U subset.eq RR^n$ be a subspace. A set of vectors is an orthgonal basis
  for $U$ if it is a basis for $U$ and the vectors are orthogonal such that they are different
  vectors. Orthonormality also applies to this.

- *Theorem*. If ${u_1, ... , u_m}$ is a basis for the subspace $U subset.eq RR^n$. The Gram-Schmidt
  algorithm constructs an orthogonal basis of $U$:

  $
    v_1 & = u_1 \
    v_2 & = u_2 - op("proj")_(v_1)(u_2) \
    v_3 & = u_3 - op("proj")_(v_1)(u_2) - op("proj")_(v_2)(u_3) \
    v_m & = u_m - op("proj")_(v_1)(u_m) - op("proj")_(v_2)(u_m) - ... - op("proj")_(v_(m-1))(u_m)
  $



=== Projection onto a Subspace
- *Definition* Let $U subset.eq RR^n$ be a subspace and let ${u_1, ..., u_m}$ is an orthogonal basis of $U$.
  We say that the projection of a vector $x$ onto $U$ is

  $
    op("proj")_(U)(x) = frac(ip(x, u_1), ip(u_1, u_1)) dot u_1 + dot dot dot + frac(ip(x, u_m), ip(u_m, u_m)) dot u_m
  $


  We also recall the previous identity of a projection:

  $
    op("proj")_(U)(x) = P(x) "where" P = frac(1, norm(u_1)^2) dot u_1 dot u_1^(T)+ dot dot dot + frac(1, norm(u_m)^2) dot u_m dot u_m^(T)
  $

  Also we can note the properties such as, $P^2 = P, P^T = P "and"$ rank$(P)$ = $m$

  These are key properties of an orthogonal projection matrix this must be true: $P^2 = P$ and $P^T = P$.


  *Theorem*. If $P$ is an orthogonal projection onto $U$, then $I - P$ is the orthogonal projection matrix onto
  $U^(tack.t)$.


=== Projection Theorem

- *Theorem.* Let $U subset.eq RR^n$ be a subspace and let $x in RR^n$. Then

$
  x - op("proj")_U (x) in U^(tack.t)
$

and $op("proj"_U (x))$ is the closest vector in $U$ to x.





=== Examples:
+ *Example* Find the orthogonal matrix $P$ which projects onto the subspace spannes
by the vectors

$
  u_1 =matright(1; 0; -1) && space u_2 = matright(1; 1; 1)
$


This is super easy, we just follow the formula above:

$
  P = frac(1, norm(u_1)^2) dot u_1 u_1^(T) + frac(1, norm(u_2)^2) dot u_2 u_2^(T) \
  P = frac(1, 6) matright(3, 0, -3; 0, 0, 0; -3, 0, 3;) + frac(1, 6) matright(2, 2, 2; 2, 2, 2; 2, 2, 2) \
  P = frac(1, 6) dot matright(5, 2, -1; 2, 2, 2; -1, 2, 5)
$


$
  P = frac(1, norm(u)norm(v)) dot v u^T
$


- *Example:*









