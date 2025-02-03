#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Compressão e Descompressão 
com Algoritmo de Huffman",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "01 de Dezembro de 2024",
  doc,
)

= Introdução 

Neste relatório, será apresentado um estudo sobre o algoritmo de Huffman, incluindo a leitura de um arquivo de texto, a contagem de ocorrências de cada caractere, a análise dos caracteres contidos no arquivo, o cálculo do percentual de cada caractere, a criação de uma Função de Massa de Probabilidade (PMF), a aplicação do algoritmo de Huffman sobre o texto, a codificação do texto e a análise do arquivo codificado.

O algoritmo de Huffman é um método de compressão de dados que utiliza a codificação de caracteres para reduzir o tamanho de um arquivo. O algoritmo foi desenvolvido por David A. Huffman em 1952, e é amplamente utilizado em sistemas de comunicação e armazenamento de dados.

= Compressão Huffmann 

== Leitura do arquivo 

Inicialmente, deve-se coletar todos os caracteres contidos no arquivo de texto. Para isso, é necessário realizar a leitura do arquivo e contar a quantidade de ocorrências de cada caractere. Isso é executado através do código abaixo:

#sourcecode[```python
# Reed the file and count the number of occurrences of each character
with open("alice.txt", "r", encoding="utf-8") as file:
    # Ler o arquivo
    text = file.read()
    
    # Create a variable to store the characters and their occurrences
    characters = {}

    for char in text:
        # Check if the character is on the variable
        if char in characters:
            # Increment the character
            characters[char] += 1
        else:
            # Add the character to the variable and set it to 1
            characters[char] = 1
    
    # Order the characters
    sorted_letters = sorted(characters.items())

# Get the letters and occurrences
letters = [letter for letter, occurrences in sorted_letters]
occurrences = [occurrences for letter, occurrences in sorted_letters]

# Print the letters count: 
# Print the letters count: 
print("Letters count:", len(letters))

BFR = math.ceil(math.log2(len(letters)))
print("Bits for representation:", BFR)
```]

Desta forma, o vetor `letters` contém todos os caracteres contidos no arquivo de texto, enquanto o vetor `occurrences` contém a quantidade de ocorrências de cada caractere.

Também podemos notar que com base na impressão de "letters count", o arquivo contem 91 caracteres distintos, necessitando de 91 símbolos diferentes para representar cada caractere, portanto, a codificação mais simples precisará de 7 bits (2^7 = 128) para representar todos os caracteres.

== Análise dos caracteres contidos

Na sequencia, é possível analisar a quantidade de ocorrências de cada caractere contido no arquivo de texto. Para isso, foi aplicado um plot de barras, onde o eixo x representa os caracteres e o eixo y representa a quantidade de ocorrências de cada caractere. O código abaixo realiza essa operação:

#sourcecode[```python
sorted_letters = [letter for _, letter in sorted(zip(occurrences, letters), reverse=True)]

sorted_occurrences = [occurrence for occurrence, _ in sorted(zip(occurrences, letters), reverse=True)]

plt.figure(figsize=(16,9))
plt.bar(sorted_letters, sorted_occurrences)
plt.yscale("log")
plt.xlabel("Letters")
plt.ylabel("Occurrences")
plt.title("Ocurrences of each Character (Log Scale)")
plt.show( )

```]

Com base neste código, é gerado a seguinte figura:

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Note que o primeiro caractere mais frequente é o espaço, seguido pelas letras "e", "t", "a" e "o".

Nota: Após o caracter "u", aparentemente outro caracter espaço está sendo representado, porém, esse representa o caracter de quebra de linha ("/n"). 

== Calculo do percentual individual 

Com base na quantidade de ocorrências de cada caractere, é possível calcular o percentual de cada caractere em relação ao total de caracteres contidos no arquivo de texto. 

Para isso, calculamos a quantidade total de caracteres lidos, e determinamos a razão entre a quantidade de ocorrências de cada caractere e o total de caracteres. O código abaixo realiza essa operação:

Total de caracteres: 163919

#sourcecode[```python
# sum all the occurrences of the letters and create a graph with the percentage of each letter

# Get the total number of letters
total_letters = sum(occurrences)
print("Total letters:", total_letters)

# Calculate the percentage of each letter
def percentage(occurrences, total):
    return [occurrence / total for occurrence in occurrences]

percentages = percentage(occurrences, total_letters)

# sort the letters by occurrences to make the graph more readable
sorted_letters = [letter for _, letter in sorted(zip(occurrences, letters), reverse=True)]
sorted_percentages = [percentage for _, percentage in sorted(zip(occurrences, percentages), reverse=True)]

# Create the gprint("Letters:", letters) graph
plt.figure(figsize=(16,9))
plt.bar(sorted_letters, sorted_percentages)
plt.xlabel("Letter")
plt.ylabel("Percentage")
plt.title("Percentage of each Character (Log Scale)")
plt.yscale("log")
plt.show()
```]

Dessa forma é possível visualizar a porcentagem de cada caractere em relação ao total de caracteres contidos no arquivo de texto, conforme apresentado abaixo: 

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Calculando a PMF (Probability Mass Function)

Com base na lista de caracteres e seus respectivos percentuais, é possível calcular a Função de Massa de Probabilidade (PMF) de cada caractere. Para isso, é necessário criar um dicionário contendo o caractere e seu respectivo percentual. O código abaixo realiza essa operação:

#sourcecode[```python
# create a pmf vector with the percentage of each letter

pmf = {letter: percentage for letter, percentage in zip(letters, percentages)}
print("PMF:", list(pmf.values()))

# Calculate the huff code
huff = komm.HuffmanCode(list(pmf.values()))

# Print the huff code values and the huff ratio
print("Huffman code:", huff.codewords)
print("Huff Ratio:", huff.rate(list(pmf.values())))
print("Compress Ratio:", BFR - huff.rate(list(pmf.values())))
```]

Com base nisso, podemos determinar o codigo de huffmann para cada caractere com base em sua participação do percentual total. Além disso, podemos determinar parâmetros resultantes do codigo de huffmann, como o huff ratio e a taxa de compressão: 

Huff Ratio: 4.643275
Compress Ratio: 2.356724

Dessa forma, podemos ver que o código aplicado foi capaz de reduzir a quandidate de bits necessária para representar os caracteres do arquivo em 2.35 bits (média). 

== Indexação dos caracteres 

Em seguida, é necessário criar uma indexação do caractere e sua respectiva letra, de forma que cada caractere seja representado por um índice. O código abaixo realiza essa operação: 

#sourcecode[```python
index = {i: letter for i, letter in enumerate(letters)}for i in range(len(letters)):
    print(letters[i], occurrences[i])

print ("Index:", index)
```]

== Aplicando codificação sobre o texto

Com base nesta indexação, é possível codificar o texto original, de forma que cada caractere seja representado por um índice. O código abaixo realiza essa operação. De forma que inicialmente o texto é "codificado" pelo index, transformando cada caractere em uma letra, e posteriormente é aplicado o código de huffman sobre o texto codificado.

#sourcecode[```python
# encode the text using the index to create a integer index of the letters in the text

encoded_text = [list(index.keys())[list(index.values()).index(letter)] for letter in text]

print("Encoded text (by index):", encoded_text)

# create a huffman code for the encoded text
huff_encoded = huff.encode(encoded_text)

print("Huffman encoded text:", huff_encoded)
```]

== Imprime o arquivo codificado

Por fim, é possível imprimir o arquivo codificado, de forma que cada caractere seja representado por um índice. O código abaixo realiza essa operação:

#sourcecode[```python
# export the huffman code to a file.
with open("huff_encoded.com2", "w") as file:
    file.write("".join(map(str, huff_encoded)))
```]

= Analisando o arquivo codificado

Por fim, é possível analisar o arquivo codificado, de forma que cada caractere seja representado por um índice. O código abaixo realiza essa operação:

#sourcecode[```bin
00000001011011110001011111000111000000100101011101010001000001011101101010
10011110110001010111000110101011110000000111010001000011110110000111110101
11010110111000101001110000101011101011000000001011110110100101010001111100
00111001011000000110110001011011001110001101101100110110110000000001011011
10000001111000101010001000011110111000000101111110000001101001101111101010
00011111000011111100110110111011000101111110011011011101010110110111100011
11111001011010011011110000000010001011110001001110110000000011000100100101
00111000011001101101100101001100000001010010000100110111100011000100010010
00110100000011000011111010011011110101101000000110110101100100101001011100
00101001000000010100100110110110001011011000100110110010110110100110000000
10100101110000001111100001010000011110001010001001100100010110000101011011
01100101000000110001110000001011100011000100101111000101011010011001011101
01010010000001000011101110001000101011100000000101111100010010010101101001
01110110000001100011111101010000111111000100101011011011001110001101001101
11101001110001110100100001100001111101001101111000101111100011100000010010
10111010100010000010111011010101001111011000101011100011010101000000011111
[...]
```]

= Decodificando o arquivo

== Leitura do arquivo codificado

Para decodificar o arquivo, é necessário realizar a leitura do arquivo codificado e aplicar o algoritmo de Huffman para decodificar o texto. O código abaixo realiza essa operação:

#sourcecode[```python
# read the huffman code from the file

with open("huff_encoded.com2", "r") as file:
    huff_encoded = file.read()

# decode the huffman code
huffDecode = komm.HuffmanCode(list(pmf.values()))
print("Huffman code:", huffDecode.codewords)
```]

Com base no codigo acima, deve-se obter as palavras código utilizadas originalmente para codificar o texto.

== Decodificação do arquivo por huffmann: 

Tendo as palavras código e o texto codificado, é possivel decodificar o texto original. Esse processo e realizado através do código abaixo:

#sourcecode[```python
# Decode the encoded text

# Convert the string back to a list of integers
huff_encoded_list = list(map(int, huff_encoded))

decoded_text = huffDecode.decode(huff_encoded_list)

# print more values of the decoded text
print("Decoded text:", decoded_text[:100])
```]

O texto decodificado é apresentado abaixo, note que ainda não é possivel ler pois o texto esta estruturado com base em um index de cada letra correspondente. 

#sourcecode[```text 
90 46 63 60  1 42 73 70 65 60 58 75  1 33 76 75 60 69 57 60 73 62  1 60
28 70 70 66  1 70 61  1 27 67 64 58 60  6 74  1 27 59 77 60 69 75 76 73
60 74  1 64 69  1 49 70 69 59 60 73 67 56 69 59  0  1  1  1  1  0 46 63
64 74  1 60 57 70 70 66  1 64 74  1 61 70 73  1 75 63 60  1 76 74 60  1
70 61  1 56
```]

== Aplicando a indexação inversa:

Dessa forma, para resolver o problema de leitura do texto decodificado, é necessário aplicar a indexação inversa, de forma que cada índice seja representado por um caractere. Abaixo está o index utilizado no processo de codificação (gerado automaticamente durante a codificação).

#sourcecode[```text
0: '\n', 1: ' ', 2: '!', 3: '#', 4: '$', 5: '%', 6: "'", 7: '(', 8: ')' 
9: '*', 10: ',', 11: '-', 12: '.', 13: '/', 14: '0', 15: '1', 16: '2', 
17: '3', 18: '4', 19: '5', 20: '6', 21: '7', 22: '8', 23: '9', 24: ':', 
25: ';', 26: '?', 27: 'A', 28: 'B', 29: 'C', 30: 'D', 31: 'E', 32: 'F', 
33: 'G', 34: 'H', 35: 'I', 36: 'J', 37: 'K', 38: 'L', 39: 'M', 40: 'N', 
41: 'O', 42: 'P', 43: 'Q', 44: 'R', 45: 'S', 46: 'T', 47: 'U', 48: 'V', 
49: 'W', 50: 'X', 51: 'Y', 52: 'Z', 53: '[', 54: ']', 55: '_', 56: 'a', 
57: 'b', 58: 'c', 59: 'd', 60: 'e', 61: 'f', 62: 'g', 63: 'h', 64: 'i', 
65: 'j', 66: 'k', 67: 'l', 68: 'm', 69: 'n', 70: 'o', 71: 'p', 72: 'q', 
73: 'r', 74: 's', 75: 't', 76: 'u', 77: 'v', 78: 'w', 79: 'x', 80: 'y', 
81: 'z', 82: 'ù', 83: '—', 84: '‘', 85: '’', 86: '“', 87: '”', 88: '•', 
89: '™', 90: '\ufeff'}
```]

Esse index é aplicado no código abaixo para realizar a indexação inversa do texto, retornando-o em palavras. 

#sourcecode[```python
# use the index to convert the integers back to letters, the index need to check all the values of the index to find the letter

decoded_text = [index[i] for i in decoded_text]

print("Decoded text:", decoded_text[:100])
```]

== Exportando decodificado em um arquivo: 

Por fim, é possível exportar o texto decodificado para um arquivo de texto. O código abaixo realiza essa operação:

#sourcecode[```python
# print the text into a file "huff_decoded.txt"

with open("huff_decoded.txt", "w") as file:
    file.write("".join(decoded_text))
```]

= Conclusão

Neste relatório, foi apresentado um estudo sobre o algoritmo de Huffman, incluindo a leitura de um arquivo de texto, a contagem de ocorrências de cada caractere, a análise dos caracteres contidos no arquivo, o cálculo do percentual de cada caractere, a criação de uma Função de Massa de Probabilidade (PMF), a aplicação do algoritmo de Huffman sobre o texto, a codificação do texto e a análise do arquivo codificado.

O algoritmo de Huffman é um método de compressão de dados que utiliza a codificação de caracteres para reduzir o tamanho de um arquivo. O algoritmo foi desenvolvido por David A. Huffman em 1952, e é amplamente utilizado em sistemas de comunicação e armazenamento de dados.