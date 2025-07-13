import xml.etree.ElementTree as ET
import folium

# Caminho para o arquivo KML
kml_path = './doc.kml'

# Parse do arquivo KML
namespace = {'kml': 'http://www.opengis.net/kml/2.2'}
tree = ET.parse(kml_path)
root = tree.getroot()

# Lista de pontos (apenas <Point>)
points = []

# Cria o mapa com centro provisório
m = folium.Map(location=[0, 0], zoom_start=2)

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

                    # Verifica se é "POP" e define estilo especial
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

                    # Nome ao lado do ponto
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
        continue

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

# Reposiciona o centro do mapa se houver pontos
if points:
    avg_lat = sum(p['lat'] for p in points) / len(points)
    avg_lon = sum(p['lon'] for p in points) / len(points)
    m.location = [avg_lat, avg_lon]
    m.zoom_start = 15  # ou ajuste conforme o seu uso

# Salva o resultado
m.save('mapa_kml.html')
print('Mapa gerado: mapa_kml.html')
