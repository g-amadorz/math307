// Applied Linear Algebra Course Notes Template
// Customize the variables below for each lecture/topic

#let course = "Math 307"
#let lecture_num = "14"
#let topic = "Least Squares Approximation"
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


== Least Squares Approximation
- QR decomposition, meant to find an orthonormal basis for the column space of the column space of $A$.

- Consider $A$ is $n$ x $m$ matrix and rank($A$) = m (and $m >= n$) and let $b in RR$ This is a wide matrix. Then either $A x = b$ has
  a unique solution or no solution. What if there is no solution? We need to find $x$ such that $A x$ is a close to $b$ as possible. Why we do
  Least Square Approximation, (No solution).

- _Definition_ : The least squares approximation of $A x eq.not b$ is $x in RR$ which minimizes $norm(A x - b)$. We can think of this as a projection,
  we are not projecting x

- Note: There are many ways to compute the least squares approximation: Normal equations, $A^T A x = A^T b$, QR decomposition $R_1 x = Q^T b$
  ,SVD $x = A^T b$, or to minimize we can use calculus too, but we care most about the first two for now.

- _Theroem_ (Normal equations) : The least squares approximation of $A x eq.up b$ is the solution of $A^T A x = A^T b$, reminds us of the projection theorem

  _Proof_ (Recall projection theorem)

  - So we know that $A x = "proj"_(R(A) (b))$
  - and $b - A x in R(A)^(tack.t) = N(A^T)$
  - as well as $A^T(b- A x) = 0$
  - finally $A^T A x = A^T b$, so either there is a solution or not

if $A^T A$ $m$x$m$ and let $A^T A != 0$ (Why ? exercise)

- Note: cond($A^T A$) = rank($A$) $=>$ could potentially give errors.

- _Theroem_ (QR equations)

  The least squares approximation is the solution of this system $R_1 x = Q_1^T b$, furthermore the residual, $norm(A x - b) = norm(Q_2^T b)$. We get an upper
  triangular matrix so it's very easy to solve, and the residual is just measuring the error of our QR equation.


  _Proof_ we know from the projection theorem that $A x = "proj"_(R(A)) (b)$. We also know that $Q_1^T dot Q_1 = I$

  $
    A x = "proj"_(R(A)) (b) & = Q_1 dot Q_1^T b \
    Q_1 dot R_1 x & = Q_1 dot Q_1^T b \
    Q_1^T dot Q_1 R_1 x & = Q_1^T dot Q_1 dot Q_1^T b \
    R_1 x & = Q_1^T b \
  $

== Fitting models to Data

- Consider $N+1$ points $(t_0, y_0), ... , (t_N, y_N)$. Choose a linear model $f(t) = c_0 + c_1 t$. Our job is to find $c_0$ and $c$ such that
  $f(t)$ best fits the data.

- Our main job is to minimize the error, we get this formula *PASTE HERE*. We choose the difference to be be squared basically cause the answer is easier to find.





