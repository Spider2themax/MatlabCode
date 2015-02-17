function Pn1 = GetNewP(n, Pn)

Pn1 = Pn^(n+2) + (n+2)*Pn^(n+1)*(1-Pn);