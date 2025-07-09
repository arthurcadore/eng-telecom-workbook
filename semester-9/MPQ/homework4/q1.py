import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Dados
df = pd.DataFrame(
    {
        "x(cm)": [4.00, 6.71, 9.43, 12.18, 14.87, 17.70],
        "t(s)": [0.00, 1.00, 2.00, 3.00, 4.00, 5.00],
    }
)

# Reorganiza colunas
df["x"] = df["t(s)"]
df["y"] = df["x(cm)"]

# Mínimos quadrados
n = df.shape[0]
sx = df["x"].sum()
sy = df["y"].sum()
sxsq = (df["x"] ** 2).sum()
sxy = (df["x"] * df["y"]).sum()

a = (n * sxy - sx * sy) / (n * sxsq - sx**2)
b = (sy * sxsq - sx * sxy) / (n * sxsq - sx**2)

print(f"a = {a:.4f}, b = {b:.4f}")

df["y_mmq"] = a * df["x"] + b

# Reta entre dois pontos (geometria)
al = (df["y"].iloc[2] - df["y"].iloc[1]) / (df["x"].iloc[2] - df["x"].iloc[1])
bl = df["y"].iloc[1] - al * df["x"].iloc[1]

print(f"a' = {al:.4f}, b' = {bl:.4f}")

df["y_geom"] = al * df["x"] + bl

# Plot
plt.figure(figsize=(10, 6))
plt.plot(df["x"], df["y"], "o", label="Pontos originais", color="blue")
plt.plot(df["x"], df["y_mmq"], "-", label="Ajuste MMQ", color="red")
plt.plot(df["x"], df["y_geom"], "--", label="Reta entre 2 pontos", color="magenta")
plt.title("Ajuste de reta aos dados")
plt.xlabel("Tempo (s)")
plt.ylabel("Distância (cm)")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
