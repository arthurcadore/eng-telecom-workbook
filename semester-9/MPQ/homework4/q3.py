import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Dados do exercício 3
x = np.array([1.37, 3.39, 4.57, 4.71, 7.02, 9.48])
y = np.array([2410, 826, 419, 348, 104, 22])

# Criando DataFrame com os dados
df = pd.DataFrame({"x": x, "y": y})

# Linearização de y
df["y_lin"] = np.log(df["y"])

# Mínimos Quadrados para ln(y) = bx + ln(a)
n = len(df)
sx = df["x"].sum()
sy = df["y_lin"].sum()
sxy = (df["x"] * df["y_lin"]).sum()
sxsq = (df["x"] ** 2).sum()

# Cálculo dos coeficientes
b_mmq = (n * sxy - sx * sy) / (n * sxsq - sx**2)
ln_a = (sy * sxsq - sx * sxy) / (n * sxsq - sx**2)
a = np.exp(ln_a)

print(f"Coeficiente angular (b) = {b_mmq:.4f}")
print(f"Coeficiente linear (ln(a)) = {ln_a:.4f}")
print(f"Constante a = e^(ln(a)) = {a:.4f}")

# Estimativas
df["y_lin_est"] = b_mmq * df["x"] + ln_a
df["y_est"] = np.exp(df["y_lin_est"])

# Mostra a tabela final
print("\nTabela de dados com linearização e estimativas:")
print(df)

# Gráfico da linearização
plt.figure(figsize=(10, 6))
plt.plot(df["x"], df["y_lin"], "o", label="Pontos linearizados", color="blue")
plt.plot(df["x"], df["y_lin_est"], "-", label="Ajuste MMQ", color="red")
plt.title("Ajuste Linear: ln(y) = b·x + ln(a)")
plt.xlabel("x (s)")
plt.ylabel("ln(y) (ln mC)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

# Gráfico da curva original y = a * e^(b x)
plt.figure(figsize=(10, 6))
plt.plot(df["x"], df["y"], "o", label="Pontos experimentais", color="blue")
plt.plot(df["x"], df["y_est"], "-", label="Curva ajustada: y = a·e^(b·x)", color="green")
plt.title("Ajuste exponencial: y = a·e^(b·x)")
plt.xlabel("x (s)")
plt.ylabel("y (mC)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
