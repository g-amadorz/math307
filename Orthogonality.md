<x, y> = x1y2 + x2y2 + ... + xnyn

1. Matrix Notation <x,y> = x^T y
2. Symmetry: <x,y> = <y,x>
3. Bi-linearity: <x, ay + bz> = a<x, y> + b <x, z>
4. Relation to matrix transpose: <Ax, y> = <x, A^{T} y>
5. Norms: <x,x> = ||x||^2
6. Cauchy-Schwartz: <x, y> <= ||x|| |y||
7. <x,y> = ||x|| ||y||cos$\theta$ 

***
Proof of 4:

<u,u> = u^{T} * u

Left: <Ax, y> = (Ax)^{T} y = x^T A^T y
Right: <x, A^T y> = x^T A^T y

Thus it works

***
More Properties:
1. x and y are orthogonal if <x,y> = 0
2. We say { u_1 ... u_m } in R^N are orthogonal if u_i is orthogonal to u_s for i != s.
3. We say two vectors are ortho-normal when they are orthogonal and unit vectors

Orthogonal Sub-spaces
- Take two sub-spaces U_1 and U_2 such that both are subsets of R^N. We say that these sub-spaces are orthogonal to each other if for every x_1 in U_1 and x_2 in U_2 <x_1, x_2> = 0. So every vector has to be orthogonal to the other.

Orthogonal Complement:
- Let U be a subspace of R^N. The orthogonal complement of U is the set of vectors in R^N that are orthogonal to every vector in U.
- Properties:
	- The orthogonal complement is a subspace
	- dim(U) + dim(U^O) = n
	- (U^O)^O = U
	- 

Fundamental Sub-spaces:
- Let A be m x n matrix. The fundamental sub-spaces of A are N(A), R(A), N(A^T) and R(A^T).
- Theorem: N(A) = R(A^T)^o and R(A) = N(A^T)^o, that is N(A) is equal to the orthogonal complement of R(A^T) and vice versa, R(A) is equal to the orthogonal complement of N(A^T).

*Proof:* 
	Choose N(A). Then Ax = 0, therefore <Ax, y> =  0 for any y and we know that <x, A^T y> = 0, therefore x in orthogonal complement of R(A^T).
	Now let x in orthogonal complement R(A^T). Then <x, A^T y> = 0 so <Ax, y> = 0. Choose y = Ax and then <Ax, Ax> = 0, therefore ||Ax|| = 0 and so Ax = 0 and finally x in N(A).