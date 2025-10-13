
Theorems:
1. A subset $U \subseteq \mathbb{R}^{n}$ is a subset if:
	- U contains the zero vector
	- Closed under additions
	- Closed under scalar multiplication.
2. Null-space
	- N(A) = ${x \in \mathbb{R} : Ax = 0}$ 
	- Basically all the $x$ that turn to zero when plugged into $A$. Subspace of $\mathbb{R}^n$.
	- If A = LU (if it has LU decomposition), then N(A) = N(U).
3. Range
	- R(A) = ${Ax : x \in \mathbb{R}^n}$ 
	- All the possible outputs of our matrix, how far a matrix reaches. Subspace of $\mathbb{R}^m$.
	- If A = LU (if it has LU decomposition), then 
	$$R(A) = span\set{\ell_{1},..., \ell_{r}}$$
	
	- Where $\ell_{1}, ... \ell_{r}$ are the first $r$ columns of $L$. So $L$ is the basis of $R(A)$.
4. Dimension
	- Number of vectors in a basis. For R(A) its the number of linearly independent columns of A this also called Rank. For N(A) its dimension = number of free variables 

Rank-Nullity Theorem
- Theorem --- Let $A$ b an $m*n$ matrix then
- $$dim(R(A)) + dim(N(A)) = n$$

Lecture Notes:
- R(A) = span{ pivot columns in A }
- dim(R(A)) = number of pivot columns

Theorem: Let A in R^{mxn} admit the LU decomposition. A = LU and Rank(A). Then the first r columns of L are the basis of R(A).


Ex: Let A be such that A = LU where

 $$\begin{bmatrix} a_{11} \\ a_{21} \\ a_{31} \\ \end{bmatrix}$$

- Horizontal

$$\begin{bmatrix} a_{11} & a_{12} & a_{13} \end{bmatrix}$$

- Square 5x5

$$
L = 
\begin{bmatrix}

a_{11} & a_{12} & a_{13} & a_{14} & a_{15} \\

a_{21} & a_{22} & a_{23} & a_{24} & a_{25} \\

a_{31} & a_{32} & a_{33} & a_{34} & a_{35} \\

a_{41} & a_{42} & a_{43} & a_{44} & a_{45} \\

a_{51} & a_{52} & a_{53} & a_{54} & a_{55} \\

\end{bmatrix}

$$ 
1. TODO: PRACTICE FINDING NULL SPACE

