// Course: Telecom engineering
// Name: Cadore-AC

// ----------------------------------------------------
// Challange: MTM2.2
// ----------------------------------------------------

#include <stdio.h>

int contagem = 1;

float media_vetor(int x[], int tamanho)
{
    int i = 0;

    float soma = 0, soma_harmonica = 0;

    for (i == 0; i < tamanho; i++)
    {
        if (x[i] == 0)
            return 0;

        else
            soma = (float)1 / x[i] + soma;
    };

    soma_harmonica = (float)tamanho / soma;

    return soma_harmonica;
};

int compara_vetores(int x[], int y[], int tamanhoVetor)
{
    float x1, x2;

    x1 = media_vetor(x, tamanhoVetor);
    x2 = media_vetor(y, tamanhoVetor);

    switch (contagem)
    {
    case 1:
        printf("\n\nValor da média harmônica do vetor 'Z' = %f\n", x1);
        printf("Valor da média harmônica do vetor 'W' = %f\n\n", x2);

        if (x1 == 0 || x2 == 0)
            return -2;
        else
            return 3;

        break;

    case 2:
        if (x1 == x2)
            return 0;
        else
            return 3;
        break;

    case 3:
        if (x1 > x2)
            return 1;
        else
            return 3;
        break;

    case 4:
        if (x1 < x2)
            return -1;
        else
            return 3;
        break;
    };
};

int main()
{

    int output, x, h = 0;

    int arr1[x], arr2[x];

    printf("\nEnter the size of the arrays 'X' = ");
    scanf("%d", &x);

    for (int i = 0; i < x; i++)
    {
        printf("\nEnter the value position (%d) of the array 'Z' = ", i);
        scanf("%d", &h);
        arr1[i] = h;
    };

    for (int l = 0; l < x; l++)
    {
        printf("\nEnter the value position (%d) of the array 'X' = ", l);
        scanf("%d", &h);
        arr2[l] = h;
    };

    //int z[5] = {4, 8, 5, 7, 2}, w[5] = {4, 8, 8, 7, 2};

    for (contagem = 1; contagem <= 4; contagem++)
    {
        output = compara_vetores(arr1, arr2, x);

        if (output != 3)
        {
            printf(
                "Retorno da comparação das médias dos vetores 'Z' e 'W' = "
                "%d\n\n",
                output);

            break;
        };
        output == 0;
    }
}
