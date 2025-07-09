import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Constante dos gases
R = 8.314  # J/mol·K

# Dados do exercício 4
T = np.array([263.2, 273.1, 293.2, 313.1, 333.1, 353.2])  # Temperatura em K
P = np.array([2.149, 4.579, 14.532, 50.218, 149.381, 355.239])  # Pressão em mmHg

# DataFrame com os dados
df = pd.DataFrame({"T (K)": T, "P (mmHg)": P})

# Transformações para linearização
df["1/T"] = 1 / df["T (K)"]
df["ln(P)"] = np.log(df["P (mmHg)"])

# Mínimos Quadrados: ln(P) = ln(P0) - (λ/R)(1/T)
n = len(df)
sx = df["1/T"].sum()
sy = df["ln(P)"].sum()
sxy = (df["1/T"] * df["ln(P)"]).sum()
sxsq = (df["1/T"] ** 2).sum()

# Cálculo dos coeficientes
b = (n * sxy - sx * sy) / (n * sxsq - sx**2)
a = (sy * sxsq - sx * sxy) / (n * sxsq - sx**2)

# Coeficientes físicos
lambda_ = -b * R
P0 = np.exp(a)

print(f"Coeficiente angular (b) = {b:.4f}")
print(f"Coeficiente linear ln(P0) = {a:.4f}")
print(f"P0 = e^a = {P0:.4f} mmHg")
print(f"Lambda (λ) = {-b:.4f} × R = {lambda_:.4f} J/mol")

# Estimativas
df["ln(P)_est"] = a + b * df["1/T"]
df["P_est"] = np.exp(df["ln(P)_est"])

# Tabela com resultados
print("\nTabela com transformações e estimativas:")
print(df)

# Gráfico linearizado
plt.figure(figsize=(10, 6))
plt.plot(df["1/T"], df["ln(P)"], "o", label="Pontos linearizados", color="blue")
plt.plot(df["1/T"], df["ln(P)_est"], "-", label="Ajuste MMQ", color="red")
plt.title("Linearização: ln(P) = ln(P0) - λ/(R·T)")
plt.xlabel("1/T (1/K)")
plt.ylabel("ln(P) (ln mmHg)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

# Gráfico P vs T com curva estimada
plt.figure(figsize=(10, 6))
plt.plot(df["T (K)"], df["P (mmHg)"], "o", label="Pontos experimentais", color="blue")
plt.plot(df["T (K)"], df["P_est"], "-", label="Curva estimada", color="green")
plt.title("Pressão vs Temperatura: P = P0·e^(-λ/(RT))")
plt.xlabel("Temperatura (K)")
plt.ylabel("Pressão (mmHg)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
