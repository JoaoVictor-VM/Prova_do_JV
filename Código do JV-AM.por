programa
{
	inclua biblioteca Util --> ut
	inclua biblioteca Arquivos --> aq
	inclua biblioteca Tipos --> tp
	
	funcao inicio()
	{
		cadeia caminho = caminhoDoArquivo()
		inteiro numPrincipal = entradaInteiro("Insira o número que será trabalhado: ")
		cadeia texto 
		inteiro arquivo = 0
		cadeia matriz[5][2] ={{"Aluno: ","João Victor O.D COsta"},
						{"Professor: ","Lucas Francisco Gois Paixão"},
						{"Unidade Curricular: ","Lógica de Programação"},
						{"Data: ","18/04/2024"},
						{"Nota: ","      "}
							}
		//deleta conteudo anterior
		arquivo = aq.abrir_arquivo(caminho, aq.MODO_ESCRITA)
		aq.escrever_linha("", arquivo)
		aq.fechar_arquivo(arquivo)
		arquivo = aq.abrir_arquivo(caminho, aq.MODO_ACRESCENTAR)
		
		//escreve tabuada
		escreva("=========Tabuada=========\n")
		aq.escrever_linha("=========Tabuada=========", arquivo)
		para(inteiro i = 1; i <= 10; i++){
			texto = numPrincipal+" • "+i+" = "+(numPrincipal*i)
			escreva(texto, "\n")
			aq.escrever_linha(texto,arquivo)
			ut.aguarde(500)
		}
		//número por número
		texto = ""
		escreva("=========Número Por Número=========\n")
		aq.escrever_linha("=========Número Por Número=========", arquivo)
		para(inteiro i = 1; i <= numPrincipal; i++){
			texto += i
			escreva(texto,"\n") 
			aq.escrever_linha(texto,arquivo)
			ut.aguarde(500)
		}
		//matriz da nota
		escreva("========MATRIZ DE NOTA=========\n")
		escrevaMatriz(matriz, 5, 2)
		aq.escrever_linha("========MATRIZ DE NOTA=========", arquivo)
		matriz[4][1] = entradaBaseCadeia("Insira a nota boa do aluno aqui: ")
		passeMatriz(matriz, 5, 2,caminho, 1)
		aq.fechar_arquivo(arquivo)
		
	}
	//passa a matriz para arquivo
	funcao passeMatriz(cadeia mat[][], inteiro Lin,inteiro Col, cadeia caminho, inteiro id){
		inteiro arquivo = 0
		escolha(id){
			//MODO ESCRITA
			caso 0:
				arquivo = aq.abrir_arquivo(caminho, aq.MODO_ESCRITA)//variável arquivo recebe permissão para abrir e somente escrever no arquivo com matrizes
				pare
			//MODO ACRESCENTAR 
			caso 1:
				arquivo = aq.abrir_arquivo(caminho, aq.MODO_ACRESCENTAR)//variável arquivo recebe permissão para abrir e somente acrescentar no arquivo com matrizes
				pare
		}
		//loop for para linhas
		para(inteiro i = 0; i < Lin; i++){
			cadeia linha = ""//linha é sempre limpa
			//loop for para colunas
			para(inteiro j = 0; j < Col; j++){
				linha += "|"+mat[i][j]+"|"//linha acrescenta a si o valor da matriz
			}
			aq.escrever_linha(linha, arquivo)//escreve a linha no arquivo e pula pra próxima
		}
		aq.fechar_arquivo(arquivo)//fechar arquivo
	}

	//função para entrada de cadeia
	funcao cadeia entradaBaseCadeia( cadeia texto){
     	cadeia opcao = ""
          caracter saida = ' '//Váriavel de saída.
          //Faça-enquanto para verificar a entrada do usuário.
          faca {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(opcao)//Parâmetro opçao recebe valor do usuário.
               //Se opcao for real ou inteiro ou vazio.
               se (tp.cadeia_e_real(opcao) == verdadeiro ou tp.cadeia_e_inteiro(opcao, 10) == verdadeiro ou opcao == "")
               {
                    //Opcão inválida.
                    escreva("Opção inválida!! Por favor, somente nomes ou palavras.\n")
               }
               senao
               {
				saida = 'e'//Variável saida recebe valor de saída.
               }
          }
          enquanto (saida != 'e')//Repete enquanto variável saida não tiver valor de saída.
		//Retorna a valor de entrada do usuário.
          retorne opcao
     }
	
	//função para escrever matriz
	funcao escrevaMatriz(cadeia mat[][], inteiro Lin, inteiro Col){
		//loop for para linha
		para(inteiro i = 0; i < Lin; i++){
			//loop for para coluna
			para(inteiro j = 0; j < Col; j++){
				//escreve o valor da matriz em linha e coluna
				escreva("|",mat[i][j],"|")	
			}
			ut.aguarde(500)
			escreva("\n")//quebra a linha
			
		}
	}
	
	//função para receber o caminho do arquivo
	funcao cadeia caminhoDoArquivo(){
		cadeia entrada = ""//cadeia que recebe caminho do usuário
		inteiro saidaLoop = 0
		//faz enquanto o valor saidaloop != 1
		faca{
			escreva("Escolha o arquivo que deseja armazenar os dados.\n")
			cadeia tiposArq[2] = {"Arquivo de texto|txt","Arquivo de texto|txt"}
			entrada = aq.selecionar_arquivo(tiposArq, verdadeiro) //recebe caminho do usuário
			//se caminho é válido
			se(aq.arquivo_existe(entrada) == verdadeiro){
				saidaLoop = 1//sai do loop
			}
			//senão, o caminho é inválido
			senao{
				escreva("Caminho inválido!! Insira um caminho que possua um arquivo que exista!!\n")
			}
		}enquanto(saidaLoop != 1)
		//retorna caminho
		retorne entrada
		
	}
	
	//função para entrada de inteiro
	funcao inteiro entradaInteiro(cadeia texto){
     	cadeia entrada = ""
     	inteiro saida = 0
          inteiro saidaLoop = 0//Váriavel de saída.
          //Faça-enquanto para verificar a entrada do usuário.
          faca {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(entrada)//Parâmetro opçao recebe valor do usuário.
               //Se opcao for real ou inteiro ou vazio.
               se (tp.cadeia_e_inteiro(entrada, 10) == verdadeiro)
               {
                    saida = tp.cadeia_para_inteiro(entrada, 10)
                    saidaLoop = 1//Variável saida recebe valor de saída.
               }
               senao
               {	
               	escreva("Opção inválida!! Por favor, somente números inteiros.\n")
				
               }
          }
          enquanto (saidaLoop != 1)//Repete enquanto variável saida não tiver valor de saída.
		//Retorna a valor de entrada do usuário.
          retorne saida
     }
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 751; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */