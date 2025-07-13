import xml.etree.ElementTree as ET
import folium
from geopy.distance import geodesic  # pip install geopy
import re
from collections import defaultdict

# Caminho para o arquivo KML
kml_path = './doc.kml'

# Parse do arquivo KML
namespace = {'kml': 'http://www.opengis.net/kml/2.2'}
tree = ET.parse(kml_path)
root = tree.getroot()

points = []
caixa_de_emenda_fusao = {"X0002", 
                         "X0004", 
                         "X0012",
                         "X0019",
                         "X0025",
                         "X0030",
                         "R0006",
                         "R0015",
                         "R0020"
}
caixa_de_emenda_conectorizada = {
                                 "D0007", 
                                 "D0011", 
                                 "D0014",
                                 "D0016",    
                                 "C0007",
                                 "C0011",
                                 "C0014",
                                 "C0018",
                                 "B0006",
                                 "B0012",
                                 "B0016",
                                 "B0020",
                                 "A0007",
                                 "A0013",
                                 "A0016",
                                 "A0021",
                                 "E0005",
                                 "E0008",
                                 "E0011",
                                 "E0016",
                                 "F0020",
                                 "F0016",
                                 "F0012",
                                 "F0007",
                                 "G0007",
                                 "G0011",
                                 "G0013",
                                 "G0016",
                                 "H0006",
                                 "H0012",
                                 "H0017",
                                 "H0021"
}
m = folium.Map(location=[0, 0], zoom_start=15)

# --- Lê os pontos e plota marcadores ---
for placemark in root.iterfind('.//{http://www.opengis.net/kml/2.2}Placemark'):
    name_elem = placemark.find('{http://www.opengis.net/kml/2.2}name')
    name = name_elem.text if name_elem is not None else 'Sem nome'

    point_elem = placemark.find('.//{http://www.opengis.net/kml/2.2}Point')
    if point_elem is not None:
        coord_elem = point_elem.find('{http://www.opengis.net/kml/2.2}coordinates')
        if coord_elem is not None:
            coords = coord_elem.text.strip().split(',')
            if len(coords) >= 2:
                try:
                    lon, lat = float(coords[0]), float(coords[1])
                    points.append({'name': name, 'lat': lat, 'lon': lon})

                    name_clean = name.strip().upper()
                    is_pop = name_clean == "POP"

                    # Determinar cor do marcador
                    if name_clean in caixa_de_emenda_fusao:
                        color = "red"
                    elif name_clean in caixa_de_emenda_conectorizada:
                        color = "deeppink"  # ou "hotpink", ou "magenta"
                    elif is_pop:
                        color = "green"
                    else:
                        color = "blue"

                    folium.CircleMarker(
                        location=[lat, lon],
                        radius=8 if is_pop else 5,
                        color=color,
                        fill=True,
                        fill_color=color,
                        fill_opacity=1,
                        popup=f"{name}<br>({lat}, {lon})"
                    ).add_to(m)

                    folium.Marker(
                        location=[lat, lon],
                        icon=folium.DivIcon(
                            html=f"""
                            <div style="
                                font-size: 12px;
                                font-weight: bold;
                                color: black;
                                text-shadow: 1px 1px 2px white;
                                white-space: nowrap;
                                transform: translate(10px, -10px);
                            ">
                                {name}
                            </div>
                            """
                        )
                    ).add_to(m)

                except ValueError:
                    pass

# --- Agrupar por prefixo alfabético ---
def get_prefix(name):
    match = re.match(r"([A-Za-z]+)", name)
    return match.group(1) if match else ""

groups = defaultdict(list)
for p in points:
    prefix = get_prefix(p["name"])
    groups[prefix].append(p)

# --- Conectar pontos dentro de cada grupo ---
for prefix, group_points in groups.items():
    sorted_group = sorted(group_points, key=lambda x: x['name'])
    for i in range(len(sorted_group) - 1):
        p1 = sorted_group[i]
        p2 = sorted_group[i + 1]
        coord1 = (p1['lat'], p1['lon'])
        coord2 = (p2['lat'], p2['lon'])
        dist_km = geodesic(coord1, coord2).kilometers

        folium.PolyLine(
            [coord1, coord2],
            color='black',
            weight=2,
        ).add_to(m)

        mid_lat = (p1['lat'] + p2['lat']) / 2
        mid_lon = (p1['lon'] + p2['lon']) / 2
        folium.Marker(
            [mid_lat, mid_lon],
            icon=folium.DivIcon(
                html=f"""
                <div style="
                    font-size: 12px;
                    color: black;
                    padding: 4px 6px;
                    text-align: center;
                ">
                    {dist_km:.2f}
                </div>
                """
            )
        ).add_to(m)

# --- Conexões manuais ---
manual_pairs = [
    ("R0015", "O0001"),
    ("R0015", "G0001"),
    ("R0020", "P0001"),
    ("R0020", "H0001"),
    ("R0006", "N0001"),
    ("R0006", "F0001"),
    ("R0001", "X0004"),
    ("X0004", "M0001"),
    ("X0002", "E0001"),
    ("X0012", "D0001"),
    ("X0012", "L0001"),
    ("X0019", "C0001"),
    ("X0019", "K0001"),
    ("X0025", "J0001"),
    ("X0025", "B0001"),
    ("X0030", "A0001"),
    ("X0030", "I0001"),
    ("X0001", "POP"),
]

# Mapeia nomes para coordenadas para acesso rápido
points_dict = {p["name"]: p for p in points}

for name1, name2 in manual_pairs:
    if name1 in points_dict and name2 in points_dict:
        p1 = points_dict[name1]
        p2 = points_dict[name2]
        coord1 = (p1['lat'], p1['lon'])
        coord2 = (p2['lat'], p2['lon'])
        dist_km = geodesic(coord1, coord2).kilometers

        folium.PolyLine(
            [coord1, coord2],
            color='black',
            weight=2,
            dash_array="5, 5"
        ).add_to(m)

        mid_lat = (p1['lat'] + p2['lat']) / 2
        mid_lon = (p1['lon'] + p2['lon']) / 2
        folium.Marker(
            [mid_lat, mid_lon],
            icon=folium.DivIcon(
                html=f"""
                <div style="
                    font-size: 12px;
                    color: black;
                    padding: 4px 6px;
                    white-space: nowrap;
                    text-align: center;
                ">
                    {dist_km:.2f}
                </div>
                """
            )
        ).add_to(m)
    else:
        print(f"[AVISO] Um dos pontos não foi encontrado: {name1}, {name2}")



for placemark in root.iterfind('.//{http://www.opengis.net/kml/2.2}Placemark'):
    name_elem = placemark.find('{http://www.opengis.net/kml/2.2}name')
    name = name_elem.text if name_elem is not None else 'Sem nome'

    # --- PONTO ---
    point_elem = placemark.find('.//{http://www.opengis.net/kml/2.2}Point')
    if point_elem is not None:
        coord_elem = point_elem.find('{http://www.opengis.net/kml/2.2}coordinates')
        if coord_elem is not None:
            coords = coord_elem.text.strip().split(',')
            if len(coords) >= 2:
                try:
                    lon, lat = float(coords[0]), float(coords[1])
                    points.append({'name': name, 'lat': lat, 'lon': lon})

                    # marcador do ponto
                    # ... [como já está feito acima]
                except ValueError:
                    pass
        continue  # volta ao loop para o próximo Placemark

    # --- LINHA ---
    line_elem = placemark.find('.//{http://www.opengis.net/kml/2.2}LineString')
    if line_elem is not None:
        coord_elem = line_elem.find('{http://www.opengis.net/kml/2.2}coordinates')
        if coord_elem is not None:
            coords_raw = coord_elem.text.strip().split()
            line_coords = []
            for c in coords_raw:
                try:
                    lon, lat, *_ = map(float, c.strip().split(','))
                    line_coords.append([lat, lon])
                except ValueError:
                    continue
            if line_coords:
                folium.PolyLine(
                    line_coords,
                    color='red',
                    weight=2,
                    popup=name
                ).add_to(m)
        continue

    # --- POLÍGONO ---
    polygon_elem = placemark.find('.//{http://www.opengis.net/kml/2.2}Polygon')
    if polygon_elem is not None:
        coord_elem = polygon_elem.find('.//{http://www.opengis.net/kml/2.2}coordinates')
        if coord_elem is not None:
            coords_raw = coord_elem.text.strip().split()
            poly_coords = []
            for c in coords_raw:
                try:
                    lon, lat, *_ = map(float, c.strip().split(','))
                    poly_coords.append([lat, lon])
                except ValueError:
                    continue
            if poly_coords:
                folium.Polygon(
                    poly_coords,
                    color='green',
                    fill=True,
                    fill_opacity=0.2,
                    popup=name
                ).add_to(m)

# --- Reposiciona centro do mapa ---
if points:
    avg_lat = sum(p['lat'] for p in points) / len(points)
    avg_lon = sum(p['lon'] for p in points) / len(points)
    m.location = [avg_lat, avg_lon]
    m.zoom_start = 15

# --- Salvar ---
m.save('mapa_kml.html')
print('Mapa gerado: mapa_kml.html')

import networkx as nx

# --- Construir grafo com manual_pairs + conexões por prefixo ---
G = nx.Graph()

# Adiciona conexões por prefixo
for prefix, group_points in groups.items():
    sorted_group = sorted(group_points, key=lambda x: x['name'])
    for i in range(len(sorted_group) - 1):
        p1 = sorted_group[i]['name']
        p2 = sorted_group[i + 1]['name']
        coord1 = (points_dict[p1]['lat'], points_dict[p1]['lon'])
        coord2 = (points_dict[p2]['lat'], points_dict[p2]['lon'])
        dist = geodesic(coord1, coord2).kilometers
        G.add_edge(p1, p2, weight=dist)

# Adiciona conexões manuais
for a, b in manual_pairs:
    if a in points_dict and b in points_dict:
        coord_a = (points_dict[a]['lat'], points_dict[a]['lon'])
        coord_b = (points_dict[b]['lat'], points_dict[b]['lon'])
        dist = geodesic(coord_a, coord_b).kilometers
        G.add_edge(a, b, weight=dist)

# --- Formata nome com rótulo ---
def formatar_nome(nome):
    if nome in caixa_de_emenda_fusao:
        return f"CF({nome})"
    elif nome in caixa_de_emenda_conectorizada:
        return f"CC({nome})"
    else:
        return nome

# --- Caixas finais desejadas ---
ultima_caixa = {
    "A0021", "B0020", "C0018", "D0016", "E0016", "F0020", "G0016", "H0021"
}

# --- Gerar caminhos do POP até cada CC ---
saida_linhas = []

for cc in caixa_de_emenda_conectorizada:
    if cc not in G or "POP" not in G:
        continue
    if cc not in ultima_caixa:
        continue  # Pula caixas que não são finais
    try:
        caminho = nx.shortest_path(G, source="POP", target=cc, weight='weight')
        caminho_formatado = [formatar_nome(caminho[0])]

        for i in range(1, len(caminho)):
            nome_ant = caminho[i - 1]
            nome_atual = caminho[i]
            coord1 = (points_dict[nome_ant]['lat'], points_dict[nome_ant]['lon'])
            coord2 = (points_dict[nome_atual]['lat'], points_dict[nome_atual]['lon'])
            dist = geodesic(coord1, coord2).kilometers
            caminho_formatado.append(f"{dist:.2f}")
            caminho_formatado.append(formatar_nome(nome_atual))

        linha = " - ".join(caminho_formatado)
        saida_linhas.append(linha)

    except nx.NetworkXNoPath:
        print(f"Sem caminho entre POP e {cc}")

# --- Exportar resultado ---
with open("caminhos.txt", "w") as f:
    for linha in saida_linhas:
        f.write(linha + "\n")

print("Arquivo 'caminhos.txt' gerado com sucesso.")
