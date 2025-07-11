import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Dados do exercício 2
x = np.array([1.69, 4.93, 10.97, 28.47, 88.83, 288.00])
y = np.array([3.21, 5.31, 8.23, 15.00, 26.10, 53.80])

# Criando DataFrame inicial
df = pd.DataFrame({"x": x, "y": y})

# Linearização (ln)
df["x_lin"] = np.log(df["x"])
df["y_lin"] = np.log(df["y"])

# Cálculo dos coeficientes pelo MMQ
n = len(df)
sx = df["x_lin"].sum()
sy = df["y_lin"].sum()
sxy = (df["x_lin"] * df["y_lin"]).sum()
sxsq = (df["x_lin"] ** 2).sum()

# Inclinação (n) e intercepto ln(a)
a_mmq = (n * sxy - sx * sy) / (n * sxsq - sx**2)
b_mmq = (sy * sxsq - sx * sxy) / (n * sxsq - sx**2)

# ln(y) = a * ln(x) + b → y = e^b * x^a
a = a_mmq
b = b_mmq
A = np.exp(b)

print(f"Coeficiente angular (n) = {a:.4f}")
print(f"Coeficiente linear (ln(a)) = {b:.4f}")
print(f"Constante a = e^b = {A:.4f}")

print(f"a_mmq = {a_mmq:.4f}, b_mmq = {b_mmq:.4f}")

# Estimativa dos valores de y usando a equação ajustada
df["y_lin_est"] = a * df["x_lin"] + b
df["y_est"] = np.exp(df["y_lin_est"])

# Mostrar a tabela formatada
print("\nTabela de dados com linearização e estimativas:")
print(df)

# Plot log-log
plt.figure(figsize=(10, 6))
plt.plot(df["x_lin"], df["y_lin"], "o", label="Pontos linearizados (ln)", color="blue")
plt.plot(df["x_lin"], df["y_lin_est"], "-", label="Ajuste MMQ", color="red")
plt.title("Ajuste Linear: ln(y) = n·ln(x) + ln(a)")
plt.xlabel("ln(x)")
plt.ylabel("ln(y)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

# Plot original (curva estimada vs valores reais)
plt.figure(figsize=(10, 6))
plt.plot(df["x"], df["y"], "o", label="Pontos experimentais", color="blue")
plt.plot(df["x"], df["y_est"], "-", label="Curva ajustada: y = a·xⁿ", color="green")
plt.title("Ajuste de Potência: y = a·xⁿ")
plt.xlabel("x (h)")
plt.ylabel("y (L)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
