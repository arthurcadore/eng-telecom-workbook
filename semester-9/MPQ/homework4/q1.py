import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Dados fornecidos
tempo = np.array([0.00, 1.00, 2.00, 3.00, 4.00, 5.00])
posicao = np.array([4.00, 6.71, 9.43, 12.18, 14.87, 17.70])

# Criação do DataFrame
df = pd.DataFrame({"tempo_s": tempo, "posicao_cm": posicao})

# Redefine variáveis para o ajuste
df["x"] = df["tempo_s"]
df["y"] = df["posicao_cm"]

# Mínimos quadrados para y = a·x + b
n = len(df)
sx = df["x"].sum()
sy = df["y"].sum()
sxy = (df["x"] * df["y"]).sum()
sxsq = (df["x"] ** 2).sum()

a = (n * sxy - sx * sy) / (n * sxsq - sx**2)
b = (sy * sxsq - sx * sxy) / (n * sxsq - sx**2)

# Estimativa y = a·x + b
df["y_est"] = a * df["x"] + b

print(f"Coeficiente angular (a) = {a:.4f} cm/s")
print(f"Coeficiente linear (b) = {b:.4f} cm")

# Mostra a tabela com estimativas
print("\nTabela de dados e ajuste:")
print(df)

# Comparação com reta entre dois pontos (geométrica)
a_geom = (df["y"].iloc[2] - df["y"].iloc[1]) / (df["x"].iloc[2] - df["x"].iloc[1])
b_geom = df["y"].iloc[1] - a_geom * df["x"].iloc[1]
df["y_geom"] = a_geom * df["x"] + b_geom

print(f"\nReta entre 2 pontos: a' = {a_geom:.4f}, b' = {b_geom:.4f}")

# Gráfico com ajuste por MMQ e reta entre dois pontos
plt.figure(figsize=(10, 6))
plt.plot(df["x"], df["y"], "o", label="Pontos experimentais", color="blue")
plt.plot(df["x"], df["y_est"], "-", label="Ajuste MMQ", color="red")
plt.plot(df["x"], df["y_geom"], "--", label="Reta entre 2 pontos", color="magenta")
plt.title("Ajuste linear: y = a·x + b")
plt.xlabel("Tempo (s)")
plt.ylabel("Posição (cm)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
