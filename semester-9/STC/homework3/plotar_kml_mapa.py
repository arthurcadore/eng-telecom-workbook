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
m = folium.Map(location=[0, 0], zoom_start=2)

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

                    is_pop = name.strip().upper() == "POP"

                    folium.CircleMarker(
                        location=[lat, lon],
                        radius=8 if is_pop else 3,
                        color='red' if is_pop else 'blue',
                        fill=True,
                        fill_color='red' if is_pop else 'blue',
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
    ("R0001", "M0001"),
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
