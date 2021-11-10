# Conceitos de Linguagem de Programação 2021/2

### Trabalho

Para atingir os objetivos do trabalho, realizei várias mudanças nos arquivos originais, descritas abaixo de forma detalhada.

**Cálculo do tempo:**

Para cálcular o tempo, foi requerido o uso do gettimeofday, que retorna a hora do relógio do sistema. Dessa forma, é necessário pegar a hora no momento inicial da execução e no fim do processo, na função main. Adicionei em todos os arquivos .C utilizados para o trabalho as funções e estruturas descritas abaixo:

```c
/* Import da biblioteca time do próprio sys */
#include <sys/time.h>

/* Função para calcular o tempo, fazendo a diferença entre o momento inicial e final, utilizando a informação de segundos da estrutura */
float time_diff(struct timeval *start, struct timeval *end){
    return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
}

int main() {
    /* Definições das estruturas inicias */
    struct timeval current_time;
    struct timeval final_time;
    
    /* Gettime no início do programa */
    gettimeofday(&current_time, NULL);
    
   /*
    * Execução do programa
    * ...
    */
    
    /* Gettime no fim da execução */
    gettimeofday(&final_time, NULL);
    
    /* Print do tempo gasto */
    printf("time spent: %0.8f sec\n", time_diff(&current_time, &final_time));
}
```

**Prints desnecessários:**

Além da implementação do gettimeofday, removi todos os prints das funções para facilitar na hora de rodar os programas várias vezes e ter os dados do tempo de forma simplificada.

**Makefile:**

Ajustei o arquivo config/suite.def para conter todos os algoritmos necessários para o trabalho e suas respectivas classes. No momento estou utilizando IS, EP, CG, MG e FT e as classes S e W. Portanto para gerar todos eles na pasta bin, basta apenas rodar:

```sh
make suite
```

Caso queira modificar, basta modificar o arquivo suite.def e rodar novamente o make.

Fiz uma função para limpar todos os arquivos da pasta bin utilizando:

```sh
make cleanbin
```

### Descrição do trabalho

**Objetivo:** estudar e compreender o impacto de diferentes estratégias de otimização de código no desempenho do programa.

**Material a ser utilizado:**
- Benchmark NPB, em sua versão serial
    - O arquivo anexo contém a versão serial do benchmark, a versão apresentada é uma variação da disponibilizada pela NASA. Essa versão é o arquivo que tem -CLP no nome. O outro é o original, em OpenMP.
    - Nesta versão, a implementação é 
    - Os programas a serem considerados são IS, EP, CG, MG e FT
    - Existe o conceito, no NPB, de classe de problema. Cada classe corresponde a um tamanho de problema, sendo a CLASS=S o menor, CLASS=W o segundo menor e as demais são A, B e C, nessa ordem
- Compilador C GCC
- Ferramenta de instrumentação Valgrind
- O Valgrind não é padrão no Linux, mas pode ser facilmente instalado.

**Metodologia**: Comparar o desempenho dos programas utilizando diferentes opções de otimização do compilador (-O2 e -O3), frente a compilação sem uso de opção de otimização. Executem os programas, façam as coletas dos dados, apresentem os resultados na forma de tabelas e/ou gráficos e justifiquem a diferença nos resultados. A justificativa é importante! Ela deve estar baseada na análise do resultado em função do que a opção de otimização se propõe a otimizar.
Métricas de desempenho:

- Tempo de execução (utilize a primitiva gettimeofday, não o comando time)
- Número de caches hits/misses (utilize a extensão Cachegrind do Valgrind)

**Importante:** As métricas de desempenho deverão ser médias representativas de pelo menos 30 execuções de cada caso.

**Importante 2:** A média de um caso é representativa se as amostras coletadas aderirem a uma normal. O teste de Kolmogorov-Smirnof permite avaliar se a distribuição é normal. Duas médias que aderirem a uma normal podem ser comparadas e, com um grau de confiança, indicado se é possível dizer se um dos casos é melhor do que o outro. O teste T permite comparar médias cujas amostras formem uma curva aderente a uma curva normal.
