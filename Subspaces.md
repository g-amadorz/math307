
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


Lecture Notes:
- R(A) = span{ pivot columns in A }
- dim(R(A)) = number of pivot columns


